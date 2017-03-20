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
                                        <asp:LinkButton ID="btn_search" runat="server" CssClass="btn btn-primary">Go!</asp:LinkButton>
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="ClassGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ODSClasses" DataKeyNames="StartTime, EndTime, InstructorID">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Text="Select" ID="btn_select" runat="server" CssClass="btn btn-sm btn-info" OnClick="btn_select_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                                    <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
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
                        <div class="ibox float-e-margins" runat="server" id="ClassInfo" visible="true">
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
                            <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
                            <div class="ibox-content">
                                <div class="form-horizontal">
                                    
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
        })
    </script>
</asp:Content>

