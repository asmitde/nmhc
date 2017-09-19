using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_Management_Departments : System.Web.UI.Page
{
	private static string hid = null;
	private static bool notify = false;
	private static string note = null;
	
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
				Repeater1.DataSource = from r in myEntities.Hospital__Department
									   join d in myEntities.Module__Department on r.D_ID equals d.Department_ID
									   where r.H_ID == hid
									   select new { d.Department_ID, d.Name };
				Repeater1.DataBind();
			}

			if (notify == true)
			{
				Notification.Text = note;
				notify = false;
			}
			else
			{
				Notification.Text = "";
			}
		}
    }

	protected void Insert_Click(object source, EventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			try
			{
				Hospital__Department relation = new Hospital__Department();
				relation.D_ID = Convert.ToInt32(DSearchList.SelectedValue);
				relation.H_ID = hid;

				relation.UpdatedBy = Profile.UserName;
				relation.UpdateDateTime = DateTime.Now;
				relation.UpdateUserName = Profile.Name;

				myEntities.AddToHospital__Department(relation);
				myEntities.SaveChanges();
			}
			catch (Exception ex)
			{
				notify = true;
				note = ex.Message;
			}
		}

		Response.Redirect("~/Hospital/Management/Departments.aspx");
	}

	protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
	{
		if (e.CommandName == "Delete")
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				try
				{
					int did = Convert.ToInt32(((Literal)e.Item.FindControl("DID")).Text);
					var dept = from r in myEntities.Hospital__Department
							   where (r.D_ID == did && r.H_ID == hid)
							   select r;

					myEntities.DeleteObject(dept.Single());
					
					myEntities.SaveChanges();
				}
				catch (Exception ex)
				{
					notify = true;
					note = ex.Message;
				}
			}

			Response.Redirect("~/Hospital/Management/Departments.aspx");
		}
	}

	protected void Add_Click(object sender, EventArgs e)
	{
		using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
		{
			try
			{
				Module__Department relation = new Module__Department();
				relation.Name = AddDept.Text.Trim();

				relation.UpdatedBy = Profile.UserName;
				relation.UpdateDateTime = DateTime.Now;
				relation.UpdateUserName = Profile.Name;

				myEntities.AddToModule__Department(relation);
				myEntities.SaveChanges();
			}
			catch (Exception ex)
			{
				notify = true;
				note = ex.Message;
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