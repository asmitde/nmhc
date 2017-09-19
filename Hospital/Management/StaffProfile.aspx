<%@ Page Title="Hospital | Management" Language="C#" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="StaffProfile.aspx.cs" Inherits="Hospital_Management_StaffProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <div>
		<h2>Staff Profile</h2>
	</div>
    <br />
    <br />
	<div>
        <asp:LinkButton ID="HospitalInfo" runat="server" OnClick="HospitalInfo_Click">Hospital Information</asp:LinkButton>
        <asp:LinkButton ID="NewStaff" runat="server" OnClick="NewStaff_Click">New Staff</asp:LinkButton>
        <asp:LinkButton ID="StaffProfile" runat="server" OnClick="StaffProfile_Click">View Staff Profile</asp:LinkButton>
        <asp:LinkButton ID="Physicians" runat="server" OnClick="Physicians_Click">Physicians</asp:LinkButton>
        <asp:LinkButton ID="Departments" runat="server" OnClick="Departments_Click">Departments</asp:LinkButton>
        <asp:LinkButton ID="Beds" runat="server" OnClick="Beds_Click">Beds</asp:LinkButton>
        <asp:LinkButton ID="Investigations" runat="server" OnClick="Investigations_Click" >Investigations</asp:LinkButton>
    </div>
	<br />
    <div>
        <h3>Search Staff</h3>
        <br />
        <table style="width: 100%">
            <tr>
                <td>
            Search by</td>
                <td>
                    <asp:RadioButtonList ID="SearchBy" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Staff ID</asp:ListItem>
                <asp:ListItem>Staff Name</asp:ListItem> 
            </asp:RadioButtonList>
                </td>
                <td>
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
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Literal ID="StfID" runat="server"></asp:Literal>
                </td>
                <td colspan="2">
                    <asp:Literal ID="SName" runat="server"></asp:Literal>
                </td>
            </tr>
            </table>
    </div>
    <br />
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
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td colspan="2" style="width: 350px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <asp:Label ID="Label64" runat="server" AssociatedControlID="Designation" 
								Text="Designation"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="Designation" runat="server" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <asp:Label ID="Label65" runat="server" AssociatedControlID="Qualification" 
								Text="Qualification"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="Qualification" runat="server" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            &nbsp;</td>
                        <td colspan="2" style="width: 350px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <asp:Label ID="Label66" runat="server" AssociatedControlID="Info" 
								Text="Relevant Information"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px" rowspan="2">
                            <asp:TextBox ID="Info" runat="server" TextMode="MultiLine" Width="350px"></asp:TextBox>
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
                            &nbsp;</td>
                        <td colspan="2" style="width: 350px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            <asp:Label ID="Label35" runat="server" AssociatedControlID="Address" 
								Text="Address"></asp:Label>
						</td>
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
                            <asp:TextBox ID="Address" runat="server" Width="742px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label38" runat="server" AssociatedControlID="Pincode" 
								Text="Pincode"></asp:Label>
						</td>
                        <td colspan="3">
                            <asp:TextBox ID="Pincode" runat="server" Width="474px"></asp:TextBox>
						</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label36" runat="server" AssociatedControlID="State" Text="State"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="State" runat="server" Width="474px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label37" runat="server" AssociatedControlID="Country" 
								Text="Country"></asp:Label>
						</td>
                        <td colspan="3">
                            <asp:TextBox ID="Country" runat="server" Width="474px"></asp:TextBox>
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
							<asp:Label ID="Label39" runat="server" AssociatedControlID="Contact1" 
								Text="Contact #1"></asp:Label>
						</td>
						<td colspan="3">
							<asp:TextBox ID="Contact1" runat="server" Width="474px"></asp:TextBox>
						</td>
						<td>
							&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
							<asp:Label ID="Label40" runat="server" AssociatedControlID="Contact2" 
								Text="Contact #2"></asp:Label>
						</td>
						<td colspan="3">
							<asp:TextBox ID="Contact2" runat="server" Width="474px"></asp:TextBox>
						</td>
						<td>
							&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
							<asp:Label ID="Label41" runat="server" AssociatedControlID="Email" 
								Text="E-mail"></asp:Label>
						</td>
						<td colspan="3">
							<asp:TextBox ID="Email" runat="server" CausesValidation="True" Width="474px"></asp:TextBox>
						</td>
						<td>
							<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
								ControlToValidate="Email" CssClass="validationError" 
								ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
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
                        Sorry, your search did not return any results. The Staff ID searched is not 
						present or is not registered under this hospital.</p>
            </asp:View>

        </asp:MultiView>
    </div>
</asp:Content>

