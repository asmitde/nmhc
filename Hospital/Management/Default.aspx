<%@ Page Title="Hospital | Management" Language="C#" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Hospital_Management_Default" %>

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
</asp:Content>

