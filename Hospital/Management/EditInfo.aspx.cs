using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using NMHCDatabaseModel;
using System.Web.UI.WebControls;

public partial class Hospital_Management_EditInfo : System.Web.UI.Page
{
    private static string hid = null;
    private static string logoUrl = null;

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
				// Select hospital profile by ID
				var h = (from r in myEntities.Hospital__Profile
                         where r.Hospital_ID == hid
                         select r).SingleOrDefault();

				// Initialize form from database
				HospitalID.Text = h.Hospital_ID;
				Name.Text = h.HospitalName;
				SetLogo.Visible = String.IsNullOrEmpty(h.LogoUrl);
				DeleteLogo.Visible = !String.IsNullOrEmpty(h.LogoUrl);
				Logo.ImageUrl = h.LogoUrl;
				ESTD.Text = h.ESTD.ToString();
				Website.Text = h.Website;
				Email.Text = h.Email;
				Address.Text = h.Address;
				City.Text = h.City;
				Pincode.Text = h.Pincode;
				State.Text = h.State;
				Country.Text = h.Country;
				Phone1.Text = h.Phone1;
				Phone2.Text = h.Phone2;
				Phone3.Text = h.Phone3;
				Phone4.Text = h.Phone4;
				Fax.Text = h.Fax;
            }
        }
    }

	protected void SetLogo_Click(object sender, EventArgs e)
	{
		if (LogoUpload.HasFile && (LogoUpload.FileName.ToLower().EndsWith(".jpg") ||
			LogoUpload.FileName.ToLower().EndsWith(".jpeg")))
		{
			string virtualFolder = "~/Hospital/Management/Logo/";
			string physicalFolder = Server.MapPath(virtualFolder);
			string filename = Guid.NewGuid().ToString();
			string extension = System.IO.Path.GetExtension(LogoUpload.FileName);

			if (!String.IsNullOrEmpty(logoUrl))
			{
				System.IO.File.Delete(logoUrl);
				logoUrl = null;
			}

			logoUrl = System.IO.Path.Combine(physicalFolder, filename + extension);
			LogoUpload.SaveAs(logoUrl);

			Logo.ImageUrl = virtualFolder + filename + extension;
			DeleteLogo.Visible = true;
			ImageError.Visible = false;
		}
		else
		{
			ImageError.Visible = true;
		}
	}

	protected void DeleteLogo_Click(object sender, EventArgs e)
	{
		System.IO.File.Delete(logoUrl);
		logoUrl = null;
		Logo.ImageUrl = null;
		DeleteLogo.Visible = false;
	}

	protected void Save_Click(object sender, EventArgs e)
	{
		if (Page.IsValid)
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				Hospital__Profile hospital = (from r in myEntities.Hospital__Profile
											  where r.Hospital_ID == hid
											  select r).SingleOrDefault();

				// Update hospital information
				hospital.Hospital_ID = HospitalID.Text;
				hospital.HospitalName = Name.Text;
				hospital.LogoUrl = Logo.ImageUrl;
				hospital.ESTD = Convert.ToInt16(ESTD.Text);
				hospital.Website = Website.Text;
				hospital.Email = Email.Text;
				hospital.Address = Address.Text;
				hospital.City = City.Text;
				hospital.Pincode = Pincode.Text;
				hospital.State = State.Text;
				hospital.Country = Country.Text;
				hospital.Phone1 = Phone1.Text;
				hospital.Phone2 = Phone2.Text;
				hospital.Phone3 = Phone3.Text;
				hospital.Phone4 = Phone4.Text;
				Fax.Text = hospital.Fax;

				hospital.UpdateDateTime = DateTime.Now;
				hospital.UpdatedBy = Profile.UserName;
				hospital.UpdateUserName = Profile.Name;
				myEntities.SaveChanges();
			}
		}

		Response.Redirect("~/Hospital/Management/EditInfo.aspx");
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