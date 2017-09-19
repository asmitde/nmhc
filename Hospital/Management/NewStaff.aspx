<%@ Page Title="Hospital | Management" Language="C#" MasterPageFile="~/Hospital/Hospital.master" AutoEventWireup="true" CodeFile="NewStaff.aspx.cs" Inherits="Hospital_Management_NewStaff" %>

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
        <div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    
                                    <h3>
                                        Create a New Staff Account
                                    </h3>
                                    <p>
                                        Use the form below to create a new account.
                                    </p>
                                    <p>
                                        Passwords are required to be a minimum of
                                        <%= Membership.MinRequiredPasswordLength %> characters in length.
                                    </p>
                                    <span class="failureNotification">
                                    <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                                    </span>
                                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" 
                                        CssClass="failureNotification" ValidationGroup="RegisterUserValidationGroup" />
                                    <div class="accountInfo">
                                        <fieldset class="register">
                                            <legend>Account Information</legend>
                                            <p>
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Staff ID [User Name]:</asp:Label>
                                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" 
                                                    ValidationGroup="RegisterUserValidationGroup" ViewStateMode="Enabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" CssClass="failureNotification" 
                                                    ErrorMessage="Staff ID [User Name] is required." ToolTip="Staff ID [User Name] is required." 
                                                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                                <asp:CustomValidator ID="StaffIDInvalid" runat="server" 
                                                    ControlToValidate="UserName" CssClass="failureNotification" 
                                                    ErrorMessage="Staff ID already exists." 
                                                    ToolTip="Staff ID already exists." 
                                                    ValidationGroup="RegisterUserValidationGroup" 
                                                    onservervalidate="StaffIDInvalid_ServerValidate">*</asp:CustomValidator>
                                            </p>
                                            <p>
                                                <asp:Label ID="StaffNameLabel" runat="server" AssociatedControlID="StaffName">Name of Staff:</asp:Label>
                                                <asp:TextBox ID="StaffName" runat="server" CssClass="textEntry" 
                                                    ViewStateMode="Enabled" />
                                                <asp:RequiredFieldValidator ID="StaffNameRequired" runat="server" 
                                                    ControlToValidate="StaffName" CssClass="failureNotification" 
                                                    ErrorMessage="Staff Name is required." ToolTip="Staff Name is required." 
                                                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                            </p>
                                            <p>
                                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                                <asp:TextBox ID="Email" runat="server" CssClass="textEntry" 
                                                    ViewStateMode="Enabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                                    ControlToValidate="Email" CssClass="failureNotification" 
                                                    ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
                                                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="EmailInvalid" runat="server" 
                                                    ControlToValidate="Email" CssClass="failureNotification" 
                                                    ErrorMessage="E-mail is invalid." ToolTip="E-mail is invalid." 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                    ValidationGroup="RegisterUserValidationGroup">*</asp:RegularExpressionValidator>
                                            </p>
                                            <p>
                                                <asp:Label ID="RoleLabel" runat="server" AssociatedControlID="RoleList">Role:</asp:Label>
                                                <asp:DropDownList ID="RoleList" runat="server">
                                                    <asp:ListItem>Hospital Management</asp:ListItem>
                                                    <asp:ListItem>Nurse</asp:ListItem>
                                                    <asp:ListItem>Lab Imaging Technician</asp:ListItem>
                                                    <asp:ListItem>Receptionist</asp:ListItem>
                                                    <asp:ListItem>Paramedical Professional</asp:ListItem>
                                                </asp:DropDownList>
                                            </p>
                                            <p>
                                                <asp:CheckBox ID="RndPswd" runat="server" Checked="True" 
                                                    Text="Generate Random Password" oncheckedchanged="RndPswd_CheckedChanged" 
                                                    AutoPostBack="True" />
                                            </p>
                                            <p>
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Visible="False">Password:</asp:Label>
                                                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" 
                                                    TextMode="Password" ViewStateMode="Enabled" Visible="False"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                    ControlToValidate="Password" CssClass="failureNotification" 
                                                    ErrorMessage="Password is required." ToolTip="Password is required." 
                                                    ValidationGroup="RegisterUserValidationGroup" Visible="False">*</asp:RequiredFieldValidator>    
                                            </p>
                                            <p>
                                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                                    AssociatedControlID="ConfirmPassword" Visible="False">Confirm Password:</asp:Label>
                                                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" 
                                                    CausesValidation="True" ViewStateMode="Enabled" Visible="False" 
                                                    TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                                    ControlToValidate="ConfirmPassword" CssClass="failureNotification" 
                                                    Display="Dynamic" ErrorMessage="Confirm Password is required." 
                                                    ToolTip="Confirm Password is required." 
                                                    ValidationGroup="RegisterUserValidationGroup" Visible="False">*</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                                    CssClass="failureNotification" Display="Dynamic" 
                                                    ErrorMessage="The Password and Confirmation Password must match." 
                                                    ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                            </p>
                                        </fieldset>
                                        <p class="submitButton">
                                            <asp:Button ID="Register" runat="server" onclick="Register_Click" 
                                            Text="Register Staff" ValidationGroup="RegisterUserValidationGroup" />
                                        </p>
                                    </div>

                </asp:View>
                <asp:View ID="View2" runat="server">
                    <h3>
                        Confirmation
                    </h3>
                    <p>
                        <asp:Literal ID="Notification" runat="server" />
                    </p>
                    <p>
                        <asp:Button ID="Back" runat="server" Text="Back" onClick="Back_Click" 
                        Visible="False" />
                        <asp:Button ID="Continue" runat="server" Text="Continue" 
                        onclick="Continue_Click" />
                    </p>
                </asp:View>

            </asp:MultiView>
        </div>
</asp:Content>

