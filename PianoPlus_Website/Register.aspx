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
        <%--<asp:ValidationSummary ID="ValidationSummary1" 
                               runat="server"
                               DisplayMode="BulletList" />--%>
        <h3>Register to Piano Plus</h3>

        <div class="form-group">
            <asp:TextBox ID="txt_email" runat="server" type="email" CssClass="form-control" placeholder="Email"></asp:TextBox>
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
                                            Display="Dynamic"/>
        </div>    

        <div class="form-group">
            <asp:TextBox ID="txt_firstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldFName" 
                                        runat="server" 
                                        ErrorMessage="First name is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_firstName"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" 
                                            ErrorMessage="First Name length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_firstName" 
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ForeColor="Red" 
                                            Display="Dynamic"/>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txt_lastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldLName" 
                                        runat="server" 
                                        ErrorMessage="Last name is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_lastName"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" 
                                            ErrorMessage="Last Name length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_lastName" 
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ForeColor="Red"
                                            Display="Dynamic" />
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" placeholder="phone"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldPhone" 
                                        runat="server" 
                                        ErrorMessage="Phone is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_phone"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" 
                                            ErrorMessage="Invalid Phone Number!" 
                                            ControlToValidate="txt_phone" 
                                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" 
                                            ForeColor="Red"
                                            Display="Dynamic"/>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_address" runat="server" CssClass="form-control" placeholder="address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldAddress" 
                                        runat="server" 
                                        ErrorMessage="Address is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_address"></asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator ID="RequiredFieldProvince"
                                        InitialValue="0" 
                                        runat="server" 
                                        ErrorMessage="Province is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="ddl_province"></asp:RequiredFieldValidator>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_city" runat="server" CssClass="form-control" placeholder="city"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldCity" 
                                        runat="server" 
                                        ErrorMessage="City is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_city"></asp:RequiredFieldValidator>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_postalCode" runat="server" CssClass="form-control" placeholder="postal code"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldPostalCode" 
                                        runat="server" 
                                        ErrorMessage="Postal Code is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_postalCode"></asp:RequiredFieldValidator>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_password" runat="server" type="password" class="form-control" placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldPassword" 
                                        runat="server" 
                                        ErrorMessage="Password is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_password"></asp:RequiredFieldValidator>
        </div>
        
        <div class="form-group">
            <asp:TextBox ID="txt_confirmPassword" runat="server" type="password" class="form-control" placeholder="Confirm Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldConfirmPassword" 
                                        runat="server" 
                                        ErrorMessage="Confirm password is Required"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ControlToValidate="txt_confirmPassword"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="ComparePassword" 
                                  runat="server" 
                                  ErrorMessage="The password and confirmation password do not match."
                                  ControlToValidate="txt_confirmPassword"
                                  ControlToCompare="txt_password"
                                  Type="String"
                                  Display="Dynamic"
                                  ForeColor="Red"></asp:CompareValidator>
        </div>      

        <div class="form-group">
            <div class="checkbox i-checks">
                <label>
                    <input type="checkbox" /><i></i> Agree the terms and policy </label>
            </div>
        </div>
        <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary block full-width m-b" Text="Register" OnClick="btn_submit_Click"></asp:Button>

        <p class="text-muted text-center"><small>Already have an account?</small></p>
        <a class="btn btn-sm btn-white btn-block" href="Login.aspx">Login</a>
    </form>
        <p class="m-t"> <small>Piano Plus Studio &copy; 2017</small> </p>
        </div>
</body>
</html>
