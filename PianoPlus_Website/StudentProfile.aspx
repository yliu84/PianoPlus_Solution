<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="StudentProfile" %>

<!DOCTYPE html>

<link href="Content/css/bootstrap.min.css" rel="stylesheet" />
<link href="Content/css/css-classic.css" rel="stylesheet" />
<!-- font awesome -->
<link href="Content/css/font-awesome.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
                <div class="col-md-12">
                    <h1>Student Profile</h1>
                </div>
                <div class="col-md-12">
                    <div class="view">
                        <dl class="dl-horizontal">
                            <dt>Email</dt>
                            <dd>
                                <asp:Label ID="EmailLabel" runat="server" Text="TestEmail"></asp:Label>
                            </dd>
                            <dt>Phone</dt>
                            <dd>
                                <asp:Label ID="PhoneLabel" runat="server" Text="780-473-7373"></asp:Label>
                            </dd>
                            <dt>Address</dt>
                            <dd>
                                <asp:Label ID="AddressLabel" runat="server" Text="Test Address"></asp:Label>
                            </dd>
                            <dt>Province</dt>
                            <dl>
                                <asp:Label ID="ProvinceLabel" runat="server" Text="Test Province"></asp:Label>
                            </dl>
                            <dt>City</dt>
                            <dd>
                                <asp:Label ID="CityLabel" runat="server" Text="Test City"></asp:Label>
                            </dd>
                            <dt>Postal Code</dt>
                            <dd>
                                <asp:Label ID="PostalCodeLabel" runat="server" Text="TestLabel"></asp:Label>
                            </dd>
                        </dl>
                    </div>
                    <div class="edit" runat="server" visible="false" id="edit">
                        <asp:Panel runat="server" DefaultButton="btn_saveEdit">
                            <dl class ="dl-horizontal">
                                <dt>Email</dt>
                                <dd>
                                    <asp:TextBox ID="emailValue" runat="server"></asp:TextBox>
                                </dd>
                                <dt>Phone</dt>
                                <dd>
                                    <asp:TextBox ID="phoneValue" runat="server"></asp:TextBox>
                                </dd>
                                <dt>Address</dt>
                                <dd>
                                    <asp:TextBox ID="addressValue" runat="server"></asp:TextBox>
                                </dd>
                                <dt>Province</dt>
                                <dd>
                                    <asp:TextBox ID="provinceValue" runat="server"></asp:TextBox>
                                </dd>
                                <dt>City</dt>
                                <dd>
                                    <asp:TextBox ID="cityValue" runat="server"></asp:TextBox>
                                </dd>
                                <dt>Postal Code</dt>
                                <dd>
                                    <asp:TextBox ID="postalCodeValue" runat="server"></asp:TextBox>
                                </dd>
                            </dl>
                            <asp:Button ID="btn_saveEdit" runat="server" Text="Save Edits" OnClick="btn_saveEdit_Click" />
                        </asp:Panel>
                        <asp:Button ID="EditBtn" runat="server" Text="Edit Profile" OnClick="EditBtn_Click" />
                        
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
