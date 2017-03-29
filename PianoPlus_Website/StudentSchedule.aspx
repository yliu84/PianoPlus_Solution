<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentSchedule.aspx.cs" Inherits="StudentSchedule" %>

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
                        <li><a href="AccountSettings.aspx">About</a></li>
                        <li class="active"><a href="#">Classes</a></li>
                    </ul>

                    <!-- Basic Information -->
                    <div class="pmb-block">
                        Class Schedule
                        <asp:GridView ID="ClassSchedule" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ODSStudentSchedule">
                            <Columns>
                                <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                                <asp:BoundField DataField="InstructorName" HeaderText="InstructorName" SortExpression="InstructorName" />
                                <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
                                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                                <asp:BoundField DataField="DayOfWeek" HeaderText="DayOfWeek" SortExpression="DayOfWeek" />
                                <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                                <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                            </Columns>
                        </asp:GridView>

                        Class History
                        <asp:GridView ID="ClassHistory" runat="server" AutoGenerateColumns="False" DataSourceID="ODSStudentHistory">
                            <Columns>
                                <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                                <asp:BoundField DataField="InstructorName" HeaderText="InstructorName" SortExpression="InstructorName" />
                                <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
                                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                                <asp:BoundField DataField="DayOfWeek" HeaderText="DayOfWeek" SortExpression="DayOfWeek" />
                                <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                                <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                            </Columns>
                        </asp:GridView>

                    </div>
                    <!-- Basic Information End -->

                    <!-- Contact Information -->
            </div>
        </section>
        <asp:ObjectDataSource ID="ODSStudentSchedule" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetClassesByEndTimeAndStudentID" TypeName="PianoPlus_System.BLL.ClassController">
            <SelectParameters>
                <asp:Parameter DefaultValue="2000" Name="studentID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ODSStudentHistory" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetClassHistoryByStudentID" TypeName="PianoPlus_System.BLL.ClassController">
            <SelectParameters>
                <asp:Parameter DefaultValue="2000" Name="studentID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>

    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="Scripts/waves.min.js"></script>
    <script src="Scripts/app.min.js"></script>
   <%-- <script type="text/javascript">
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
    </script>--%>
</body>
</html>
