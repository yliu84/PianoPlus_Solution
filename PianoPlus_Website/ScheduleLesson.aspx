<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ScheduleLesson.aspx.cs" Inherits="ScheduleLesson" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Class</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="#">All Classes</a>
                </li>
                <li>
                    <a href="#"><span class="text-navy">Schedule Class</span></a>
                </li>
            </ol>
        </div>
        <div class="col-lg-2"></div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Add New Course</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="i-box-content">
                        <div class="form-horizontal">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="StudentIDLabel" runat="server" Text="Student ID" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_StudentID" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldStudentID"
                                            runat="server"
                                            ErrorMessage="Student ID is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_StudentID"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group">

                                    <asp:Label ID="CourseCodeLabel" runat="server" Text="Course Code" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_CourseCode" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldCourseCode"
                                            InitialValue ="0"
                                            runat="server"
                                            ErrorMessage="Course code is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_CourseCode"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <asp:Label ID="StartTimeLabel" runat="server" Text="Start Time" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_StartTime" CssClass="form-control" runat="server" TextMode="Time"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldStartTime"
                                            runat="server"
                                            ErrorMessage="Start Time is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_StartTime"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="EndTimeLabel" runat="server" Text="End Time" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_EndTime" CssClass="form-control" runat="server" TextMode="Time"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldEndTime"
                                            runat="server"
                                            ErrorMessage="End Time is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_EndTime"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <asp:Label ID="RoomLabel" runat="server" Text="Room" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_Room" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldRoom"
                                            runat="server"
                                            ErrorMessage="Roon is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_Room"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="form-group pull-right">
                                        <asp:Button ID="btn_EnrollLesson" runat="server" CssClass="btn btn-success" Width="150px" Text="Enroll Lesson" OnClick="btn_EnrollLesson_Click" ></asp:Button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="SelectDateLabel" runat="server" Text="Select Date" CssClass="col-lg-3 control-label" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_CalenderDate" runat="server" Text="" Visible="false" />
                                    <asp:Calendar ID="calender_SelectDate" runat="server" OnSelectionChanged="calender_SelectDate_SelectionChanged"/>
                                        <asp:RequiredFieldValidator ID="RequiredCalenderDate"
                                            runat="server"
                                            ErrorMessage="Must choose a date"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_CalenderDate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal">
                    <div class="ibox-content">
                        <div class="table-responsive">
                            <asp:GridView ID="ScheduleGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataKeyNames="StudentID">
                                <Columns>
                                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" Visible="False" />
                                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" SortExpression="InstructorID" visible="false"/>
                                    <asp:BoundField DataField="CourseCode" HeaderText="Course Code" SortExpression="CourseCode" />
                                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
                                    <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime" />
                                    <asp:BoundField DataField="DayOfWeek" HeaderText="Day Of Week" SortExpression="DayOfWeek" Visible="False"/>
                                    <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" Visible="False"/>
                                    <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room"/>
                                </Columns>
                                <EmptyDataTemplate>
                                    No data found
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

