using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_Management_Default : System.Web.UI.Page
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

            using(NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
            {
                // Select Hospital based on current Staff ID
                hid = (from r in myEntities.Hospital__Staff
                       where r.Staff_ID == Profile.UserName
                       select r.H_ID).SingleOrDefault();

				if (hid == null)
				{
					hid = Profile.UserName;
				}
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