<%@ Page Title="Hospital | Management" Language="C#" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="Hospital_Management_Departments" %>

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
	<h3>Departments</h3>
	<br />
    <div>
                <table style="width: 760px">
                    <tr>
                        <td>
                            <asp:Repeater ID="Repeater1" runat="server" 
								onitemcommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
											<td style="width: 50px">
												<asp:Literal ID="DID" runat="server" Text='<%# Eval("Department_ID") %>' />
											</td>
                                            <td style="width: 350px">
                                                <asp:Literal ID="DName" runat="server" Text='<%# Eval("Name") %>' />
                                            </td>
                                            <td style="width: 100px">
                                                <asp:Button ID="DDelete" runat="server" Text="Remove" CommandName="Delete" />
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
                            <h3>Search Department</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 754px">
                                <tr>
                                    <td style="width: 130px">
                                        <asp:Label ID="Label1" runat="server" Text="Department Name:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DSearchList" runat="server" 
											DataSourceID="EntityDataSource1" DataTextField="Name" 
											DataValueField="Department_ID">
										</asp:DropDownList>
                                    </td>
                                    <td style="width: 189px">
                                        <asp:Button ID="Insert" runat="server" onclick="Insert_Click" Text="Insert" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
								ConnectionString="name=NMHCDatabaseEntities" 
								DefaultContainerName="NMHCDatabaseEntities" EnableFlattening="False" 
								EntitySetName="Module__Department" Select="it.[Department_ID], it.[Name]">
							</asp:EntityDataSource>
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
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <h3>Add Department</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 742px">
                                <tr>
                                    <td style="width: 130px; height: 17px;">
                                        <asp:Label ID="Label2" runat="server" AssociatedControlID="AddDept" 
											Text="Department Name"></asp:Label>
                                    </td>
                                    <td style="width: 434px; height: 17px;">
                                        <asp:TextBox ID="AddDept" runat="server" Width="400px"></asp:TextBox>
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
                            <p style="font-style: italic">
								Use this to add departments to the database which are not available in the 
								search list. 
								Before adding, please make sure the department does not exist in the database, otherwise it will cause data redundancy. 
								Please note that this will only add the department to the main database; you need to 
								select and insert it in the hospital's 
								department list if required.
							</p></td>
                    </tr>
                </table>
	</div>
</asp:Content>

