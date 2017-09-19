<%@ Page Title="Hospital | Management" Language="C#" Debug="true" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="EditInfo.aspx.cs" Inherits="Hospital_Management_EditInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <div>
        <h2>Management</h2>
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
    <br />
    <div>
        <h3>Edit Hospital Information</h3>
    </div>
    <br />
                <table style="width: 760px">
                    <tr>
                        <td rowspan="7" style="width: 140px">
                            <asp:Image ID="Logo" runat="server" AlternateText="No Logo" 
                                GenerateEmptyAlternateText="True" Height="170px" ImageAlign="Middle" 
                                Width="132px" />
                        </td>
                        <td rowspan="7" style="width: 120px">
                            <asp:Label ID="ImageError" runat="server" Font-Italic="True" ForeColor="Red" 
                                Text="Select a valid .jpg file" Visible="False"></asp:Label>
                        </td>
                        <td style="width: 120px">
                            <asp:Label ID="Label30" runat="server" AssociatedControlID="HospitalID" 
                                Text="Hospital ID"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:Literal ID="HospitalID" runat="server"></asp:Literal>
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
                            <asp:Label ID="Label19" runat="server" AssociatedControlID="Name" Text="Name"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px" rowspan="2">
                            <asp:TextBox ID="Name" runat="server" TextMode="MultiLine" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="Name" CssClass="validationError">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            &nbsp;</td>
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
                            <asp:Label ID="Label26" runat="server" AssociatedControlID="ESTD" 
                                Text="ESTD"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="ESTD" runat="server"></asp:TextBox>
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
                        <td colspan="2">
                            <asp:FileUpload ID="LogoUpload" runat="server" ViewStateMode="Enabled" />
                        </td>
                        <td style="width: 120px">
                            <asp:Label ID="Label64" runat="server" AssociatedControlID="Website" 
                                Text="Website"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="Website" runat="server" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                CssClass="validationError" ErrorMessage="*" ControlToValidate="Website" 
                                ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            <asp:Button ID="SetLogo" runat="server" CausesValidation="False" 
                                onclick="SetLogo_Click" Text="Set Logo" Visible="False" 
                                Width="100px" />
                        </td>
                        <td style="width: 120px">
                            <asp:Button ID="DeleteLogo" runat="server" CausesValidation="False" 
                                onclick="DeleteLogo_Click" Text="Delete Logo" Width="100px" />
                        </td>
                        <td style="width: 120px">
                            <asp:Label ID="Label29" runat="server" Text="E-mail" Width="100px" 
                                AssociatedControlID="Email"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 350px">
                            <asp:TextBox ID="Email" runat="server" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="Email" CssClass="validationError" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
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
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label35" runat="server" AssociatedControlID="Address" 
                                Text="Address"></asp:Label>
                        </td>
                        <td colspan="3">
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
                            <asp:Label ID="Label65" runat="server" AssociatedControlID="City" Text="City"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="City" runat="server" Width="474px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label66" runat="server" AssociatedControlID="Pincode" 
                                Text="Pin Code"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Pincode" runat="server" Width="474px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label67" runat="server" AssociatedControlID="State" Text="State"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="State" runat="server" Width="474px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label68" runat="server" AssociatedControlID="Country" 
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
                            <asp:Label ID="Label69" runat="server" AssociatedControlID="Phone1" 
                                Text="Phone #1"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Phone1" runat="server" Width="474px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label70" runat="server" AssociatedControlID="Phone2" 
                                Text="Phone #2"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Phone2" runat="server" Width="474px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label71" runat="server" AssociatedControlID="Phone3" 
                                Text="Phone #3"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Phone3" runat="server" Width="474px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label72" runat="server" AssociatedControlID="Phone4" 
                                Text="Phone #4"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Phone4" runat="server" Width="474px"></asp:TextBox>
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
                            <asp:Label ID="Label73" runat="server" AssociatedControlID="Fax" Text="Fax"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Fax" runat="server" Width="474px"></asp:TextBox>
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
                            <table cellpadding="0" cellspacing="0" style="width: 350px" >
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
    <br />

    </asp:Content>

