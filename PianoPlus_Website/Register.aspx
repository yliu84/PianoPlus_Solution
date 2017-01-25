<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

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
    <form id="form1" runat="server" class="m-t" role="form" action="login.aspx">
        <h3>Register to Piano Plus</h3>

        <div class="form-group">
            <asp:TextBox ID="txt_email" runat="server" type="email" CssClass="form-control" placeholder="Email"></asp:TextBox>
        </div>    

        <div class="form-group">
            <asp:TextBox ID="txt_firstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txt_lastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" placeholder="phone"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_address" runat="server" CssClass="form-control" placeholder="address"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <%--<asp:TextBox ID="txt_province" runat="server" CssClass="form-control" placeholder="Province"></asp:TextBox>--%>
            <asp:DropDownList ID="ddl_province" runat="server" Height="30px" CssClass="form-control" ForeColor="GrayText">
                <asp:ListItem Value="0">Choose a Province</asp:ListItem>
                <asp:ListItem Value="AB">Alberta</asp:ListItem>
                <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                <asp:ListItem Value="NL">Newfoundland and Labrador</asp:ListItem>
                <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                <asp:ListItem Value="ON">Ontario</asp:ListItem>
                <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                <asp:ListItem Value="QC">Quebec</asp:ListItem>
                <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                <asp:ListItem Value="NU">Nunavut</asp:ListItem>
                <asp:ListItem Value="YT">Yukon</asp:ListItem>
            </asp:DropDownList>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_city" runat="server" CssClass="form-control" placeholder="city"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_postalCode" runat="server" CssClass="form-control" placeholder="postal code"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_password" runat="server" type="password" class="form-control" placeholder="Password"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_confirmPassword" runat="server" type="password" class="form-control" placeholder="Confirm Password"></asp:TextBox>
        </div>      

        <div class="form-group">
            <div class="checkbox i-checks">
                <label>
                    <input type="checkbox" /><i></i> Agree the terms and policy </label>
            </div>
        </div>
        <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary block full-width m-b" Text="Register"></asp:Button>

        <p class="text-muted text-center"><small>Already have an account?</small></p>
        <a class="btn btn-sm btn-white btn-block" href="Login.aspx">Login</a>
    </form>
        <p class="m-t"> <small>Piano Plus Studio &copy; 2017</small> </p>
        </div>
</body>
</html>
