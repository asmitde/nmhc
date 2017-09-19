using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Account_Register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
		if (!Page.IsPostBack)
		{
			if (!User.IsInRole("Administrator"))
			{
				Response.Redirect("~/Account/Login.aspx");
			}
		}
    }

	protected void Register_Click(object sender, EventArgs e)
	{
		if (Page.IsValid)
		{
			try
			{
				// Create account for hospital
				string pswd = Password.Text;
				if (RndPswd.Checked)
				{
					pswd = Membership.GeneratePassword(Membership.MinRequiredPasswordLength,
						Membership.MinRequiredNonAlphanumericCharacters);
				}

				Membership.CreateUser(UserName.Text, pswd, Email.Text);
				ProfileCommon pc = new ProfileCommon();
				pc.Initialize(UserName.Text, true);
				pc.Name = HospitalName.Text;
				pc.Save();
				Roles.AddUserToRole(UserName.Text, "Hospital Superuser");


				// Send account confirmation email
				string fileName = Server.MapPath("~/App_Data/AccountConfirmation.txt");
				string mailBody = File.ReadAllText(fileName);
				mailBody = mailBody.Replace("##Name##", HospitalName.Text);
				mailBody = mailBody.Replace("##Role##", "Hospital Superuser");
				mailBody = mailBody.Replace("##Username##", UserName.Text);
				mailBody = mailBody.Replace("##Password##", pswd);

				MailMessage emailMessage = new MailMessage();
				emailMessage.Subject = "New Account Confirmation";
				emailMessage.Body = mailBody;
				emailMessage.From = new MailAddress("nmhc@gmail.com", "NMHC");
				emailMessage.To.Add(new MailAddress(Email.Text, HospitalName.Text));

				SmtpClient mySmtpClient = new SmtpClient();
				mySmtpClient.Send(emailMessage);

				// Register hospital superuser
				using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
				{
					Hospital__Profile hospital = new Hospital__Profile();
					hospital.Hospital_ID = UserName.Text;
					hospital.HospitalName = HospitalName.Text;
					hospital.Email = Email.Text;

					hospital.UpdatedBy = Profile.UserName;
					hospital.UpdateUserName = Profile.Name;
					hospital.UpdateDateTime = DateTime.Now;

					myEntities.AddToHospital__Profile(hospital);
					myEntities.SaveChanges();
				}

				Notification.Text = "Your account has been created successfully. " +
					"An email has been sent to " + Email.Text + " containing your Username and Password.";
			}
			catch (Exception ex)
			{
				Notification.Text = ex.Message;
				Back.Visible = true;
				Continue.Visible = false;

				// Delete partially created user data in case of exception
				using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
				{
					var hospital = (from r in myEntities.Hospital__Profile
								   where r.Hospital_ID == UserName.Text
								   select r).SingleOrDefault();
					if (hospital != null)
					{
						myEntities.Hospital__Profile.DeleteObject(hospital);
					}
					myEntities.SaveChanges();
				}

				if (Membership.GetUser(UserName.Text) != null)
				{
					Membership.DeleteUser(UserName.Text, true);
				}
			}

			MultiView1.ActiveViewIndex = 1;
		}
	}


	protected void HospitalIDInvalid_ServerValidate(object source, ServerValidateEventArgs args)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			var profile = (from record in myEntities.Hospital__Profile
						   where record.Hospital_ID == UserName.Text
						   select record).SingleOrDefault();

			if (profile != null)
			{
				args.IsValid = false;
			}
			else
			{
				args.IsValid = true;
			}
		}
	}

	protected void Continue_Click(object sender, EventArgs e)
	{
		// Redirect to edit hospital profile page
		Response.Redirect(String.Format("~/Hospital/Management/EditInfo.aspx?HID={0}", UserName.Text));
	}

	protected void Back_Click(object sender, EventArgs e)
	{
		MultiView1.ActiveViewIndex = 0;
	}

	protected void RndPswd_CheckedChanged(object sender, EventArgs e)
	{
		bool ch = !RndPswd.Checked;

		PasswordLabel.Visible = ch;
		Password.Visible = ch;
		PasswordRequired.Visible = ch;
		PasswordRequired.Enabled = ch;
		ConfirmPasswordLabel.Visible = ch;
		ConfirmPassword.Visible = ch;
		ConfirmPasswordRequired.Visible = ch;
		ConfirmPasswordRequired.Enabled = ch;
		PasswordCompare.Visible = ch;
		PasswordCompare.Enabled = ch;

	}
}
