<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ClassManager.aspx.cs" Inherits="ClassManager" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--<link href="Content/css/bootstrap-datepicker3.css" rel="stylesheet" />--%>
    <link href="Content/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
    <link href="Content/css/clockpicker.css" rel="stylesheet" />

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Classes</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="ClassManager.aspx"><span class="text-navy">All Classes</span></a>
                </li>
                <li>
                    <a href="ScheduleLesson.aspx">Add Class</a>
                </li>
            </ol>
        </div>

        <div class="col-lg-2"></div>
    </div>
    
    <asp:ScriptManager runat="server" ID="ScriptManager" />
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Seach class and check class details</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row">
                            <div class="form-group col-lg-5" id="day" style="margin: 20px 10px">
                                <label class="font-bold">Date Range select</label>
                                <div class="input-group input-daterange" >
                                    <asp:TextBox ID="txt_startDay" runat="server" CssClass="form-control" placeholder="03/01/2017"></asp:TextBox>
                                    <div class="input-group-addon">to</div>
                                    <asp:TextBox ID="txt_endDay" runat="server" CssClass="form-control" placeholder="03/31/2017"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="btn_searchDates" runat="server" CssClass="btn btn-primary">Go!</asp:LinkButton>
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="ClassGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AllowPaging="True" AutoGenerateColumns="False"
                                DataSourceID="ODSClasses" DataKeyNames="StartTime, CourseCode, InstructorID">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Text="Select" ID="btn_select" runat="server" CssClass="btn btn-sm btn-info" OnClick="btn_select_Click"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" Visible="false"/>
                                    <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                                    <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" Visible="false"/>
                                    <asp:BoundField DataField="InstructorName" HeaderText="InstructorName" SortExpression="InstructorName" Visible="false" />
                                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" SortExpression="InstructorID" Visible="false" />
                                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
                                    <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime" />
                                    <asp:BoundField DataField="DayOfWeek" HeaderText="Day Of Week" SortExpression="DayOfWeek" />
                                    <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                                    <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins" runat="server" id="ClassInfo">
                            <div class="ibox-title">
                                <h5>Class Info</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                           
                    <div id="ClassInfoTab" class="i-box-content" >
                        <div class="form-horizontal">
                            <div class="col-lg-12">
                                <div class="tabs-container">
                                    <asp:Menu 
                                        runat="server" 
                                        ID="TabsMenu"
                                        Orientation="Horizontal" 
                                        CssClass="nav nav-tabs" 
                                        StaticMenuStyle-CssClass="nav nav-tabs" 
                                        StaticSelectedStyle-CssClass="active"
                                        IncludeStyleBlock="false" 
                                        RenderingMode="List"
                                        OnMenuItemClick="TabsMenu_MenuItemClick">
                                        <Items>
                                            <asp:MenuItem Text="Students" Value="Students" Selected="true"></asp:MenuItem>
                                            <asp:MenuItem Text="Time" Value="Time"></asp:MenuItem>
                                            <asp:MenuItem Text="Course" Value="Course"></asp:MenuItem>
                                        </Items>
                                    </asp:Menu>
                                    <%--<ul class="nav nav-tabs">
                                        <li class="active" runat="server" id="step1"><a href="#tabOne">Find Student</a></li>
                                        <li class="active" runat="server" id="step2"><a href="#tabTwo">Pick Time</a></li>
                                        <li class="active" runat="server" id="step3"><a href="#tabThree">Schedule Class</a></li>
                                    </ul>--%>
                                    <div class="tab-content">
                                        <asp:MultiView runat="server" ID="ClassMultiView" Visible="false" ActiveViewIndex="0" >
                                            <asp:View runat="server" ID="StudentView" >
                                                <div id="Div1" class="tab-pane active" runat="server">
                                                    <div class="panel-body">

                                                        <div class="table-responsive">
                                                            <asp:GridView ID="StudentGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataKeyNames="StudentID" AllowPaging="True" >
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton Text="Remove" ID="btn_deleteStudentClass_Click" runat="server" CssClass="btn btn-sm btn-danger" OnClick="btn_deleteStudentClass_Click" />
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
                                                    </div>
                                                </div>

                                            </asp:View>
                                            <asp:View runat="server" ID="TimeView">
                                                <div id="tabTwo" class="tab-pane active" runat="server">
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
                                                                    <asp:requiredfieldvalidator id="requiredfielddate"
                                                                        runat="server"
                                                                        errormessage="date is required"
                                                                        validationgroup ="time"
                                                                        display="dynamic"
                                                                        forecolor="red"
                                                                        controltovalidate="txt_date"></asp:requiredfieldvalidator>
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
                                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldEndTime"
                                                                        runat="server"
                                                                        ErrorMessage="End time is required"
                                                                        ValidationGroup ="time"
                                                                        Display="Dynamic"
                                                                        ForeColor="Red"
                                                                        ControlToValidate="txt_endTime"></asp:RequiredFieldValidator>
                                                                <asp:CompareValidator ID="CompareTime" 
                                                                        runat="server" 
                                                                        ErrorMessage="The start time cannot be greater than end time"
                                                                        ControlToCompare="txt_startTime"
                                                                        ControlToValidate="txt_endTime"
                                                                        ForeColor="Red"
                                                                        Display="Dynamic"
                                                                        ValidationGroup ="time"
                                                                        Operator="GreaterThan">

                                                                </asp:CompareValidator>  --%>
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

                                                    </div>
                                                </div>

                                            </asp:View>
                                            <asp:View runat="server" ID="CourseView">
                                                <div id="tabThree" class="tab-pane active" runat="server">
                                                    <div class="panel-body">
                                                        <div class="col-lg-6">
                                                                                                                       
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
                                                        
                                                    </div>
                                                </div>
                                            </asp:View>
                                        </asp:MultiView>
                                        <div class="col-lg-12 text-right">                                            
                                            <asp:LinkButton ID="btn_submit" runat="server" CssClass="btn btn-primary" Width="150px" ValidationGroup ="schedule" OnClick="btn_submit_Click" Enabled="false" Visible="false">Save Changes</asp:LinkButton>
                                            <asp:LinkButton ID="btn_cancel" runat="server" CssClass="btn btn-danger" Width="150px" CausesValidation="false" OnClick="btn_cancel_Click" Enabled="false" Visible="false">Cancel</asp:LinkButton>
                                        </div>
                                        <asp:Label runat="server" ID="label_oldStartTime" Visible="false" />
                                        <asp:Label runat="server" ID="label_oldStudentID" Visible="false" />
                                        <asp:Label runat="server" ID="label_oldCourseCode" Visible="false" />
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
    <asp:ObjectDataSource ID="ODSClasses" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Class_List" TypeName="PianoPlus_System.BLL.ClassController">
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_startDay" Name="startDay" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txt_endDay" Name="endDay" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="instructorID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <%--<asp:ObjectDataSource ID="StudentODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="StudentInClass" TypeName="PianoPlus_System.BLL.StudentController">
        <SelectParameters>
            <asp:ControlParameter ControlID="label_oldCourseCode" Name="oldCourseCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ClassGridView" Name="startTime" PropertyName="studentID" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>
    <script src="Scripts/js/jquery-1.11.2.min.js"></script>
    <script src="Scripts/js/bootstrap-datepicker.js"></script>
    <script src="Scripts/js/clockpicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#day .input-daterange').datepicker({
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });
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

