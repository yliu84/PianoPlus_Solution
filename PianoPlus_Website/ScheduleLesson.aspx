<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ScheduleLesson.aspx.cs" Inherits="ScheduleLesson" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="Content/css/bootstrap-datepicker3.css" rel="stylesheet" />
    <link href="Content/css/clockpicker.css" rel="stylesheet" />

<div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Class</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="#">All Classes</a>
                </li>
                <li>
                    <a href="#"><span class="text-navy">Add Class</span></a>
                </li>
            </ol>
        </div>
        <div class="col-lg-2"></div>
    </div>
    <asp:ScriptManager runat="server" ID="ScriptManager" />
    <uc1:MessageUserControl runat="server" ID="MessageUserControl1" />
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Add New Class</h5>
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
                            <div class="col-lg-12">
                                <div class="tabs-container">
                                    <ul class="nav nav-tabs">
                                        <li class="active" runat="server" id="step1"><a href="#tabOne">Find Student</a></li>
                                        <li class="disabled" runat="server" id="step2"><a href="#tabTwo">Pick Time</a></li>
                                        <li class="disabled" runat="server" id="step3"><a href="#tabThree">Schedule Class</a></li>
                                    </ul>

                                    <div class="tab-content" runat="server">
                                        <div id="tabOne" class="tab-pane active" runat="server">
                                            <div class="panel-body">
                                                <div class="input-group col-lg-6">
                                                    <asp:TextBox ID="txt_studentName" runat="server" CssClass="form-control" placeholder="Search student name"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:LinkButton ID="btn_search" runat="server" CssClass="btn btn-primary">Go!</asp:LinkButton>
                                                    </span>
                                                </div>

                                                <div class="table-responsive">
                                                    <asp:GridView ID="StudentGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataKeyNames="StudentID" AllowPaging="True" DataSourceID="StudentODS">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton Text="Select" ID="btn_select" runat="server" CssClass="btn btn-sm btn-info" OnClick="btn_select_Click" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" Visible="False" />
                                                            <asp:BoundField DataField="FullName" HeaderText="Student Name" SortExpression="FullName" />
                                                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="False" />
                                                            <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" Visible="False" />
                                                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="False" />
                                                            <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" Visible="False" />
                                                            <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" />
                                                            <asp:BoundField DataField="CreateDate" HeaderText="Created Date" SortExpression="CreateDate" DataFormatString="{0:d}" />
                                                        </Columns>
                                                        <EmptyDataTemplate>
                                                            No data found
                                                        </EmptyDataTemplate>
                                                    </asp:GridView>
                                                </div>
                                                <div class="col-lg-12">

                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label5" runat="server" Text="Student ID" CssClass="col-lg-4 control-label"></asp:Label>
                                                                    <div class="col-lg-8">
                                                                        <asp:TextBox ID="txt_studentID" runat="server" CssClass="form-control" placeholder="Student ID" Enabled="false"></asp:TextBox>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <asp:Label ID="Label6" runat="server" Text="Student Name" CssClass="col-lg-4 control-label"></asp:Label>
                                                                    <div class="col-lg-8">
                                                                        <asp:TextBox ID="txt_name2" runat="server" CssClass="form-control" placeholder="Student Name" Enabled="false"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                        <%--<Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_select" />
                                                        </Triggers>--%>
                                                    </asp:UpdatePanel>

                                                    <div class="col-lg-6">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 text-right">
                                                    <asp:LinkButton ID="btn_next" runat="server" CssClass="btn btn-info" Width="150px" OnClick="btn_next_Click">Select a Date</asp:LinkButton>
                                                </div>

                                            </div>
                                        </div>

                                        <div id="tabTwo" class="tab-pane" runat="server">
                                            <div class="panel-body">
                                                <h2>Select a date</h2>

                                                <div class="col-lg-6">
                                                    <div class="form-group" id="date1">
                                                        <asp:Label CssClass="col-md-4 control-label" Text="Pick a Date" runat="server" />
                                                        <div class="input-group date">
                                                            <asp:TextBox ID="txt_date" runat="server" CssClass="form-control" OnTextChanged="txt_date_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                            <div class="input-group-addon">
                                                                <span class="glyphicon glyphicon-th"></span>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldDate"
                                                                runat="server"
                                                                ErrorMessage="Date is required"
                                                                ValidationGroup ="time"
                                                                Display="Dynamic"
                                                                ForeColor="Red"
                                                                ControlToValidate="txt_date"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label CssClass="col-md-4 control-label" Text="Start Time" runat="server" />
                                                        <div class="input-group clockpicker" data-autoclose="true">
                                                            <asp:TextBox ID="txt_startTime" runat="server" CssClass="form-control"></asp:TextBox>
                                                            <div class="input-group-addon">
                                                                <span class="fa fa-clock-o"></span>
                                                            </div>
                                                                                                              
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldStartTime"
                                                                runat="server"
                                                                ErrorMessage="Start time is required"
                                                                ValidationGroup ="time"
                                                                Display="Dynamic"
                                                                ForeColor="Red"
                                                                ControlToValidate="txt_startTime"></asp:RequiredFieldValidator> 
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label CssClass="col-md-4 control-label" Text="End Time" runat="server" />
                                                        <div class="input-group clockpicker" data-autoclose="true">

                                                            <asp:TextBox ID="txt_endTime" runat="server" CssClass="form-control"></asp:TextBox>
                                                            <div class="input-group-addon">
                                                                <span class="fa fa-clock-o"></span>
                                                            </div>
                                                                                                                 
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldEndTime"
                                                                runat="server"
                                                                ErrorMessage="End time is required"
                                                                ValidationGroup ="time"
                                                                Display="Dynamic"
                                                                ForeColor="Red"
                                                                ControlToValidate="txt_endTime"></asp:RequiredFieldValidator>  
                                                    </div>

                                                </div>

                                                <div class="col-lg-6">

                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                                        <ContentTemplate>
                                                            <div class="table-responsive">

                                                                <asp:GridView ID="DailyClassGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataKeyNames="StartTime">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" Visible="False" />
                                                                        <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" SortExpression="InstructorID" Visible="false" />
                                                                        <asp:BoundField DataField="CourseCode" HeaderText="Course Code" SortExpression="CourseCode" />
                                                                        <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" DataFormatString="{0:T}" />
                                                                        <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime" DataFormatString="{0:T}" />
                                                                        <asp:BoundField DataField="DayOfWeek" HeaderText="Day Of Week" SortExpression="DayOfWeek" />
                                                                        <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" Visible="False" />

                                                                    </Columns>
                                                                    <EmptyDataTemplate>
                                                                        No Class Found
                                                                    </EmptyDataTemplate>
                                                                </asp:GridView>

                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="txt_date" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>

                                                </div>

                                                <div class="col-lg-12 text-right">
                                                    <asp:LinkButton ID="btn_back" runat="server" CssClass="btn btn-default" Width="150px" CausesValidation="false" OnClick="btn_back_Click">Back</asp:LinkButton>
                                                    <asp:LinkButton ID="btn_save" runat="server" CssClass="btn btn-primary" Width="150px" ValidationGroup ="time" OnClick="btn_save_Click">Select Lesson</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="tabThree" class="tab-pane" runat="server">
                                            <div class="panel-body">
                                                <h2>Enroll Class</h2>

                                                <div class="col-lg-6">

                                                    <div class="form-group">
                                                        <asp:Label ID="Label1" runat="server" Text="Class Date" CssClass="col-lg-3 control-label"></asp:Label>
                                                        <div class="col-lg-9">
                                                            <asp:TextBox ID="txt_selectedDate" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="Label2" runat="server" Text="Start Time" CssClass="col-lg-3 control-label"></asp:Label>
                                                        <div class="col-lg-9">
                                                            <asp:TextBox ID="txt_startT" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="RoomLabel" runat="server" Text="Room" CssClass="col-lg-3 control-label"></asp:Label>
                                                        <div class="col-lg-9">
                                                            <asp:TextBox ID="txt_Room" CssClass="form-control" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldRoom"
                                                                runat="server"
                                                                ErrorMessage="Room is required"
                                                                ValidationGroup ="schedule"
                                                                Display="Dynamic"
                                                                ForeColor="Red"
                                                                ControlToValidate="txt_Room"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                </div>


                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <asp:Label ID="lbl_studentName" runat="server" Text="Student Name" CssClass="col-lg-4 control-label"></asp:Label>
                                                        <div class="col-lg-8">
                                                            <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="Label3" runat="server" Text="End Time" CssClass="col-lg-4 control-label"></asp:Label>
                                                        <div class="col-lg-8">
                                                            <asp:TextBox ID="txt_endT" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="Label4" runat="server" Text="Course" CssClass="col-lg-4 control-label"></asp:Label>
                                                        <div class="col-lg-8">
                                                            <asp:DropDownList ID="ddl_course" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                                <asp:ListItem Value="0">Select a Course</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldCourse"
                                                                runat="server"
                                                                ErrorMessage="Course is required"
                                                                InitialValue ="0"
                                                                ValidationGroup ="schedule"
                                                                Display="Dynamic"
                                                                ForeColor="Red"
                                                                ControlToValidate="ddl_course"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>


                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="col-lg-6"></div>
                                                    <div class="col-lg-6 text-right">
                                                        <asp:LinkButton ID="btn_back2" runat="server" CssClass="btn btn-default" Width="150px" CausesValidation="false" OnClick="btn_back2_Click">Back</asp:LinkButton>
                                                        <asp:LinkButton ID="btn_submit" runat="server" CssClass="btn btn-primary" Width="150px" ValidationGroup ="schedule" OnClick="btn_submit_Click">Submit</asp:LinkButton>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
        </div>
            </div>
        </div>
    </div>

    <asp:ObjectDataSource ID="StudentODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Student_List" TypeName="PianoPlus_System.BLL.StudentController">
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_studentName" Name="name" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <script src="Scripts/js/jquery-1.11.2.min.js"></script>
    <script src="Scripts/js/bootstrap-datepicker.js"></script>
    <script src="Scripts/js/clockpicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });

    $('.clockpicker').clockpicker();
        })
    </script>
    

</asp:Content>

