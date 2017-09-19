using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_Management_Beds : System.Web.UI.Page
{
	private static string hid = null;
	
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
				var types = (from r in myEntities.Hospital__Bed
							where r.H_ID == hid
							select r.Type).Distinct();

				var beds = from r in types
						   select new
						   {

							   type = r,
							   bno = from s in myEntities.Hospital__Bed
									 where (s.H_ID == hid && s.Type == r)
									 select new { s.BedNo }
						   };

				Repeater2.DataSource = beds;
				Repeater2.DataBind();
			}
		}
    }

	protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
	{
		if (e.CommandName == "Delete")
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				try
				{
					string bed = ((Literal)e.Item.FindControl("Bed")).Text;
					var beds = (from r in myEntities.Hospital__Bed
								where (r.H_ID == hid && r.BedNo == bed)
								select r).Single();

					if (beds.Occupied == false)
						myEntities.DeleteObject(beds);
					
					myEntities.SaveChanges();
				}
				catch (Exception ex)
				{
					//notify = true;
					//note = ex.Message;
				}
			}

			Response.Redirect("~/Hospital/Management/Beds.aspx");
		}
	}

	protected void Add_Click(object sender, EventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			Hospital__Bed bed = new Hospital__Bed();
			bed.BedNo = BedNoA.Text;
			bed.Type = TypeA.Text;
			bed.H_ID = hid;
			bed.Occupied = false;

			bed.UpdateDateTime = DateTime.Now;
			bed.UpdatedBy = Profile.UserName;
			bed.UpdateUserName = Profile.Name;

			myEntities.AddToHospital__Bed(bed);
			myEntities.SaveChanges();
		}

		Response.Redirect("~/Hospital/Management/Beds.aspx");
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