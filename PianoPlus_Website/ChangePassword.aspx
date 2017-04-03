<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
    <link href="Content/animate.css" rel="stylesheet" />
</head>
<body class="gray-bg">
    <div class="text-center loginscreen animated fadeInDown">

        <h1 class="logo-name">PIANO+</h1>
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    </div>
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <form id="form1" runat="server">
            <div class="form-group">

                <asp:TextBox ID="txt_currentPassword" runat="server" CssClass="form-control" placeholder="Current Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredCurrentPassword"
                    runat="server"
                    ErrorMessage="Current Password is Required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ControlToValidate="txt_currentPassword"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txt_newPassword" runat="server" CssClass="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredNewPassword"
                    runat="server"
                    ErrorMessage="New Password is Required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ControlToValidate="txt_newPassword"></asp:RequiredFieldValidator>

                <asp:TextBox ID="txt_confirmPassword" runat="server" CssClass="form-control" placeholder="Confirm New Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredConfirmPassword"
                    runat="server"
                    ErrorMessage="Need to confirm new password is Required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ControlToValidate="txt_confirmPassword"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareNewPassword"
                    runat="server"
                    ErrorMessage="Password does not match."
                    Display="Dynamic"
                    ForeColor="Red"
                    Operator="Equal"
                    ControlToCompare="txt_newPassword"                   
                    ControlToValidate="txt_confirmPassword"></asp:CompareValidator>

            </div>
            <%--<button type="submit" class="btn btn-primary block full-width m-b">Login</button>--%>
            <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary block full-width m-b" OnClick="btn_submit_Click"/>
            <a class="btn btn-sm btn-white btn-block" href="Default.aspx">Back To Homepage</a>
        </form>
    </div>
</body>
</html>
