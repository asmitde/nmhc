using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_Management_Physicians : System.Web.UI.Page
{
    private static string hid = null;
	private static string cpid = null;
	
	protected void Page_Load(object sender, EventArgs e)
    {
		if (!Page.IsPostBack)
		{
			if (!User.IsInRole("Administrator") && !User.IsInRole("Hospital Superuser") && !User.IsInRole("Hospital Management"))
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

			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				Repeater1.DataSource = from r in myEntities.Hospital__Physician
									   join cp in myEntities.Physician__Profile on r.CP_ID equals cp.Physician_ID
									   where r.H_ID == hid
									   orderby r.CP_ID ascending
									   select new { r.CP_ID, cp.Name, r.Unit };
				Repeater1.DataBind();
			}
		}
	}

	protected void PhSearch_Click(object sender, EventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			cpid = (from r in myEntities.Physician__Profile
					where r.Physician_ID == PhSearchBox.Text
					select r.Physician_ID).SingleOrDefault();

			if (cpid != null)
			{
				Result.Text = "ID: " + cpid + "\tName: " + Profile.GetProfile(cpid).Name;
				ResultPanel.Visible = true;
			}
			else
			{
				Notification.Text = "Physician with ID: " + PhSearch.Text + " does not exist, or is not " +
					"attached to this hospital.";
			}
		}
	}

	protected void Insert_Click(object sender, EventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			try
			{
				Hospital__Physician relation = new Hospital__Physician();
				relation.CP_ID = cpid;
				relation.H_ID = hid;

				relation.UpdatedBy = Profile.UserName;
				relation.UpdateDateTime = DateTime.Now;
				relation.UpdateUserName = Profile.Name;

				myEntities.AddToHospital__Physician(relation);
				myEntities.SaveChanges();
			}
			catch (Exception ex)
			{
				Notification.Text = ex.Message;
			}
		}

		Response.Redirect("~/Hospital/Management/Physicians.aspx");
	}

	protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			try
			{
				string cp_id = ((Literal)e.Item.FindControl("CPID")).Text;
				Hospital__Physician cp = (from r in myEntities.Hospital__Physician
										  where r.CP_ID == cp_id && r.H_ID == hid
										  select r).SingleOrDefault();
				
				switch (e.CommandName)
				{
					case "Delete":
						myEntities.DeleteObject(cp);
						myEntities.SaveChanges();
						break;

					case "Save":
						cp.Unit = ((TextBox)e.Item.FindControl("CPUnit")).Text;
						myEntities.SaveChanges();
						break;
				}

				Response.Redirect("~/Hospital/Management/Physicians.aspx");
			}
			catch (Exception ex)
			{
				//notify = true;
				//note = ex.Message;
			}
		}
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