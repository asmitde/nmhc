<%@ Page Title="Hospital | Patient Information" Language="C#" Debug="true" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="EditInfo.aspx.cs" Inherits="Hospital_PatientInfo_EditInfo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <div>
        <h2>Patient Information</h2>
    </div>
    <br />
    <br />
    <div>
        <h3>Search Patient</h3>
        <br />
        <table style="width: 100%">
            <tr>
                <td>
            Search by</td>
                <td colspan="2">
                    <asp:RadioButtonList ID="SearchBy" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Registration ID</asp:ListItem>
                <asp:ListItem>Bed No.</asp:ListItem> 
            </asp:RadioButtonList>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="SearchBox" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Search" runat="server" Text="Search" onclick="Search_Click" 
                        CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Literal ID="RegID" runat="server"></asp:Literal>
                </td>
                <td colspan="2">
                    <asp:Literal ID="PName" runat="server"></asp:Literal>
                </td>
                <td colspan="2">
                    <asp:Literal ID="PBed" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="text-align: left">
        <asp:LinkButton ID="ViewProfile" runat="server" onclick="ViewProfile_Click">View Profile</asp:LinkButton>
        <asp:LinkButton ID="EditProfile" runat="server" onclick="EditProfile_Click">Edit Profile</asp:LinkButton>
        <asp:LinkButton ID="Physicians" runat="server" onclick="Physicians_Click">Consultant Physicians</asp:LinkButton>
        <asp:LinkButton ID="Diagnosis" runat="server" onclick="Diagnosis_Click">Diagnosis</asp:LinkButton>
    </div>
    <div>
        <asp:MultiView ID="MultiView1" runat="server" ViewStateMode="Enabled">
            <asp:View ID="View1" runat="server">
                <h3>Edit Profile Information</h3>
                <br />
                <table style="width: 760px">
                    <tr>
                        <td rowspan="7" style="width: 140px">
                            <asp:Image ID="Photo" runat="server" AlternateText="No Photo" 
                                GenerateEmptyAlternateText="True" Height="170px" ImageAlign="Middle" 
                                Width="132px" />
                        </td>
                        <td rowspan="7" style="width: 120px">
                            <asp:Label ID="ImageError" runat="server" Font-Italic="True" ForeColor="Red" 
                                Text="Select a valid .jpg file" Visible="False"></asp:Label>
                        </td>
                        <td style="width: 120px">
                            <asp:Label ID="Label30" runat="server" AssociatedControlID="Department" 
                                Text="Department"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:DropDownList ID="Department" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <asp:Label ID="Label18" runat="server" AssociatedControlID="Bed" Text="Bed No."></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:DropDownList ID="Bed" runat="server">
							</asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <asp:Label ID="Label19" runat="server" AssociatedControlID="Name" Text="Name"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="Name" runat="server" CausesValidation="True" MaxLength="100" 
                                Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="Name" CssClass="validationError">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table cellpadding="0" cellspacing="0" style="width: 474px">
                                <tr>
                                    <td style="width: 124px">
                                        <asp:Label ID="Label20" runat="server" AssociatedControlID="Sex" Text="Sex"></asp:Label>
                                    </td>
                                    <td style="width: 120px">
                                        <asp:DropDownList ID="Sex" runat="server">
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 64px">
                                        <asp:Label ID="Label21" runat="server" AssociatedControlID="AgeValue" 
                                            Text="Age"></asp:Label>
                                    </td>
                                    <td style="width: 66px">
                                        <asp:TextBox ID="AgeValue" runat="server" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="AgeUnit" runat="server" style="margin-left: 0px" 
                                            Width="100px">
                                            <asp:ListItem>Year(s)</asp:ListItem>
                                            <asp:ListItem>Month(s)</asp:ListItem>
                                            <asp:ListItem>Day(s)</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                ControlToValidate="AgeValue" CssClass="validationError" 
                                Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <asp:Label ID="Label22" runat="server" AssociatedControlID="Weight" 
                                Text="Body Weight"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <table cellpadding="0" cellspacing="0" style="width: 350px">
                                <tr>
                                    <td style="width: 60px">
                                        <asp:TextBox ID="Weight" runat="server" CausesValidation="True" Width="50px"></asp:TextBox>
                                    </td>
                                    <td style="width: 20px">
                                        <asp:Label ID="Label23" runat="server" Text="Kg"></asp:Label>
                                    </td>
                                    <td style="width: 40px">
                                        <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                            ControlToValidate="Weight" CssClass="validationError" Operator="DataTypeCheck" 
                                            Type="Double">*</asp:CompareValidator>
                                    </td>
                                    <td style="width: 64px">
                                        <asp:Label ID="Label24" runat="server" AssociatedControlID="Height" 
                                            Text="Height"></asp:Label>
                                    </td>
                                    <td style="width: 66px">
                                        <asp:TextBox ID="Height" runat="server" CausesValidation="True" Width="50px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label25" runat="server" Text="cm"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                ControlToValidate="Height" CssClass="validationError" Operator="DataTypeCheck" 
                                Type="Double">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <asp:Label ID="Label26" runat="server" AssociatedControlID="MaritalStatus" 
                                Text="Marital Status"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:DropDownList ID="MaritalStatus" runat="server" Width="120px">
                                <asp:ListItem>Married</asp:ListItem>
                                <asp:ListItem>Unmarried</asp:ListItem>
                                <asp:ListItem>Divorced</asp:ListItem>
                                <asp:ListItem>Seperated</asp:ListItem>
                                <asp:ListItem>Widowed</asp:ListItem>
                                <asp:ListItem>Not Applicable</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <asp:Label ID="Label27" runat="server" AssociatedControlID="Co" Text="C/o"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="Co" runat="server" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:FileUpload ID="PhotoUpload" runat="server" ViewStateMode="Enabled" />
                        </td>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td colspan="2" style="width: 350px">
                            <table cellpadding="0" cellspacing="0" style="width: 350px">
                                <tr>
                                    <td style="width: 125px">
                                        <asp:Label ID="Label28" runat="server" AssociatedControlID="CoRelation" 
                                            Text="Relation"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="CoRelation" runat="server" Width="107px">
                                            <asp:ListItem>Father</asp:ListItem>
                                            <asp:ListItem>Mother</asp:ListItem>
                                            <asp:ListItem>Spouse</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            <asp:Button ID="SetPicture" runat="server" CausesValidation="False" 
                                onclick="SetPicture_Click" Text="Set Photo" Width="100px" />
                        </td>
                        <td style="width: 120px">
                            <asp:Button ID="DeletePicture" runat="server" CausesValidation="False" 
                                onclick="DeletePicture_Click" Text="Delete Photo" Width="100px" />
                        </td>
                        <td style="width: 120px">
                            <asp:Label ID="Label29" runat="server" Text="Mother's Name" Width="100px"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="MotherName" runat="server" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            &nbsp;</td>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td colspan="2" style="width: 350px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            &nbsp;</td>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td style="width: 120px">
                            <asp:Label ID="Label31" runat="server" AssociatedControlID="MLC" Text="MLC #"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="MLC" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            &nbsp;</td>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td colspan="2" style="width: 350px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 98px">
                                        <asp:Label ID="Label61" runat="server" Text="Referred by:"></asp:Label>
                                    </td>
                                    <td style="width: 42px">
                                        <asp:Label ID="Label62" runat="server" AssociatedControlID="RName" Text="Name"></asp:Label>
                                    </td>
                                    <td style="width: 250px">
                                        <asp:TextBox ID="RName" runat="server" Width="220px"></asp:TextBox>
                                    </td>
                                    <td style="width: 152px">
                                        <asp:Label ID="Label63" runat="server" AssociatedControlID="RContact" 
                                            Text="Contact #"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="RContact" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            &nbsp;</td>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td colspan="2" style="width: 350px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:CheckBox ID="PrevTreated" runat="server" Text="Previously Treated" />
                        </td>
                        <td colspan="3">
                            <table cellpadding="0" cellspacing="0" style="width: 474px">
                                <tr>
                                    <td style="width: 274px">
                                        <asp:Label ID="Label32" runat="server" AssociatedControlID="PrevID" 
                                            Text="Last Treatment Registration ID"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PrevID" runat="server" MaxLength="25" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label33" runat="server" AssociatedControlID="Occupation" 
                                Text="Occupation"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="Occupation" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 350px">
                                <tr>
                                    <td style="width: 150px">
                                        <asp:Label ID="Label34" runat="server" AssociatedControlID="Financing" 
                                            Text="Financing"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Financing" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label35" runat="server" AssociatedControlID="LAddress" 
                                Text="Local Address"></asp:Label>
                        </td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:TextBox ID="LAddress" runat="server" Width="742px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 75px">
                                        <asp:Label ID="Label36" runat="server" AssociatedControlID="LState" 
                                            Text="State"></asp:Label>
                                    </td>
                                    <td style="width: 142px">
                                        <asp:TextBox ID="LState" runat="server" Width="125px"></asp:TextBox>
                                    </td>
                                    <td style="width: 75px">
                                        <asp:Label ID="Label37" runat="server" AssociatedControlID="LCountry" 
                                            Text="Country"></asp:Label>
                                    </td>
                                    <td style="width: 142px">
                                        <asp:TextBox ID="LCountry" runat="server" Width="125px"></asp:TextBox>
                                    </td>
                                    <td style="width: 75px">
                                        <asp:Label ID="Label38" runat="server" AssociatedControlID="LPincode" 
                                            Text="Pincode"></asp:Label>
                                    </td>
                                    <td style="width: 125px">
                                        <asp:TextBox ID="LPincode" runat="server" Width="125px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table cellpadding="0" cellspacing="0" style="width: 383px">
                                <tr>
                                    <td style="width: 140px">
                                        <asp:Label ID="Label39" runat="server" AssociatedControlID="LContact1" 
                                            Text="Contact #1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="LContact1" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 350px">
                                <tr>
                                    <td style="width: 150px">
                                        <asp:Label ID="Label40" runat="server" AssociatedControlID="LContact2" 
                                            Text="Contact #2"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="LContact2" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label41" runat="server" AssociatedControlID="LEmail" 
                                Text="E-mail"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:TextBox ID="LEmail" runat="server" CausesValidation="True" Width="598px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="LEmail" CssClass="validationError" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label42" runat="server" AssociatedControlID="PAddress" 
                                Text="Permanent Address"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Button ID="LPSame" runat="server" onclick="LPSame_Click" 
                                Text="Same as Local Address" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:TextBox ID="PAddress" runat="server" Width="742px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 75px">
                                        <asp:Label ID="Label43" runat="server" AssociatedControlID="PState" 
                                            Text="State"></asp:Label>
                                    </td>
                                    <td style="width: 142px">
                                        <asp:TextBox ID="PState" runat="server" Width="125px"></asp:TextBox>
                                    </td>
                                    <td style="width: 75px">
                                        <asp:Label ID="Label44" runat="server" AssociatedControlID="PCountry" 
                                            Text="Country"></asp:Label>
                                    </td>
                                    <td style="width: 142px">
                                        <asp:TextBox ID="PCountry" runat="server" Width="125px"></asp:TextBox>
                                    </td>
                                    <td style="width: 75px">
                                        <asp:Label ID="Label45" runat="server" AssociatedControlID="PPincode" 
                                            Text="Pincode"></asp:Label>
                                    </td>
                                    <td style="width: 125px">
                                        <asp:TextBox ID="PPincode" runat="server" Width="125px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table cellpadding="0" cellspacing="0" style="width: 383px">
                                <tr>
                                    <td style="width: 140px">
                                        <asp:Label ID="Label46" runat="server" AssociatedControlID="PContact1" 
                                            Text="Contact #1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PContact1" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 350px">
                                <tr>
                                    <td style="width: 150px">
                                        <asp:Label ID="Label47" runat="server" AssociatedControlID="PContact2" 
                                            Text="Contact #2"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PContact2" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:Label ID="Label48" runat="server" 
                                Text="Contact Person in case of Emergency:"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 85px">
                                        <asp:Label ID="Label49" runat="server" AssociatedControlID="CName" Text="Name"></asp:Label>
                                    </td>
                                    <td style="width: 350px">
                                        <asp:TextBox ID="CName" runat="server" Width="300px"></asp:TextBox>
                                    </td>
                                    <td style="width: 105px">
                                        <asp:Label ID="Label50" runat="server" AssociatedControlID="CRelation" 
                                            Text="Relation"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="CRelation" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 85px">
                                        <asp:Label ID="Label51" runat="server" AssociatedControlID="CAddress" 
                                            Text="Address"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="CAddress" runat="server" Width="655px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table cellpadding="0" cellspacing="0" style="width: 383px">
                                <tr>
                                    <td style="width: 140px">
                                        <asp:Label ID="Label52" runat="server" AssociatedControlID="CContact1" 
                                            Text="Contact #1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="CContact1" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 350px">
                                <tr>
                                    <td style="width: 150px">
                                        <asp:Label ID="Label53" runat="server" Text="Contact #2"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="CContact2" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label55" runat="server" AssociatedControlID="CEmail" 
                                Text="E-mail"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:TextBox ID="CEmail" runat="server" CausesValidation="True" Width="598px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="CEmail" CssClass="failureNotification" 
                                ErrorMessage="RegularExpressionValidator">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:Label ID="Label54" runat="server" Text="Admitting Person:"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 85px">
                                        <asp:Label ID="Label56" runat="server" AssociatedControlID="AName" Text="Name"></asp:Label>
                                    </td>
                                    <td style="width: 350px">
                                        <asp:TextBox ID="AName" runat="server" Width="300px"></asp:TextBox>
                                    </td>
                                    <td style="width: 105px">
                                        <asp:Label ID="Label57" runat="server" AssociatedControlID="ARelation" 
                                            Text="Relation"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ARelation" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 85px">
                                        <asp:Label ID="Label58" runat="server" AssociatedControlID="AAddress" 
                                            Text="Address"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AAddress" runat="server" Width="610px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table cellpadding="0" cellspacing="0" style="width: 383px">
                                <tr>
                                    <td style="width: 140px">
                                        <asp:Label ID="Label59" runat="server" AssociatedControlID="AContact1" 
                                            Text="Contact #1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AContact1" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 350px">
                                <tr>
                                    <td style="width: 150px">
                                        <asp:Label ID="Label60" runat="server" AssociatedControlID="AContact2" 
                                            Text="Contact #2"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AContact2" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Literal ID="Notification" runat="server" />
                        </td>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 350px">
                                <tr>
                                    <td style="width: 150px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:Button ID="Save" runat="server" onclick="Save_Click" Text="Save Changes" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:View>

            <asp:View ID="View2" runat="server">
                    <h3>
                        Search Result
                    </h3>
                    <p>
                        Sorry, your search did not return any results.</p>
            </asp:View>

        </asp:MultiView>
    </div>
</asp:Content>

