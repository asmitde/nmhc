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

public partial class Hospital_Management_NewStaff : System.Web.UI.Page
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
				// Create account and assign selected role
				string pswd = Password.Text;
				if (RndPswd.Checked)
				{
					pswd = Membership.GeneratePassword(Membership.MinRequiredPasswordLength,
						Membership.MinRequiredNonAlphanumericCharacters);
				}

				Membership.CreateUser(UserName.Text, pswd, Email.Text);
				ProfileCommon pc = new ProfileCommon();
				pc.Initialize(UserName.Text, true);
				pc.Name = StaffName.Text;
				pc.Save();
				Roles.AddUserToRole(UserName.Text, RoleList.SelectedValue);


				// Send account confirmation email
				string fileName = Server.MapPath("~/App_Data/AccountConfirmation.txt");
				string mailBody = File.ReadAllText(fileName);
				mailBody = mailBody.Replace("##Name##", StaffName.Text);
				mailBody = mailBody.Replace("##Role##", RoleList.SelectedValue);
				mailBody = mailBody.Replace("##Username##", UserName.Text);
				mailBody = mailBody.Replace("##Password##", pswd);

				MailMessage emailMessage = new MailMessage();
				emailMessage.Subject = "New Account Confirmation";
				emailMessage.Body = mailBody;
				emailMessage.From = new MailAddress("nmhc@gmail.com", "NMHC");
				emailMessage.To.Add(new MailAddress(Email.Text, StaffName.Text));

				SmtpClient mySmtpClient = new SmtpClient();
				mySmtpClient.Send(emailMessage);


				// Register above staff
				using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
				{
					Hospital__Staff profile = new Hospital__Staff();
					profile.Staff_ID = UserName.Text;
					profile.StaffName = StaffName.Text;
					profile.Email = Email.Text;
					string h_id = (from r in myEntities.Hospital__Staff
								   where r.Staff_ID == Profile.UserName
								   select r.H_ID).SingleOrDefault();
					if (h_id == null)
						h_id = Profile.UserName;

					profile.H_ID = h_id;
					profile.UpdatedBy = Profile.UserName;
					profile.UpdateUserName = Profile.Name;
					profile.UpdateDateTime = DateTime.Now;

					myEntities.AddToHospital__Staff(profile);
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
					var profile = (from r in myEntities.Hospital__Staff
								   where r.Staff_ID == UserName.Text
								   select r).SingleOrDefault();
					if (profile != null)
					{
						myEntities.Hospital__Staff.DeleteObject(profile);
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


	protected void StaffIDInvalid_ServerValidate(object source, ServerValidateEventArgs args)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			var profile = (from record in myEntities.Hospital__Staff
						   where record.Staff_ID == UserName.Text
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
		// Redirect to edit staff profile page
		Response.Redirect(String.Format("~/Hospital/Management/StaffProfile.aspx?SID={0}", UserName.Text));
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

	protected void HospitalInfo_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/Hospital/Management/EditInfo.aspx");
	}

	protected void NewStaff_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/Hospital/Management/NewStaff.aspx");
	}

	protected void StaffProfile_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/Hospital/Management/StaffProfile.aspx");
	}

	protected void Physicians_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/Hospital/Management/Physicians.aspx");
	}

	protected void Departments_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/Hospital/Management/Departments.aspx");
	}

	protected void Beds_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/Hospital/Management/Beds.aspx");
	}

	protected void Investigations_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/Hospital/Management/Investigations.aspx");
	}
}