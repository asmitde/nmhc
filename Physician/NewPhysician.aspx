<%@ Page Title="Physician | New Physician" Language="C#" MasterPageFile="~/Physician/Physician.master" AutoEventWireup="true" CodeFile="NewPhysician.aspx.cs" Inherits="Physician_NewPhysician" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainContent" Runat="Server">
        <div>
            <h2>New Physician</h2>
        </div>
        <br />
        <br />
        <div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    
                                    <h3>
                                        Create a New Physician Account
                                    </h3>
                                    <p>
                                        Use the form below to create a new Physician account.
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
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Physician ID [User Name]:</asp:Label>
                                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" 
                                                    ValidationGroup="RegisterUserValidationGroup" ViewStateMode="Enabled"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" CssClass="failureNotification" 
                                                    ErrorMessage="Physician ID [User Name] is required." ToolTip="Staff ID [User Name] is required." 
                                                    ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                                <asp:CustomValidator ID="PhysicianIDInvalid" runat="server" 
                                                    ControlToValidate="UserName" CssClass="failureNotification" 
                                                    ErrorMessage="Physician ID already exists." 
                                                    ToolTip="Physician ID already exists." 
                                                    ValidationGroup="RegisterUserValidationGroup" 
                                                    onservervalidate="PhysicianIDInvalid_ServerValidate">*</asp:CustomValidator>
                                            </p>
                                            <p>
                                                <asp:Label ID="PhysicianNameLabel" runat="server" AssociatedControlID="PhysicianName">Name of Physician:</asp:Label>
                                                <asp:TextBox ID="PhysicianName" runat="server" CssClass="textEntry" 
                                                    ViewStateMode="Enabled" />
                                                <asp:RequiredFieldValidator ID="PhysicianNameRequired" runat="server" 
                                                    ControlToValidate="PhysicianName" CssClass="failureNotification" 
                                                    ErrorMessage="Physician Name is required." ToolTip="Physician Name is required." 
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
                                            Text="Register Physician" ValidationGroup="RegisterUserValidationGroup" />
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

