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

public partial class Physician_NewPhysician : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			if (!User.IsInRole("Administrator") && !User.IsInRole("Hospital Superuser") && !User.IsInRole("Hospital Management"))
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
				// Create account and assign role 'Consultant Physician'
				string pswd = Password.Text;
				if (RndPswd.Checked)
				{
					pswd = Membership.GeneratePassword(Membership.MinRequiredPasswordLength,
						Membership.MinRequiredNonAlphanumericCharacters);
				}

				Membership.CreateUser(UserName.Text, pswd, Email.Text);
				ProfileCommon pc = new ProfileCommon();
				pc.Initialize(UserName.Text, true);
				pc.Name = PhysicianName.Text;
				pc.Save();
				Roles.AddUserToRole(UserName.Text, "Consultant Physician");


				// Send account confirmation email
				string fileName = Server.MapPath("~/App_Data/AccountConfirmation.txt");
				string mailBody = File.ReadAllText(fileName);
				mailBody = mailBody.Replace("##Name##", PhysicianName.Text);
				mailBody = mailBody.Replace("##Role##", "Consultant Physician");
				mailBody = mailBody.Replace("##Username##", UserName.Text);
				mailBody = mailBody.Replace("##Password##", pswd);

				MailMessage emailMessage = new MailMessage();
				emailMessage.Subject = "New Account Confirmation";
				emailMessage.Body = mailBody;
				emailMessage.From = new MailAddress("nmhc@gmail.com", "NMHC");
				emailMessage.To.Add(new MailAddress(Email.Text, PhysicianName.Text));

				SmtpClient mySmtpClient = new SmtpClient();
				mySmtpClient.Send(emailMessage);


				// Register above physician
				using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
				{
					Physician__Profile profile = new Physician__Profile();
					profile.Physician_ID = UserName.Text;
					profile.Name = PhysicianName.Text;
					profile.Email = Email.Text;

					profile.UpdatedBy = Profile.UserName;
					profile.UpdateUserName = Profile.Name;
					profile.UpdateDateTime = DateTime.Now;

					myEntities.AddToPhysician__Profile(profile);
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
					var profile = (from r in myEntities.Physician__Profile
								   where r.Physician_ID == UserName.Text
								   select r).SingleOrDefault();
					if (profile != null)
					{
						myEntities.Physician__Profile.DeleteObject(profile);
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


	protected void PhysicianIDInvalid_ServerValidate(object source, ServerValidateEventArgs args)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			var profile = (from record in myEntities.Physician__Profile
						   where record.Physician_ID == UserName.Text
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
		// Redirect to default physician page
		Response.Redirect(String.Format("~/Physician/Default.aspx?CPID={0}", UserName.Text));
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