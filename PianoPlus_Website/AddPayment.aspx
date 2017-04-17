<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddPayment.aspx.cs" Inherits="AddPayment" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
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
                                
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Course Code" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_CourseCode" runat="server" CssClass="form-control" placeholder="Course Code"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldCode"
                                            runat="server"
                                            ErrorMessage="Course Code is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_CourseCode"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Course Code length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_CourseCode"
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Phone" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
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
                                    <asp:Label ID="Label1" runat="server" Text="Password" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_Fee" runat="server" CssClass="form-control" placeholder="Lesson Fee"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldFee"
                                            runat="server"
                                            ErrorMessage="Lesson Fee is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_Fee"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                 <div class="panel-body">
                                                <h2>Select a date</h2>

                                                
                                                    <div class="form-group" id="date1">
                                                        <asp:Label CssClass="col-md-4 control-label" Text="Pick a Date" runat="server" />
                                                        <div class="input-group date">
                                                            <asp:TextBox ID="txt_date" runat="server" CssClass="form-control" AutoPostBack="true"></asp:TextBox>
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
                                                            <asp:TextBox ID="txt_PaidTime" runat="server" CssClass="form-control"></asp:TextBox>
                                                            <div class="input-group-addon">
                                                                <span class="fa fa-clock-o"></span>
                                                            </div>
                                                                                                              
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldPaidTime"
                                                                runat="server"
                                                                ErrorMessage="Start time is required"
                                                                ValidationGroup ="time"
                                                                Display="Dynamic"
                                                                ForeColor="Red"
                                                                ControlToValidate="txt_PaidTime"></asp:RequiredFieldValidator> 
                                                    </div>
                                                    
                                     </div>
                                            
                            </div>

                            

                            <div class="col-lg-12">
                                <div class="form-group pull-right">
                                    <asp:LinkButton ID="btn_add" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_add_Click">Add</asp:LinkButton>
                                    <asp:LinkButton ID="btn_cancel" runat="server" CssClass="btn btn-default btn-warning" Width="100px" CausesValidation="false">Cancel</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/jquery-2.1.1.js"></script>
</asp:Content>

