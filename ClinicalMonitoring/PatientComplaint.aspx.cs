using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class ClinicalMonitoring_PatientComplaint : System.Web.UI.Page
{
	private static string hid = null;

	protected void Page_Load(object sender, EventArgs e)
	{
		string PID = Request.QueryString.Get("PID");

		if (!Page.IsPostBack)
		{
			if (!User.IsInRole("Administrator") && !User.IsInRole("Hospital Superuser") && !User.IsInRole("Hospital Management") && !User.IsInRole("Nurse"))
			{
				Response.Redirect("~/Account/Login.aspx");
			}
			else
			{
				using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
				{
					hid = (from r in myEntities.Hospital__Staff
						   where r.Staff_ID == Profile.UserName
						   select r.H_ID).SingleOrDefault();

					if (hid == null)
					{
						hid = Profile.UserName;
					}
				}
			}

			if (PID != null)
			{
				using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
				{
					var p = (from r in myEntities.Patient__Profile
							 where r.Registration_ID == PID
							 select r).SingleOrDefault();

					if (p != null && p.H_ID == hid)
					{
						RegID.Text = PID;
						PName.Text = p.PatientName;
						PBed.Text = p.CurrentBedNo;

						var dates = (from r in myEntities.Clinical_Monitoring__Patient_Complaint
									 where r.P_ID == PID
									 select r.LogDate).Distinct();

						var orderedDates = from r in dates
										   orderby r descending
										   select r;

						List<String> datelist = new List<String>();

						foreach (var d in orderedDates)
						{
							datelist.Add(d.ToShortDateString());
						}

						DateFilter.DataSource = datelist;
						DateFilter.DataBind();

						MultiView1.ActiveViewIndex = 0;
					}
					else
					{
						MultiView1.ActiveViewIndex = 1;
					}
				}
			}
			else
			{
				MultiView1.ActiveViewIndex = -1;
			}
		}
	}

	protected void EntityDataSource1_Inserting(object sender, EntityDataSourceChangingEventArgs e)
	{
		Clinical_Monitoring__Patient_Complaint record = (Clinical_Monitoring__Patient_Complaint)e.Entity;

		record.P_ID = RegID.Text;
		record.LogDate = DateTime.Now.Date;
		record.UpdateDateTime = DateTime.Now;
		record.UpdatedBy = Profile.UserName;
		record.UpdateUserName = Profile.Name;
	}

	protected void Search_Click(object sender, EventArgs e)
	{
		string pid = SearchBox.Text;

		if (SearchBy.SelectedIndex == 1)
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				pid = (from r in myEntities.Patient__Profile
					   where r.CurrentBedNo == pid
					   select r.Registration_ID).SingleOrDefault();
			}
		}

		Response.Redirect(String.Format("~/ClinicalMonitoring/PatientComplaint.aspx?PID={0}", pid));
	}

	protected void EntityDataSource1_Inserted(object sender, EntityDataSourceChangedEventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/PatientComplaint.aspx?PID={0}", RegID.Text));
	}

	protected void EntityDataSource1_Deleted(object sender, EntityDataSourceChangedEventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/PatientComplaint.aspx?PID={0}", RegID.Text));
	}

	protected void Complaints_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/PatientComplaint.aspx?PID={0}", RegID.Text));
	}

	protected void OnExam_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/OnExamination.aspx?PID={0}", RegID.Text));
	}

	protected void VitalSigns_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/VitalSigns.aspx?PID={0}", RegID.Text));
	}

	protected void ClinicalParams_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/ClinicalParams.aspx?PID={0}", RegID.Text));
	}

	protected void IntakeOutput_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/IntakeOutput.aspx?PID={0}", RegID.Text));
	}

	protected void Ventilator_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/Ventilator.aspx?PID={0}", RegID.Text));
	}

	protected void Cannulas_Click(object sender, EventArgs e)
	{
		Response.Redirect(String.Format("~/ClinicalMonitoring/Cannulas.aspx?PID={0}", RegID.Text));
	}
}