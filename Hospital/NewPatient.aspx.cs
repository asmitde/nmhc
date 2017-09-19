using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Mail;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_NewPatient : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
    {
		if (!Page.IsPostBack)
		{
			if (!User.IsInRole("Administrator") && !User.IsInRole("Hospital Superuser") && !User.IsInRole("Receptionist"))
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
			// Create account and assign role 'Patient'
				string pswd = Password.Text;
				if (RndPswd.Checked)
				{
					pswd = Membership.GeneratePassword(Membership.MinRequiredPasswordLength,
						Membership.MinRequiredNonAlphanumericCharacters);
				}
				
				Membership.CreateUser(UserName.Text, pswd, Email.Text);
				ProfileCommon pc = new ProfileCommon();
				pc.Initialize(UserName.Text, true);
				pc.Name = PatientName.Text;
				pc.Save();
				Roles.AddUserToRole(UserName.Text, "Patient");


			// Send account confirmation email
				string fileName = Server.MapPath("~/App_Data/AccountConfirmation.txt");
				string mailBody = File.ReadAllText(fileName);
				mailBody = mailBody.Replace("##Name##", PatientName.Text);
				mailBody = mailBody.Replace("##Role##", "Patient");
				mailBody = mailBody.Replace("##Username##", UserName.Text);
				mailBody = mailBody.Replace("##Password##", pswd);

				MailMessage emailMessage = new MailMessage();
				emailMessage.Subject = "New Account Confirmation";
				emailMessage.Body = mailBody;
				emailMessage.From = new MailAddress("nmhc@gmail.com", "NMHC");
				emailMessage.To.Add(new MailAddress(Email.Text, PatientName.Text));

				SmtpClient mySmtpClient = new SmtpClient();
				mySmtpClient.Send(emailMessage);


			// Register above patient
				using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
				{
					Patient__Profile profile = new Patient__Profile();
					profile.Registration_ID = UserName.Text;
					profile.PatientName = PatientName.Text;
					profile.RegistrationDateTime = DateTime.Now;
					profile.Email = Email.Text;
					profile.H_ID = (from r in myEntities.Hospital__Staff
							   where r.Staff_ID == Profile.UserName
							   select r.H_ID).SingleOrDefault();

					profile.UpdatedBy = Profile.UserName;
					profile.UpdateUserName = Profile.Name;
					profile.UpdateDateTime = profile.RegistrationDateTime;

					myEntities.AddToPatient__Profile(profile);
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
					var profile = (from r in myEntities.Patient__Profile
										where r.Registration_ID == UserName.Text
										select r).SingleOrDefault();
					if (profile != null)
					{
						myEntities.Patient__Profile.DeleteObject(profile);
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


	protected void RegistrationIDInvalid_ServerValidate(object source, ServerValidateEventArgs args)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			var profile = (from record in myEntities.Patient__Profile
								   where record.Registration_ID == UserName.Text
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
		// Redirect to edit patient profile page
		Response.Redirect(String.Format("~/Hospital/PatientInfo/EditInfo.aspx?PID={0}", UserName.Text));
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