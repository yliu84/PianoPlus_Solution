<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="AddStudent" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="Content/css/bootstrap-datepicker3.min.css" rel="stylesheet" />

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Student</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="StudentManager.aspx">All Students</a>
                </li>
                <li>
                    <a href="AddStudent.aspx"><span class="text-navy">Add Student</span></a>
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
                        <h5>Add New Student</h5>
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
                            <div class="col-lg-6">
                                
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="First Name" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_firstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldFName"
                                            runat="server"
                                            ErrorMessage="First name is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_firstName"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="First Name length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_firstName"
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Last Name" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_lastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldLName"
                                            runat="server"
                                            ErrorMessage="Last name is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_lastName"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Last Name length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_lastName"
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Email" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldEmail"
                                            runat="server"
                                            ErrorMessage="Email is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_email"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Invalid Email Format. Email must have between 5-50 lowercase characters!"
                                            ControlToValidate="txt_email"
                                            ValidationExpression="^(?!.{51})([a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)$"
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Phone" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldPhone"
                                            runat="server"
                                            ErrorMessage="Phone is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_phone"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Invalid Phone Number!"
                                            ControlToValidate="txt_phone"
                                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
                                            ForeColor="Red"
                                            Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Password" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_password" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldPassword"
                                            runat="server"
                                            ErrorMessage="Password is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_password"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label10" runat="server" Text="Confirm Password" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_confirmPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldConfirmPassword"
                                            runat="server"
                                            ErrorMessage="Confirm password is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_confirmPass"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="ComparePassword"
                                            runat="server"
                                            ErrorMessage="The password and confirmation password do not match."
                                            ControlToValidate="txt_confirmPass"
                                            ControlToCompare="txt_password"
                                            Type="String"
                                            Display="Dynamic"
                                            ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Address" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_address" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldAddress"
                                            runat="server"
                                            ErrorMessage="Address is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_address"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Province" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList ID="ddl_province" runat="server" Height="30px" CssClass="form-control" ForeColor="GrayText">
                                            <asp:ListItem Value="0">Choose a Province</asp:ListItem>
                                            <asp:ListItem Value="AB">Alberta</asp:ListItem>
                                            <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                                            <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                                            <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                                            <asp:ListItem Value="NL">Newfoundland and Labrador</asp:ListItem>
                                            <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                                            <asp:ListItem Value="ON">Ontario</asp:ListItem>
                                            <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                                            <asp:ListItem Value="QC">Quebec</asp:ListItem>
                                            <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                                            <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                                            <asp:ListItem Value="NU">Nunavut</asp:ListItem>
                                            <asp:ListItem Value="YT">Yukon</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldProvince"
                                            InitialValue="0"
                                            runat="server"
                                            ErrorMessage="Province is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="ddl_province"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="City" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_city" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldCity"
                                            runat="server"
                                            ErrorMessage="City is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_city"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="Postal Code" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_postalCode" runat="server" CssClass="form-control" placeholder="Postal Code"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldPostalCode"
                                            runat="server"
                                            ErrorMessage="Postal Code is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_postalCode"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexPostal" 
                                            runat="server" 
                                            ValidationExpression="^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$" 
                                            ControlToValidate="txt_postalCode" 
                                            ErrorMessage="Postal code was not in the correct format. eg T2X 1V4 or T2X1V4" 
                                            Display="Dynamic"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label11" runat="server" Text="Birth Day" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <div class="input-group date" data-autoclose="true">
                                            <asp:TextBox ID="txt_birth" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                            <div class="input-group-addon">
                                                <span class="fa fa-clock-o"></span>
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldBirth"
                                                runat="server"
                                                ErrorMessage="Birth day is Required"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ControlToValidate="txt_birth"></asp:RequiredFieldValidator>
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
    <script src="Scripts/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });

        })
    </script>
</asp:Content>

