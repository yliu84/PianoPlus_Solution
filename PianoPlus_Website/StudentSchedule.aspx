<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentSchedule.aspx.cs" Inherits="StudentSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <link href="Content/animate.css" rel="stylesheet" />
    <link href="Content/material-design-iconic-font.min.css" rel="stylesheet" />
    <link href="Content/app_1.min.css" rel="stylesheet" />
    <link href="Content/app_2.min.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
        <section id="content">
            <div class="clearfix">
                <div class="col-lg-12">
                    <nav class="ha-menu" style="">
                        <ul>
                            <li><a href="/default.aspx">Home</a></li>

                            <li class="dropdown pull-right">
                                <a href="#" runat="server" id="a_email" data-toggle="dropdown" class="f-14"></a>
                                <ul class="dropdown-menu">
                                    <li><a href="AccountSetting.aspx">Account</a></li>
                                    <li><a href="ResetPassword.aspx">Password Reset</a></li>
                                    <li runat="server" id="li_rightddl_logout">
                                        <asp:LinkButton Text="Logout" ID="btn_right_logout" CausesValidation="false" CssClass="c-red" runat="server" OnClick="btn_right_logout_Click" /></li>
                                </ul>
                            </li>
                            <li runat="server" id="li_rightddl_login" class="pull-right"><a href="/Login.aspx" class="c-amber" style="text-transform: none">Login</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <div class="card" id="profile-main" style="margin-top: 25px">
                <div class="pm-overview c-overflow">

                    <div class="pmo-pic row">
                        <div class="p-relative">
                            <a href="#">
                                <asp:Image CssClass="img-responsive col-md-12" runat="server" ImageUrl="~/Images/profile.png" alt="profile picture" ID="img_student" />
                                <%--<img class="img-responsive" runat="server" src="~/Images/profile.png" alt="profile picture" id="img_student" />--%>
                            </a>

                            <button class="pmop-edit" type="button" data-toggle="modal" data-target="#myModal6">
                                <i class="zmdi zmdi-camera"></i><span
                                    class="hidden-xs">Update Profile Picture</span>
                            </button>
                        </div>
                    </div>

                    <div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">Upload Profile Picture</h4>

                                </div>
                                <div class="modal-body">

                                    <div class="row">
                                        <div class="col-md-12" style="padding-top: 15px">
                                            <%--<div class="image-crop">
                                                <img src="Images/test.jpg" />
                                            </div>--%>

                                            <img src="Images/profile.png" id="img_preview" runat="server" class="col-md-12" />
                                        </div>

                                        <div class="col-md-12" style="padding-top: 10px; padding-bottom: 10px">

                                            <%--<div class="img-preview img-preview-sm"></div>--%>

                                            <div class="btn-group">
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </div>
                                            <asp:Label ID="lbl_message" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-white btn-sm" data-dismiss="modal">Close</button>
                                    <asp:LinkButton CssClass="btn btn-primary btn-sm" runat="server" ID="btn_savePhoto" OnClick="btn_savePhoto_Click" Text="Save changes" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="pmo-block pmo-contact hidden-xs">
                        <h2>
                            <asp:Label ID="lbl_name" runat="server" Text="Malinda Hollaway"></asp:Label>
                            <small>- Student</small>
                        </h2>
                        <h2>Contact</h2>

                        <ul>
                            <li><i class="zmdi zmdi-phone"></i>
                                <asp:Label ID="lbl_studentPhone" runat="server" Text=""></asp:Label></li>
                            <li><i class="zmdi zmdi-email"></i>
                                <asp:Label ID="lbl_studentEmail" runat="server" Text="Label"></asp:Label></li>
                            <li>
                                <i class="zmdi zmdi-pin"></i>
                                <address class="m-b-0 ng-binding">
                                    <asp:Label ID="lbl_studentAddress" runat="server" Text="Label"></asp:Label><br />
                                    <asp:Label ID="lbl_studentCity" runat="server" Text="Label"></asp:Label><br />
                                    <asp:Label ID="lbl_studentProvince" runat="server" Text="Label"></asp:Label>
                                </address>
                            </li>
                        </ul>
                    </div>

                </div>


                <div class="pm-body clearfix">
                    <ul class="tab-nav tn-justified">
                        <li><a href="AccountSetting.aspx">About</a></li>
                        <li class="active"><a href="StudentSchedule.aspx">Schedule</a></li>
                    </ul>

                    <!-- Basic Information -->
                    <div class="pmb-block">
                        <h2>Class Schedule</h2>
                        <hr />
                        <asp:GridView ID="ClassSchedule" runat="server" AllowPaging="True" CssClass="footable" AutoGenerateColumns="False" DataSourceID="ODSStudentSchedule" ShowHeader="true">
                            <Columns>
                                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                                <asp:BoundField DataField="InstructorName" HeaderText="InstructorName" SortExpression="InstructorName" />
                                <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
                                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                                <asp:BoundField DataField="DayOfWeek" HeaderText="DayOfWeek" SortExpression="DayOfWeek" />
                                <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                                <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                            </Columns>
                            <EmptyDataTemplate>
                                No class found
                            </EmptyDataTemplate>
                        </asp:GridView>

                        <h2>Class History</h2>
                        <hr />
                        <asp:GridView ID="ClassHistory" runat="server" AutoGenerateColumns="False" DataSourceID="ODSStudentHistory" CssClass="table table-condensed table-striped footable">
                            <Columns>
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
    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="Scripts/waves.min.js"></script>
    <script src="Scripts/app.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
       $("#FileUpload1").change(function () {
            $("#dvPreview").html("");
            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
            if (regex.test($(this).val().toLowerCase())) {
                
                    if (typeof (FileReader) != "undefined") {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $("#img_preview").attr("src", e.target.result);
                        }
                        reader.readAsDataURL($(this)[0].files[0]);
                    } else {
                        alert("This browser does not support FileReader.");
                    }
                
            } else {
                alert("Please upload a valid image file.");
            }
       });

       $(function () {
           $('[id*=ClassSchedule]').footable();
           $('[id*=ClassHistory]').footable();
       });
    </script>
</body>
</html>
