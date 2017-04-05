<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

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
        </div>
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <h3>Welcome to Piano Plus Studio</h3>

            <asp:Label runat="server" ID="lbl_heading" CssClass="p-sm">Enter Email Address</asp:Label>
            <form class="m-t" runat="server">
                <div class="form-group">

                    <asp:TextBox ID="txt_newPassword" runat="server" CssClass="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldNewPassword"
                        runat="server"
                        ErrorMessage="Password is Required"
                        Display="Dynamic"
                        ForeColor="Red"
                        ControlToValidate="txt_newPassword"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_confirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldConfirmPassword"
                        runat="server"
                        ErrorMessage="Confirm Password"
                        Display="Dynamic"
                        ForeColor="Red"
                        ControlToValidate="txt_confirmPassword"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareFieldsPasswords"
                        runat="server"
                        ErrorMessage="Passwords do not match."
                        Display="Dynamic"
                        Forecolor="Red"
                        ControlToValidate="txt_confirmPassword"
                        ControlToCompare="txt_newPassword"></asp:CompareValidator>
                </div>
                <%--<button type="submit" class="btn btn-primary block full-width m-b">Login</button>--%>
                <div class="col-lg-12">
                    <div class="col-lg-6">
                        <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary block full-width m-b" OnClick="btn_submit_Click" />
                    </div>
                    <div class="col-lg-6">
                        <asp:Button ID="btn_toHome" runat="server" Text="Home" CssClass="btn btn-primary block full-width m-b" OnClick="btn_toHome_Click" />
                    </div>
                </div>
            </form>
            <p class="m-t"> <small>Piano Plus Studio &copy; 2017</small> </p>
        </div>
    </div>
</body>
</html>
