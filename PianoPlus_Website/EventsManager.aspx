<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="EventsManager.aspx.cs" Inherits="EventsManager" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <link href="Content/css/clockpicker.css" rel="stylesheet" />
    <link href="Content/css/bootstrap-datepicker3.css" rel="stylesheet" />
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Events</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a><span class="text-navy">All Events</span></a>
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
                        <h5>Events List</h5>
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
                        <div class="table-responsive">
                            <asp:GridView ID="EventGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ODSEvents" CssClass="table table-bordered table-condensed table-responsive" DataKeyNames="EventID">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="EventID" HeaderText="EventID" SortExpression="EventID" Visible="false" />
                                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" SortExpression="InstructorID" Visible="false" />
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                    <asp:BoundField DataField="StartAt" HeaderText="StartAt" SortExpression="StartAt" />
                                    <asp:BoundField DataField="EndAt" HeaderText="EndAt" SortExpression="EndAt" />
                                    <asp:CheckBoxField DataField="IsFullDay" HeaderText="IsFullDay" SortExpression="IsFullDay" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <asp:LinkButton ID="btn_show" runat="server" CssClass="btn btn-primary" OnClick="btn_show_Click" CausesValidation="false">Add New Event</asp:LinkButton>

                    </div>

                </div>
            </div>

            <div class="col-lg-12">
                <div class="ibox float-e-margins" runat="server" visible="false" id="New_Event">
                    <div class="ibox-title">
                        <h5>New Event</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1"
                         runat="server"
                         DisplayMode="BulletList"
                         HeaderText="One or more files are required as show below:"
                         CssClass="alert alert-danger" />

                    <div class="ibox-content">
                        <div class="form-horizontal">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Title" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="input-group col-lg-9">
                                        <asp:TextBox ID="txt_title" runat="server" CssClass="form-control" placeholder="title"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldTitle"
                                            runat="server"
                                            ErrorMessage="Title is required"
                                            Display="None"
                                            ForeColor="Red"
                                            ControlToValidate="txt_title"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Date" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="input-group date">
                                        <asp:TextBox ID="txt_date" runat="server" CssClass="form-control"></asp:TextBox>
                                        <div class="input-group-addon">
                                            <span class="glyphicon glyphicon-th"></span>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldDate"
                                            runat="server"
                                            ErrorMessage="Date is required"
                                            Display="None"
                                            ForeColor="Red"
                                            ControlToValidate="txt_date"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Sart At" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="input-group clockpicker col-lg-9" data-autoclose="true">
                                        <asp:TextBox ID="txt_startTime" runat="server" CssClass="form-control"></asp:TextBox>
                                        <div class="input-group-addon">
                                            <span class="fa fa-clock-o"></span>
                                        </div>

                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldStartTime"
                                        runat="server"
                                        ErrorMessage="Start time is required"                              
                                        Display="None"
                                        ForeColor="Red"
                                        ControlToValidate="txt_startTime"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="End At" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="input-group clockpicker col-lg-9" data-autoclose="true">
                                        <asp:TextBox ID="txt_endTime" runat="server" CssClass="form-control"></asp:TextBox>
                                        <div class="input-group-addon">
                                            <span class="fa fa-clock-o"></span>
                                        </div>

                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                        runat="server"
                                        ErrorMessage="End time is required"                    
                                        Display="None"
                                        ForeColor="Red"
                                        ControlToValidate="txt_endTime"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidatorTime" 
                                        runat="server" 
                                        ErrorMessage="End time must be greater than start time"
                                        ControlToCompare="txt_startTime"
                                        ControlToValidate="txt_endTime"
                                        Operator="GreaterThan"
                                        Display="None"></asp:CompareValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Full Day" CssClass="control-label col-lg-3"></asp:Label>
                                    <div class="input-group">                                       
                                        <asp:CheckBox ID="cb_fullDay" runat="server" CssClass="form-control" OnCheckedChanged="cb_fullDay_CheckedChanged" AutoPostBack="true"/>                                    
                                    </div>
                                    
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Description" CssClass="control-label col-lg-3"></asp:Label>
                                    <div class="input-group col-lg-9">                                       
                                        <asp:TextBox ID="txt_description" TextMode="MultiLine" Rows="10" CssClass="form-control" runat="server"></asp:TextBox>                                   
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldDescription"
                                        runat="server"
                                        ErrorMessage="Description is required"
                                        Display="None"
                                        ForeColor="Red"
                                        ControlToValidate="txt_description"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group pull-right">
                                    <asp:LinkButton ID="btn_add" runat="server" CssClass="btn btn-primary" Width="100px" OnClick="btn_add_Click">Add</asp:LinkButton>

                                    <asp:LinkButton ID="btn_reset" runat="server" CssClass="btn btn-danger" Width="100px" OnClick="btn_reset_Click" CausesValidation="false">Cancel</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>

    <asp:ObjectDataSource ID="ODSEvents" runat="server" DataObjectTypeName="PianoPlus_Data.Entities.Events" DeleteMethod="Delete_Event" OldValuesParameterFormatString="original_{0}" SelectMethod="AllEvent_list" TypeName="PianoPlus_System.BLL.EventController">
        <SelectParameters>
            <asp:SessionParameter Name="instructorId" SessionField="InstructorID" Type="Int32" />
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

