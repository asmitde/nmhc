<%@ Page Title="Hospital | Patient Information" Language="C#" Debug="true" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="Physicians.aspx.cs" Inherits="Hospital_PatientInfo_Physicians" %>

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
    <asp:LinkButton ID="Diagnosis" runat="server" onclick="Diagnosis_Click">Diagnosis</asp:LinkButton>
    <br />
    <div>
        <asp:MultiView ID="MultiView1" runat="server" ViewStateMode="Enabled">
            <asp:View ID="View1" runat="server">
                <h3>Consultant Physicians</h3>
                <br />
                <table style="width: 760px">
                    <tr>
                        <td>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" >
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 200px">
                                                <asp:Literal ID="CPID" runat="server" Text='<%# Eval("CP_ID") %>'/>
                                            </td>
                                            <td style="width: 350px">
                                                <a href='<%# "~/Physician/Default.aspx?CPID=" + Eval("CP_ID") %>'>
                                                    <asp:Literal ID="CPName" runat="server" Text='<%# Eval("Name") %>' />
                                                </a>
                                            </td>
                                            <td style="width: 100px">
                                                <asp:Button ID="CPDelete" runat="server" Text="Remove" CommandName="Delete" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 754px">
                                <tr>
                                    <td style="width: 130px">
                                        <asp:Label ID="Label1" runat="server" Text="Search Physician:"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="Label2" runat="server" AssociatedControlID="PhSearchBox" 
                                            Text="Physician ID"></asp:Label>
                                    </td>
                                    <td style="width: 200px">
                                        <asp:TextBox ID="PhSearchBox" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                    <td style="width: 189px">
                                        <asp:Button ID="PhSearch" runat="server" onclick="PhSearch_Click" 
                                            Text="Search" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="ResultPanel" runat="server" Visible="False" Width="753px">
                                <table cellpadding="0" cellspacing="0" style="width: 756px">
                                    <tr>
                                        <td style="width: 50px">
                                            &nbsp;</td>
                                        <td style="width: 473px">
                                            <asp:Label ID="Result" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Button ID="Insert" runat="server" onclick="Insert_Click" Text="Insert" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 548px; height: 17px;">
                                        <asp:Literal ID="Notification" runat="server" />
                                    </td>
                                    <td style="height: 17px">
                                    </td>
                                </tr>
                            </table>
                        </td>
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