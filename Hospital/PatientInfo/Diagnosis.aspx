<%@ Page Title="Hospital | Patient Information" Language="C#" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="Diagnosis.aspx.cs" Inherits="Hospital_PatientInfo_Diagnosis" %>

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
    <asp:LinkButton ID="ViewProfile" runat="server" onclick="ViewProfile_Click">View Profile</asp:LinkButton>
    <asp:LinkButton ID="EditProfile" runat="server" onclick="EditProfile_Click">Edit Profile</asp:LinkButton>
    <asp:LinkButton ID="Physicians" runat="server" onclick="Physicians_Click">Consultant Physicians</asp:LinkButton>
    <asp:LinkButton ID="Diagnosis0" runat="server" onclick="Diagnosis_Click">Diagnosis</asp:LinkButton>
    <br />
    <div>
        <asp:MultiView ID="MultiView1" runat="server" ViewStateMode="Enabled">
            <asp:View ID="View1" runat="server">
                <h3>Diagnosis</h3>
                <br />
                <table style="width: 760px">
                    <tr>
                        <td>
                            <asp:TextBox ID="Diagnosis" runat="server" Height="200px" TextMode="MultiLine" 
                                Width="742px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 548px">
                                        <asp:Literal ID="Notification" runat="server" />
                                    </td>
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
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
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

