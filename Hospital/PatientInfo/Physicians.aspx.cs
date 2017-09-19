using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_PatientInfo_Physicians : System.Web.UI.Page
{
	static string cpid = null;
	static string pid = null;

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
					PName.Text = p.PatientName;
					PBed.Text = (p.CurrentBedNo == null) ? "Unoccupied" : p.CurrentBedNo;

					MultiView1.ActiveViewIndex = 0;

					Repeater1.DataSource = from r in myEntities.Physician__Patient
										   join cp in myEntities.Physician__Profile on r.CP_ID equals cp.Physician_ID
										   where r.P_ID == pid
										   select new { r.CP_ID, cp.Name };
					Repeater1.DataBind();
					
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

		Response.Redirect(String.Format("~/Hospital/PatientInfo/Physicians.aspx?PID={0}", PID));
	}

	protected void PhSearch_Click(object sender, EventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			var hid = (from r in myEntities.Hospital__Staff
					   where r.Staff_ID == Profile.UserName
					   select r.H_ID).SingleOrDefault();

			cpid = (from r in myEntities.Hospital__Physician
					where (r.CP_ID == PhSearchBox.Text && r.H_ID == hid)
					select r.CP_ID).SingleOrDefault();

			if (cpid != null)
			{
				Result.Text = "ID: " + cpid + "\tName: " + Profile.GetProfile(cpid).Name;
				ResultPanel.Visible = true;
				Notification.Visible = false;
			}
			else
			{
				Notification.Text = "Physician with ID: " + PhSearch.Text + " does not exist, or is not " +
					"attached to this hospital.";
				Notification.Visible = true;
			}
		}
	}

	protected void Insert_Click(object sender, EventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			try
			{
				Physician__Patient relation = new Physician__Patient();
				relation.CP_ID = cpid;
				relation.P_ID = pid;

				relation.UpdatedBy = Profile.UserName;
				relation.UpdateDateTime = DateTime.Now;
				relation.UpdateUserName = Profile.Name;

				myEntities.AddToPhysician__Patient(relation);
				myEntities.SaveChanges();
			}
			catch (Exception ex)
			{
				Notification.Text = ex.Message;
			}
		}

		Response.Redirect(String.Format("~/Hospital/PatientInfo/Physicians.aspx?PID={0}", RegID.Text));
	}

	protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			try
			{
				

				if (e.CommandName == "Delete")
				{
					string cp_id = ((Literal)e.Item.FindControl("CPID")).Text;
					Physician__Patient cp = (from r in myEntities.Physician__Patient
											 where (r.CP_ID == cp_id && r.P_ID == pid)
											 select r).SingleOrDefault();
					myEntities.DeleteObject(cp);
					myEntities.SaveChanges();
				}

				Response.Redirect(String.Format("~/Hospital/PatientInfo/Physicians.aspx?PID={0}", pid));
			}
			catch (Exception ex)
			{
				//notify = true;
				//note = ex.Message;
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