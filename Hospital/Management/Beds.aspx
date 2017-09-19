<%@ Page Title="Hospital | Management" Language="C#" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="Beds.aspx.cs" Inherits="Hospital_Management_Beds" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="cpMainContent" Runat="Server">
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
	<h3>Beds</h3>
	<br />
	<div>
                <table style="width: 760px">
                    <tr>
                        <td>
							<asp:Repeater ID="Repeater2" runat="server" >
							<ItemTemplate>
							<h4><asp:Literal ID="Type" runat="server" Text='<%# Eval("type") %>' /></h4>
							<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" DataSource='<%# Eval("bno") %>'>
                                <ItemTemplate>
									<table cellpadding="0" cellspacing="0">
                                        <tr>
											<td style="width: 50px">
												&nbsp;
											</td>
											<td style="width: 250px">
												<asp:Literal ID="Bed" runat="server" Text='<%# Eval("BedNo") %>' />
											</td>
                                            <td style="width: 100px">
                                                <asp:Button ID="BDelete" runat="server" Text="Remove" CommandName="Delete" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
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
                            <h3>Add Bed</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 130px; height: 17px;">
                                        <asp:Label ID="Label3" runat="server" AssociatedControlID="BedNoA" 
											Text="Bed No."></asp:Label>
                                    </td>
                                    <td style="width: 434px; height: 17px;">
                                        <asp:TextBox ID="BedNoA" runat="server" Width="225px"></asp:TextBox>
                                    </td>
                                    <td style="height: 17px">
                                    	&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 17px;">
                                        <asp:Label ID="Label2" runat="server" AssociatedControlID="TypeA" 
											Text="Bed Type"></asp:Label>
                                    </td>
                                    <td style="width: 434px; height: 17px;">
                                        <asp:TextBox ID="TypeA" runat="server" Width="400px"></asp:TextBox>
                                    </td>
                                    <td style="height: 17px">
                                    	<asp:Button ID="Add" runat="server" onclick="Add_Click" Text="Add" />
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
                            <asp:Literal ID="Notification" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
	</div>
</asp:Content>