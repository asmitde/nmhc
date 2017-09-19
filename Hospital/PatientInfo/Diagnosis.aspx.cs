using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_PatientInfo_Diagnosis : System.Web.UI.Page
{
    string pid = null;
	
	protected void Page_Load(object sender, EventArgs e)
    {
		pid = Request.QueryString.Get("PID");
		if (!Page.IsPostBack && pid != null)
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				// Select patient based on registration id
				var p = (from r in myEntities.Patient__Profile
						 where r.Registration_ID == pid
						 select r).SingleOrDefault();

				string hid = (from r in myEntities.Hospital__Staff
							  where r.Staff_ID == Profile.UserName
							  select r.H_ID).SingleOrDefault();

				if (p != null && p.H_ID == hid)
				{
					RegID.Text = pid;
					PName.Text =  p.PatientName;
					PBed.Text = (p.CurrentBedNo == null) ? "Unoccupied" : p.CurrentBedNo;

					MultiView1.ActiveViewIndex = 0;

					Diagnosis.Text = p.Diagnosis;
				}
				else
				{
					MultiView1.ActiveViewIndex = 1;
				}
			}
		}
    }

	protected void Search_Click(object sender, EventArgs e)
	{
		string PID = SearchBox.Text;

		if (SearchBy.SelectedIndex == 1)
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				PID = (from r in myEntities.Patient__Profile
					   where r.CurrentBedNo == PID
					   select r.Registration_ID).SingleOrDefault();
			}
		}

		Response.Redirect(String.Format("~/Hospital/PatientInfo/Diagnosis.aspx?PID={0}", PID));
	}

	protected void Save_Click(object sender, EventArgs e)
	{
		if (Page.IsValid)
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				Patient__Profile profile;
				if (pid != null)
				{
					profile = (from r in myEntities.Patient__Profile
							   where r.Registration_ID == pid
							   select r).SingleOrDefault();

					if (profile != null)
					{
						profile.Diagnosis = Diagnosis.Text;

						profile.UpdateDateTime = DateTime.Now;
						profile.UpdatedBy = Profile.UserName;
						profile.UpdateUserName = Profile.Name;
						myEntities.SaveChanges();

						Notification.Text = "Changes saved successfully.";
						System.Threading.Thread.Sleep(10000);
						Notification.Text = null;
					}
					else
					{
						MultiView1.ActiveViewIndex = 1;
					}
				}
				else
				{
					MultiView1.ActiveViewIndex = 1;
				}
			}
		}

	}

	protected void ViewProfile_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/Hospital/PatientInfo/Default.aspx?PID={0}", RegID.Text));
	}
	protected void EditProfile_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/Hospital/PatientInfo/EditInfo.aspx?PID={0}", RegID.Text));
	}
	protected void Physicians_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/Hospital/PatientInfo/Physicians.aspx?PID={0}", RegID.Text));
	}
	protected void Diagnosis_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/Hospital/PatientInfo/Diagnosis.aspx?PID={0}", RegID.Text));
	}
}