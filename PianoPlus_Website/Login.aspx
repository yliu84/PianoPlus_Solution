<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
        <div>
            <h3>Welcome to Piano Plus Studio</h3>

            <p>Login in.</p>
            <form class="m-t" runat="server">
                <div class="form-group">
                    <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="User Email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldEmail"
                        runat="server"
                        ErrorMessage="Email is Required"
                        Display="Dynamic"
                        ForeColor="Red"
                        ControlToValidate="txt_email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server"
                        ErrorMessage="Invalid Email Format. Email must have between 5-50 lowercase characters!"
                        ControlToValidate="txt_email"
                        ValidationExpression="^(?!.{51})([a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)$"
                        ForeColor="Red"
                        Display="Dynamic" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="txt_password" CssClass="form-control" placeholder ="Password" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldPassword" 
                                        runat="server" 
                                        ErrorMessage="Password is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_password"></asp:RequiredFieldValidator>
                </div>
                <%--<button type="submit" class="btn btn-primary block full-width m-b">Login</button>--%>
                <asp:Button ID="btn_submit" runat="server" Text="Login" CssClass="btn btn-primary block full-width m-b" OnClick="btn_submit_Click" />
                <a href="#"><small>Forgot password?</small></a>
                <p class="text-muted text-center"><small>Do not have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="Register.aspx">Create an account</a>
            </form>
            <p class="m-t"> <small>Piano Plus Studio &copy; 2017</small> </p>
        </div>
    </div>
</body>
</html>
