<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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

    </div>
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <h3>Welcome to Piano Plus Studio</h3>

            <p>Login in.</p>
            <form class="m-t" role="form" action="Dashboard.aspx" runat="server">
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="Username" required="" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" required="" />
                </div>
                <%--<button type="submit" class="btn btn-primary block full-width m-b">Login</button>--%>
                <asp:Button ID="btn_submit" runat="server" Text="Login" CssClass="btn btn-primary block full-width m-b" />
                <a href="#"><small>Forgot password?</small></a>
                <p class="text-muted text-center"><small>Do not have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="Register.aspx">Create an account</a>
            </form>
            <p class="m-t"> <small>Piano Plus Studio &copy; 2017</small> </p>
        </div>
    </div>
</body>
</html>
