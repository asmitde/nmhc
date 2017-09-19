using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_PatientInfo_EditInfo : System.Web.UI.Page
{
	private static string photoUrl = null;
	private static string pid = null;

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

					// Select department ids having selected patient's hospital id
					var dids = from r in myEntities.Hospital__Department
							   where r.H_ID == p.H_ID
							   select r.D_ID;

					// Select department names corresponding to selected department ids
					Department.DataSource = from d in myEntities.Module__Department
											join i in dids on d.Department_ID equals i
											orderby d.Name ascending
											select d.Name;
					Department.DataBind();

					// Selext beds correspinding to selected patient's hospital id
					var beds = (from r in myEntities.Hospital__Bed
								where (r.H_ID == hid && (r.Occupied == false || r.BedNo == p.CurrentBedNo))
								orderby r.BedNo ascending
								select r.BedNo).ToList();
					
					beds.Add("Unoccupied");
					Bed.DataSource = beds;
					Bed.DataBind();

					// Initialize form from database
					Department.SelectedValue = p.Department;
					Bed.SelectedValue = (p.CurrentBedNo == null) ? "Unoccupied" : p.CurrentBedNo;
					Name.Text = p.PatientName;
					SetPicture.Visible = String.IsNullOrEmpty(p.PhotoURL);
					DeletePicture.Visible = !String.IsNullOrEmpty(p.PhotoURL);
					Photo.ImageUrl = p.PhotoURL;
					Sex.SelectedValue = p.Sex;
					AgeValue.Text = p.Age.ToString();
					AgeUnit.SelectedValue = p.AgeUnit;
					Weight.Text = p.BodyWeight.ToString();
					Height.Text = p.Height.ToString();
					MaritalStatus.SelectedValue = p.MaritalStatus;
					Co.Text = p.C_o;
					CoRelation.SelectedValue = p.C_o_Relation;
					MotherName.Text = p.MothersName;
					MLC.Text = p.MLC_No;
					RName.Text = p.ReferredBy;
					RContact.Text = p.RefContactNo;
					PrevTreated.Checked = (p.IfPreviouslyTreated == true);
					PrevID.Text = p.LastTreatedRegistration_ID;
					Occupation.Text = p.Occupation;
					Financing.Text = p.Financing;
					LAddress.Text = p.LocalAddress;
					LState.Text = p.LState;
					LCountry.Text = p.LCountry;
					LPincode.Text = p.LPincode;
					LContact1.Text = p.LContactNo1;
					LContact2.Text = p.LContactNo2;
					LEmail.Text = p.Email;
					PAddress.Text = p.PermanentAddress;
					PState.Text = p.PState;
					PCountry.Text = p.PCountry;
					PPincode.Text = p.PPincode;
					PContact1.Text = p.PContactNo1;
					PContact2.Text = p.PContactNo2;
					CName.Text = p.EmergencyContactPerson;
					CRelation.Text = p.CPRelationship;
					CAddress.Text = p.CPAddress;
					CContact1.Text = p.CPContactNo1;
					CContact2.Text = p.CPContactNo2;
					CEmail.Text = p.CPEmail;
					AName.Text = p.AdmittingPerson;
					ARelation.Text = p.APRelationship;
					AAddress.Text = p.APAddress;
					AContact1.Text = p.APContactNo1;
					AContact2.Text = p.APContactNo2;

				}
				else
				{
					MultiView1.ActiveViewIndex = 1;
				}
			}
		}
    }

	protected void SetPicture_Click(object sender, EventArgs e)
	{
		if (PhotoUpload.HasFile && (PhotoUpload.FileName.ToLower().EndsWith(".jpg") ||
			PhotoUpload.FileName.ToLower().EndsWith(".jpeg")))
		{
			string virtualFolder = "~/Patient/Photo/";
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

		Response.Redirect(String.Format("~/Hospital/PatientInfo/EditInfo.aspx?PID={0}", PID));
	}

	protected void LPSame_Click(object sender, EventArgs e)
	{
		PAddress.Text = LAddress.Text;
		PState.Text = LState.Text;
		PCountry.Text = LCountry.Text;
		PPincode.Text = LPincode.Text;
		PContact1.Text = LContact1.Text;
		PContact2.Text = LContact2.Text;
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
						// Update profile information
						profile.Department = Department.SelectedValue;
						profile.CurrentBedNo = (Bed.SelectedValue == "Unoccupied") ? null : Bed.SelectedValue;
						profile.PatientName = Name.Text;
						profile.PhotoURL = Photo.ImageUrl;
						profile.Sex = Sex.SelectedValue;
						profile.Age = Convert.ToInt16(AgeValue.Text);
						profile.AgeUnit = AgeUnit.SelectedValue;
						profile.BodyWeight = Convert.ToInt16(Weight.Text);
						profile.Height = Convert.ToInt16(Height.Text);
						profile.MaritalStatus = MaritalStatus.SelectedValue;
						profile.C_o = Co.Text;
						profile.C_o_Relation = CoRelation.SelectedValue;
						profile.MothersName = MotherName.Text;
						profile.MLC_No = MLC.Text;
						profile.ReferredBy = RName.Text;
						profile.RefContactNo = RContact.Text;
						profile.IfPreviouslyTreated = PrevTreated.Checked;
						profile.LastTreatedRegistration_ID = PrevID.Text;
						profile.Occupation = Occupation.Text;
						profile.Financing = Financing.Text;
						profile.LocalAddress = LAddress.Text;
						profile.LState = LState.Text;
						profile.LCountry = LCountry.Text;
						profile.LPincode = LPincode.Text;
						profile.LContactNo1 = LContact1.Text;
						profile.LContactNo2 = LContact2.Text;
						profile.Email = LEmail.Text;
						profile.PermanentAddress = PAddress.Text;
						profile.PState = PState.Text;
						profile.PCountry = PCountry.Text;
						profile.PPincode = PPincode.Text;
						profile.PContactNo1 = PContact1.Text;
						profile.PContactNo2 = PContact2.Text;
						profile.EmergencyContactPerson = CName.Text;
						profile.CPRelationship = CRelation.Text;
						profile.CPAddress = CAddress.Text;
						profile.CPContactNo1 = CContact1.Text;
						profile.CPContactNo2 = CContact2.Text;
						profile.CPEmail = CEmail.Text;
						profile.AdmittingPerson = AName.Text;
						profile.APRelationship = ARelation.Text;
						profile.APAddress = AAddress.Text;
						profile.APContactNo1 = AContact1.Text;
						profile.APContactNo2 = AContact2.Text;

						profile.UpdateDateTime = DateTime.Now;
						profile.UpdatedBy = Profile.UserName;
						profile.UpdateUserName = Profile.Name;

						// Update bed information
						Hospital__Bed b = (from r in myEntities.Hospital__Bed
										   where (r.H_ID == profile.H_ID && r.BedNo == PBed.Text)
										   select r).SingleOrDefault();
						if(b != null)
							b.Occupied = false;	// Previous bed occupied status: false

						b = (from r in myEntities.Hospital__Bed
							 where (r.H_ID == profile.H_ID && r.BedNo == Bed.SelectedValue)
							 select r).SingleOrDefault();
						if (b != null)
						{
							b.Occupied = true;	// Current Bed occupied status: true if selected value is not "Unoccupied"
						}

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

		Response.Redirect(String.Format("~/Hospital/PatientInfo/EditInfo.aspx?PID={0}", RegID.Text));
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