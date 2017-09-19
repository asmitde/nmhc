using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_Management_StaffProfile : System.Web.UI.Page
{
	private static string hid = null;
	private static string sid = null;
	private static string photoUrl = null;
	
	protected void Page_Load(object sender, EventArgs e)
    {
		sid = Request.QueryString.Get("SID");

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

			if (sid != null)
			{
				using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
				{
					// Select staff based on staff id
					var s = (from r in myEntities.Hospital__Staff
							 where r.Staff_ID == sid
							 select r).SingleOrDefault();

					if (s != null && s.H_ID == hid)
					{
						StfID.Text = sid;
						SName.Text = s.StaffName;

						MultiView1.ActiveViewIndex = 0;

						// Initialize form from database
						Name.Text = s.StaffName;
						Photo.ImageUrl = s.PhotoURL;
						SetPicture.Visible = String.IsNullOrEmpty(s.PhotoURL);
						DeletePicture.Visible = !String.IsNullOrEmpty(s.PhotoURL);
						Designation.Text = s.Designation;
						Qualification.Text = s.Qualification;
						Info.Text = s.RelevantInfo;
						Address.Text = s.Address;
						State.Text = s.State;
						Country.Text = s.Country;
						Pincode.Text = s.Pincode;
						Contact1.Text = s.Phone1;
						Contact2.Text = s.Phone2;
						Email.Text = s.Email;
					}
					else
					{
						MultiView1.ActiveViewIndex = 1;
					}
				}
			}
		}
    }

	protected void Search_Click(object sender, EventArgs e)
	{
		string SID = SearchBox.Text;

		if (SearchBy.SelectedIndex == 1)
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				SID = (from r in myEntities.Hospital__Staff
					   where r.StaffName.Contains(SID)
					   select r.Staff_ID).FirstOrDefault();
			}
		}

		Response.Redirect(String.Format("~/Hospital/Management/StaffProfile.aspx?SID={0}", SID));
	}

	protected void SetPicture_Click(object sender, EventArgs e)
	{
		if (PhotoUpload.HasFile && (PhotoUpload.FileName.ToLower().EndsWith(".jpg") ||
			PhotoUpload.FileName.ToLower().EndsWith(".jpeg")))
		{
			string virtualFolder = "~/Hospital/Management/StaffPhoto/";
			string physicalFolder = Server.MapPath(virtualFolder);
			string filename = Guid.NewGuid().ToString();
			string extension = System.IO.Path.GetExtension(PhotoUpload.FileName);

			if (!String.IsNullOrEmpty(photoUrl))
			{
				System.IO.File.Delete(photoUrl);
				photoUrl = null;
			}

			photoUrl = System.IO.Path.Combine(physicalFolder, filename + extension);
			PhotoUpload.SaveAs(photoUrl);

			Photo.ImageUrl = virtualFolder + filename + extension;
			DeletePicture.Visible = true;
			ImageError.Visible = false;
		}
		else
		{
			ImageError.Visible = true;
		}
	}

	protected void DeletePicture_Click(object sender, EventArgs e)
	{
		System.IO.File.Delete(photoUrl);
		photoUrl = null;
		Photo.ImageUrl = null;
		DeletePicture.Visible = false;
	}

	protected void Save_Click(object sender, EventArgs e)
	{
		if (Page.IsValid)
		{
			using (NMHCDatabaseEntities myEntities = new NMHCDatabaseEntities())
			{
				Hospital__Staff profile;
				if (sid != null)
				{
					profile = (from r in myEntities.Hospital__Staff
							   where r.Staff_ID == sid
							   select r).SingleOrDefault();

					if (profile != null)
					{
						// Update profile information
						profile.StaffName = Name.Text;
						profile.PhotoURL = Photo.ImageUrl;
						profile.Designation = Designation.Text;
						profile.Qualification = Qualification.Text;
						profile.RelevantInfo = Info.Text;
						profile.Address = Address.Text;
						profile.State = State.Text;
						profile.Country = Country.Text;
						profile.Pincode = Pincode.Text;
						profile.Phone1 = Contact1.Text;
						profile.Phone2 = Contact2.Text;
						profile.Email = Email.Text;

						profile.UpdateDateTime = DateTime.Now;
						profile.UpdatedBy = Profile.UserName;
						profile.UpdateUserName = Profile.Name;
						myEntities.SaveChanges();

						//Notification.Text = "Changes saved successfully.";
						//System.Threading.Thread.Sleep(5000);
						//Notification.Text = null;
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

		Response.Redirect(String.Format("~/Hospital/Management/StaffProfile.aspx?SID={0}", StfID.Text));
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