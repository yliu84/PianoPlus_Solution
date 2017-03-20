<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

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
    <form id="form1" runat="server">
        <div class="text-center loginscreen animated fadeInDown">

            <h1 class="logo-name">PIANO+</h1>
            <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
        </div>
        <div class="middle-box text-center loginscreen animated fadeInDown">
        </div>
    </form>
</body>
</html>
