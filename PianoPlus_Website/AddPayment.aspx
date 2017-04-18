<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddPayment.aspx.cs" Inherits="AddPayment" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="Content/css/bootstrap-datepicker3.css" rel="stylesheet" />
    <link href="Content/css/clockpicker.css" rel="stylesheet" />

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Payment</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="InvoiceManager.aspx">All Payments</a>
                </li>
                <li>
                    <a href="AddPayment.aspx"><span class="text-navy">Add Payment</span></a>
                </li>
            </ol>
        </div>

        <div class="col-lg-2"></div>
    </div>
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Add New Payment</h5>
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
                        <div class="form-horizontal">
                            <div class="col-lg-12">

                                <div class="tabs-container">
                                    <ul class="nav nav-tabs">
                                        <li class="active" runat="server" id="step1"><a href="#tabOne">Find Student</a></li>
                                        <li class="disabled" runat="server" id="step2"><a href="#tabTwo">Payment Details</a></li>
                                    </ul>

                                    <div class="tab-content" runat="server">
                                        <div id="tabOne" class="tab-pane active" runat="server">
                                            <div class="panel-body">
                                                <div class="input-group col-lg-6" style="margin-bottom:10px">
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
                                                                    <asp:LinkButton Text="Select" ID="btn_select" runat="server" CssClass="btn btn-sm btn-info" CausesValidation="false" OnClick="btn_select_Click" />
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

                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label3" runat="server" Text="Student ID" CssClass="col-lg-4 control-label"></asp:Label>
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

                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldStudentID"
                                                    runat="server"
                                                    ErrorMessage="Select a student."
                                                    ValidationGroup ="student"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ControlToValidate="txt_studentID"></asp:RequiredFieldValidator>
                                                <div class="col-lg-12 text-right">
                                                    <asp:LinkButton ID="btn_next" runat="server" CssClass="btn btn-info" ValidationGroup="student" OnClick="btn_next_Click">Give Payment Details</asp:LinkButton>
                                                </div>

                                            </div>
                                        </div>
                                        <div id="tabTwo" class="tab-pane" runat="server">
                                            <div class="panel-body">
                                                
                                
                                                <div class="form-group">
                                                    <asp:Label ID="Label2" runat="server" Text="Course Code" CssClass="col-lg-3 control-label"></asp:Label>
                                                    <div class="col-lg-4">
                                                        <asp:DropDownList ID="ddl_course" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Select a Course</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldCourse"
                                                            runat="server"
                                                            ErrorMessage="Course is required"
                                                            InitialValue ="0"
                                                            Display="Dynamic"
                                                            ForeColor="Red"
                                                            ControlToValidate="ddl_course"></asp:RequiredFieldValidator>
                                       
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label ID="Label5" runat="server" Text="Hours" CssClass="col-lg-3 control-label"></asp:Label>
                                                    <div class="col-lg-1">
                                                        <asp:TextBox ID="txt_Hours" runat="server" CssClass="form-control" placeholder="Hours"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldHours"
                                                            runat="server"
                                                            ErrorMessage="Hours is Required"
                                                            Display="Dynamic"
                                                            ForeColor="Red"
                                                            ControlToValidate="txt_Hours"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator runat="server"
                                                            ErrorMessage="Invalid Hours Must be between 0 and 100!"
                                                            ControlToValidate="txt_hours"
                                                            ValidationExpression="^[1-9][0-9]?$|^100$"
                                                            ForeColor="Red"
                                                            Display="Dynamic" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label ID="Label1" runat="server" Text="Total Lesson Fee" CssClass="col-lg-3 control-label"></asp:Label>
                                                    <div class="col-lg-2">
                                                        <asp:TextBox ID="txt_Fee" runat="server" CssClass="form-control" placeholder="Lesson Fee"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldFee"
                                                            runat="server"
                                                            ErrorMessage="Lesson Fee is Required"
                                                            Display="Dynamic"
                                                            ForeColor="Red"
                                                            ControlToValidate="txt_Fee"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>      
                                                <div class="col-lg-12">
                                                    <div class="form-group pull-right">
                                                        <asp:LinkButton ID="btn_add" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_add_Click">Add</asp:LinkButton>
                                                        <asp:LinkButton ID="btn_back" runat="server" CssClass="btn btn-default btn-warning" Width="100px" OnClick="btn_back_Click" CausesValidation="false">Back</asp:LinkButton>
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
    <script src="Scripts/jquery-2.1.1.js"></script>
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

