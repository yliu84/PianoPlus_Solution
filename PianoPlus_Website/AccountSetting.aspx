﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountSetting.aspx.cs" Inherits="AccountSetting" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <link href="Content/animate.css" rel="stylesheet" />
    <link href="Content/material-design-iconic-font.min.css" rel="stylesheet" />
    <link href="Content/app_1.min.css" rel="stylesheet" />
    <link href="Content/app_2.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <section id="content">
            <%--<div class="container">

                <div class="block-header" style="margin-top:20px">
                    
                </div>
            </div>--%>

            <div class="card" id="profile-main" style="margin-top:25px">
                <div class="pm-overview c-overflow">

                    <div class="pmo-pic">
                        <div class="p-relative">
                            <a href="#">
                                <img class="img-responsive" runat="server" src="~/Images/profile.png" alt="profile picture" />
                            </a>

                            <a href="#" class="pmop-edit">
                                <i class="zmdi zmdi-camera"></i><span
                                    class="hidden-xs">Update Profile Picture</span>
                            </a>
                        </div>
                    </div>

                    <div class="pmo-block pmo-contact hidden-xs">
                        <h2>Malinda Hollaway
                            <small>Student</small>
                        </h2>
                        <h2>Contact</h2>

                        <ul>
                            <li><i class="zmdi zmdi-phone"></i>(780)708-2011</li>
                            <li><i class="zmdi zmdi-email"></i>test@gmail.com</li>
                            <li>
                                <i class="zmdi zmdi-pin"></i>
                                <address class="m-b-0 ng-binding">
                                    44-46 Morningside Road,<br />
                                    Edinburgh,<br />
                                    Scotland
                                </address>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="pm-body clearfix">
                    <ul class="tab-nav tn-justified">
                        <li class="active"><a href="profile-about.html">About</a></li>
                        <li><a href="profile-timeline.html">Schedule</a></li>
                    </ul>

                    <!-- Basic Information -->
                    <div class="pmb-block">
                        <asp:UpdatePanel runat="server" ID="up_basic" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <div class="pmbb-header">
                                    <h2><i class="zmdi zmdi-account m-r-10"></i>Basic Information</h2>

                                    <ul class="actions">
                                        <li class="dropdown">
                                            <a href="#" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>

                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li>
                                                    <asp:LinkButton ID="btn_editBasic" runat="server" data-ma-action="profile-edit" OnClientClick="EditModeOn()">Edit</asp:LinkButton>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="pmbb-body p-l-30">
                                    <div class="pmbb-view">
                                        <dl class="dl-horizontal">
                                            <dt>First Name</dt>
                                            <dd>
                                                <asp:Label runat="server" ID="lbl_firstname" Text=""></asp:Label>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Last Name</dt>
                                            <dd>
                                                <asp:Label runat="server" ID="lbl_lastname" Text=""></asp:Label>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Birthday</dt>
                                            <dd>
                                                <asp:Label ID="lbl_birthDay" runat="server" Text=""></asp:Label>
                                            </dd>
                                        </dl>

                                    </div>

                                    <div class="pmbb-edit">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                        <asp:Panel runat="server" DefaultButton="btn_saveBasic">
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">First Name</dt>
                                                <dd>
                                                    <div class="fg-line">
                                                        <asp:TextBox ID="txt_firstName" CssClass="form-control" runat="server" placeholder="eg. Mallinda"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Basic" ControlToValidate="txt_firstname" CssClass="text-danger"
                                                        ErrorMessage="First Name is required." />
                                                </dd>
                                            </dl>
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">Last Name</dt>
                                                <dd>
                                                    <div class="fg-line">
                                                        <asp:TextBox runat="server" ID="txt_lastname" class="form-control" placeholder="eg. Hollaway" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Basic" ControlToValidate="txt_lastname" CssClass="text-danger"
                                                        ErrorMessage="Last Name is required." />
                                                </dd>
                                            </dl>
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">Birthday</dt>
                                                <dd>
                                                    <div class="dtp-container dropdown fg-line">
                                                        <%--               <input type='text' class="form-control date-picker"
                                                data-toggle="dropdown" placeholder="Click here...">--%>
                                                        <asp:TextBox ID="txt_birthDay" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Basic" ControlToValidate="txt_birthDay" CssClass="text-danger"
                                                        ErrorMessage="Birth Day is required." />
                                                </dd>
                                            </dl>


                                            <div class="m-t-30">

                                                <asp:LinkButton runat="server" ID="btn_saveBasic" CssClass="btn btn-primary btn-sm" Text="Save" ValidationGroup="Basic" OnClick="btn_saveBasic_Click"></asp:LinkButton>
                                                <asp:LinkButton runat="server" OnClientClick="EditModeOff()" data-ma-action="profile-edit-cancel" class="btn btn-link btn-sm" ID="btn_closeBasic_edit">Close Editing</asp:LinkButton>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_saveBasic" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <!-- Basic Information End -->

                    <!-- Contact Information -->
                    <div class="pmb-block" runat="server">
                        <asp:UpdatePanel runat="server" ID="up_contact" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <div class="pmbb-header">
                                    <h2><i class="zmdi zmdi-phone m-r-10"></i>Contact Information</h2>

                                    <ul class="actions">
                                        <li class="dropdown">
                                            <a href="#" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>

                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li>
                                                    <asp:LinkButton Text="Edit" data-ma-action="profile-edit" runat="server" ID="btn_editContact" OnClientClick="EditModeOn()" />
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="pmbb-body p-l-30">
                                    <div class="pmbb-view">
                                        <dl class="dl-horizontal">
                                            <dt>Mobile Phone</dt>
                                            <dd>
                                                <asp:Label ID="lbl_phone" runat="server" Text=""></asp:Label>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Email Address</dt>
                                            <dd>
                                                <asp:Label ID="lbl_email" runat="server" Text=""></asp:Label>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Street Address</dt>
                                            <dd>
                                                <asp:Label ID="lbl_address" runat="server" Text=""></asp:Label>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Province</dt>
                                            <dd>
                                                <asp:Label ID="lbl_province" runat="server" Text=""></asp:Label>
                                            </dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>City</dt>
                                            <dd>
                                                <asp:Label runat="server" ID="lbl_city" Text=""></asp:Label></dd>
                                        </dl>
                                        <dl class="dl-horizontal">
                                            <dt>Postal Code</dt>
                                            <dd>
                                                <asp:Label runat="server" ID="lbl_postalcode" Text=""></asp:Label></dd>
                                        </dl>
                                    </div>

                                    <div class="pmbb-edit">
                                        <asp:Panel runat="server" DefaultButton="btn_saveContact">
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">Mobile Phone</dt>
                                                <dd>
                                                    <div class="fg-line">
                                                        <asp:TextBox runat="server" ID="txt_phonenumber" CssClass="form-control" placeholder="eg. 780-780-7800" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="contact" ControlToValidate="txt_phonenumber" CssClass="text-danger"
                                                        ErrorMessage="Phone Number is Required." />
                                                </dd>
                                            </dl>
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">Email Address</dt>
                                                <dd>
                                                    <div class="fg-line">
                                                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="eg. nail@gmail.com"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="contact" ControlToValidate="txt_email" CssClass="text-danger"
                                                        ErrorMessage="Email is Required." />
                                                </dd>
                                            </dl>
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">Street Address</dt>
                                                <dd>
                                                    <div class="fg-line">
                                                        <asp:TextBox runat="server" ID="txt_address" class="form-control" placeholder="eg. 123 Abc Street" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="contact" ControlToValidate="txt_address" CssClass="text-danger"
                                                        ErrorMessage="Street Address is Required." />
                                                </dd>
                                            </dl>
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">Province</dt>
                                                <dd>
                                                    <div class="fg-line">
                                                        <asp:TextBox runat="server" ID="txt_province" class="form-control" placeholder="eg. Alberta" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="contact" ControlToValidate="txt_province" CssClass="text-danger"
                                                        ErrorMessage="Province is Required." />
                                                </dd>
                                            </dl>
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">City</dt>
                                                <dd>
                                                    <div class="fg-line">
                                                        <asp:TextBox runat="server" ID="txt_city" class="form-control" placeholder="eg. Edmonton" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="contact" ControlToValidate="txt_city" CssClass="text-danger"
                                                        ErrorMessage="City is Required." />
                                                </dd>
                                            </dl>
                                            <dl class="dl-horizontal">
                                                <dt class="p-t-10">Postal Code</dt>
                                                <dd>
                                                    <div class="fg-line">
                                                        <asp:TextBox runat="server" ID="txt_postalcode" class="form-control" placeholder="eg. A1A B2B" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="contact" ControlToValidate="txt_postalcode" CssClass="text-danger"
                                                        ErrorMessage="Postal Code is Required." />
                                                    <br />
                                                    <asp:RegularExpressionValidator ID="regexPostal" runat="server" CssClass="text-danger"
                                                        ValidationExpression="^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$"
                                                        ControlToValidate="txt_postalcode" ErrorMessage="Postal code was not in the correct format. eg T2X 1V4 or T2X1V4" ValidationGroup="contact">
                                                    </asp:RegularExpressionValidator>
                                                </dd>
                                            </dl>
                                            <div class="m-t-30">
                                                <asp:LinkButton runat="server" ID="btn_saveContact" CssClass="btn btn-primary btn-sm" Text="Save" ValidationGroup="contact" OnClick="btn_saveContact_Click"></asp:LinkButton>
                                                <asp:LinkButton runat="server" OnClientClick="EditModeOff()" data-ma-action="profile-edit-cancel" class="btn btn-link btn-sm" ID="btn_closeContact_edit">Close Editing</asp:LinkButton>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_saveContact" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <!-- Contact Information End-->
                </div>
            </div>

            <!-- Hidden Fields -->
            <asp:HiddenField runat="server" ID="hidden_editmode" Value="0" />
            <asp:HiddenField runat="server" ID="hidden_userid" Value="0" />
            <!-- /Hidden Fields -->
        </section>
    </form>

    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="Scripts/waves.min.js"></script>
    <script src="Scripts/app.min.js"></script>
    <script type="text/javascript">
        function notify(animIn, animOut, type, msg, title) {
            $.growl({
                title: ' ' + title + ' ',
                message: msg,
                url: ''
            }, {
                element: 'body',
                type: type,
                allow_dismiss: true,
                offset: {
                    x: 20,
                    y: 85
                },
                spacing: 10,
                z_index: 1031,
                delay: 5000,
                timer: 1000,
                url_target: '_blank',
                mouse_over: false,
                animate: {
                    enter: animIn,
                    exit: animOut
                },
                icon_type: 'class',
                template: '<div data-growl="container" class="alert" role="alert">' +
                                '<button type="button" class="close" data-growl="dismiss">' +
                                    '<span aria-hidden="true">&times;</span>' +
                                    '<span class="sr-only">Close</span>' +
                                '</button>' +
                                '<span data-growl="icon"></span>' +
                                '<b><span data-growl="title"></span></b>' +
                                '<span data-growl="message"></span>' +
                                '<a href="#" data-growl="url"></a>' +
                            '</div>'
            });
        };
        function Smoke(sendtitle, sendmsg, msgtype) {
            var type = msgtype;
            var msg = sendmsg;
            var title = sendtitle;
            var nType = type;
            var nAnimIn = 'animated flipInX';
            var nAnimOut = 'animated flipOutX';
            var msg = msg;
            var title = title;
            notify(nAnimIn, nAnimOut, nType, msg, title);
        }
        // This is so Pageload doesn't reload the values each page load. This was causing issues where I would edit the text in a a text box. On postback
        // The page load would replace the values with what's in the DB.
        function EditModeOn() {
            $('#<%=hidden_editmode.ClientID%>').val("1");
        }
        function EditModeOff() {
            $('#<%=hidden_editmode.ClientID%>').val("0");
        }

        // This manually closes the editing. and refresehes the update panels to ensure you see the new information.
        function EndEdit() {
            $('.pmb-block').removeClass('toggled');
            $('#<%=hidden_editmode.ClientID%>').val("0");
            __doPostBack('<%= up_basic.ClientID %>', '');
            __doPostBack('<%= up_contact.ClientID %>', '');
        }
    </script>
</body>
</html>
