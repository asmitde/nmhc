using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMHCDatabaseModel;

public partial class Hospital_PatientInfo_Default : System.Web.UI.Page
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
                    PName.Text = p.PatientName;
					PBed.Text = (p.CurrentBedNo == null) ? "Unoccupied" : p.CurrentBedNo;

                    MultiView1.ActiveViewIndex = 0;

                    // Initialize form from database
                    Department.Text = p.Department;
					Bed.Text = (p.CurrentBedNo == null) ? "Unoccupied" : p.CurrentBedNo;
                    Name.Text = p.PatientName;
                    Photo.ImageUrl = p.PhotoURL;
                    Sex.Text = p.Sex;
                    AgeValue.Text = p.Age.ToString();
                    AgeUnit.Text = p.AgeUnit;
                    Weight.Text = p.BodyWeight.ToString();
                    Height.Text = p.Height.ToString();
                    MaritalStatus.Text = p.MaritalStatus;
                    Co.Text = p.C_o;
                    CoRelation.Text = p.C_o_Relation;
                    MotherName.Text = p.MothersName;
                    MLC.Text = p.MLC_No;
                    RName.Text = p.ReferredBy;
                    RContact.Text = p.RefContactNo;
					PrevTreated.Visible = PrevID.Visible = Label32.Visible = (p.IfPreviouslyTreated.HasValue == true ) ? p.IfPreviouslyTreated.Value : false;
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
					IfDischarged.Text = (p.IfDischarged == true) ? "DISCHARGED" : null;

					// Calculate BMI and class
					if (Weight.Text != null && Height.Text != null)
					{
						double bmi = double.Parse(Weight.Text) / Math.Pow(double.Parse(Height.Text), 2) * 10000;
						BMI.Text = bmi.ToString();
						string bmiclass;
						if (bmi < 16) bmiclass = "Severely Underweight";
						else if (bmi < 17) bmiclass = "Moderately Underweight";
						else if (bmi < 18) bmiclass = "Mild Underweight";
						else if (bmi < 25) bmiclass = "Normal";
						else if (bmi < 30) bmiclass = "Pre Obese (Mild)";
						else if (bmi < 35) bmiclass = "Class I Obese (Moderate)";
						else if (bmi < 45) bmiclass = "Class II Obese (Severe)";
						else bmiclass = "Class III Obese (Morbid)";
						BMIClass.Text = bmiclass;
					}

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

        Response.Redirect(String.Format("~/Hospital/PatientInfo/Default.aspx?PID={0}", PID));
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