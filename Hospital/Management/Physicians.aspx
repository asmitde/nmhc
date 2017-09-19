<%@ Page Title="Hospital | Management" Language="C#" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="Physicians.aspx.cs" Inherits="Hospital_Management_Physicians" %>

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
	<h3>Consultant Physicians</h3>
	<br />
	<div>
                <table style="width: 760px">
                    <tr>
                        <td>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" >
								<HeaderTemplate>
									<table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 125px">
                                                <asp:Literal ID="LCPID" runat="server" Text="ID" />
                                            </td>
                                            <td style="width: 250px">
                                                <asp:Literal ID="LCPName" runat="server" Text="Name" />
                                            </td>
											<td style="width: 225px">
												<asp:Literal ID="LUnit" runat="server" Text="Unit" />
											</td>
											<td style="width: 75px">
                                                &nbsp;
                                            </td>
                                            <td style="width: auto">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
								</HeaderTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 125px">
                                                <asp:Literal ID="CPID" runat="server" Text='<%# Eval("CP_ID") %>'/>
                                            </td>
                                            <td style="width: 250px">
                                                <a href='<%# "~/Physician/Default.aspx?CPID=" + Eval("CP_ID") %>'>
                                                    <asp:Literal ID="CPName" runat="server" Text='<%# Eval("Name") %>' />
                                                </a>
                                            </td>
											<td style="width: 225px">
												<asp:TextBox ID="CPUnit" runat="server" Width="200px" Text='<%# Eval("Unit") %>'></asp:TextBox>
											</td>
											<td style="width: 75px">
                                                <asp:Button ID="CPSave" runat="server" Text="Save" CommandName="Save" />
                                            </td>
                                            <td style="width: auto">
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
                            <h3>Search Physician</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 754px">
                                <tr>
                                    <td style="width: 130px">
                                        <asp:Label ID="Label2" runat="server" AssociatedControlID="PhSearchBox" 
                                            Text="Physician ID"></asp:Label>
                                    </td>
                                    <td style="width: 388px">
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
                                        <td style="width: 502px">
                                            <asp:Label ID="Result" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Button ID="Insert" runat="server" onclick="Insert_Click" Text="Insert" />
                                        </td>
                                    </tr>
                                	<tr>
										<td style="width: 50px">
											&nbsp;</td>
										<td style="width: 502px">
											&nbsp;</td>
										<td>
											&nbsp;</td>
									</tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                        <asp:Literal ID="Notification" runat="server" />
                        </td>
                    </tr>
                </table>
	</div>
</asp:Content>

