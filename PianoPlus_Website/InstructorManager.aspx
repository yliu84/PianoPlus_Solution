<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="InstructorManager.aspx.cs" Inherits="InstructorManager" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="Content/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Instructor</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="InstructorManager.aspx"><span class="text-navy">All Instructors</span></a>
                </li>
                <li>
                    <a href="AddInstructor.aspx">Add Instructor</a>
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
                        <h5>Search instructor and check instructor details</h5>
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
                            <asp:GridView ID="InstructorGridView" runat="server" AllowPaging="True" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataSourceID="ODSInstructor" DataKeyNames="InstructorID">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Text="Select" ID="btn_select" runat="server" CssClass="btn btn-sm btn-info" OnClick="btn_select_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" SortExpression="InstructorID" Visible="false" />
                                    <asp:BoundField DataField="RoleID" HeaderText="RoleID" SortExpression="RoleID" />
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="false" />
                                    <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" Visible="false"/>
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="false"/>
                                    <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" Visible="false"/>
                                    <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" />
                                    <asp:BoundField DataField="PassHash" HeaderText="PassHash" SortExpression="PassHash" Visible="false"/>
                                    <asp:BoundField DataField="PassSalt" HeaderText="PassSalt" SortExpression="PassSalt" Visible="false"/>
                                    <asp:BoundField DataField="CreateDate" HeaderText="Created Date" SortExpression="CreateDate" DataFormatString="{0:d}" />
                                </Columns>
                                <EmptyDataTemplate>
                                    No data found
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="ibox float-e-margins" runat="server" id="InstructorProfile" visible="false">
                    <div class="ibox-title">
                        <h5>Instructor Profile</h5>
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
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Instructor ID" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_instructorID" runat="server" CssClass="form-control" placeholder="Instructor ID" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="First Name" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_firstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldFName"
                                            runat="server"
                                            ErrorMessage="First name is Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ValidationGroup="instructor"
                                            ControlToValidate="txt_firstName"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="First Name length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_firstName"
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ValidationGroup="instructor"
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
                                            ValidationGroup="instructor"
                                            ForeColor="Red"
                                            ControlToValidate="txt_lastName"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Last Name length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_lastName"
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ForeColor="Red"
                                            ValidationGroup="instructor"
                                            Display="Dynamic" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label11" runat="server" Text="Role" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList ID="ddl_role" runat="server" CssClass="form-control" Height="34px" DataSourceID="ODSRole" DataTextField="Description" DataValueField="RoleID"></asp:DropDownList>
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
                                            ValidationGroup="instructor"
                                            ControlToValidate="txt_email"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Invalid Email Format. Email must have between 5-50 lowercase characters!"
                                            ControlToValidate="txt_email"
                                            ValidationExpression="^(?!.{51})([a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)$"
                                            ForeColor="Red"
                                            ValidationGroup="instructor"
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
                                            ValidationGroup="instructor"
                                            ControlToValidate="txt_phone"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Invalid Phone Number!"
                                            ControlToValidate="txt_phone"
                                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
                                            ForeColor="Red"
                                            ValidationGroup="instructor"
                                            Display="Dynamic" />
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
                                            ValidationGroup="instructor"
                                            ControlToValidate="txt_address"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Province" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList ID="ddl_province" runat="server" Height="34px" CssClass="form-control" ForeColor="GrayText">
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
                                            ValidationGroup="instructor"
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
                                            ValidationGroup="instructor"
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
                                            ValidationGroup="instructor"
                                            ForeColor="Red"
                                            ControlToValidate="txt_postalCode"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexPostal" 
                                            runat="server" 
                                            ValidationExpression="^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$" 
                                            ControlToValidate="txt_postalCode" 
                                            ErrorMessage="Postal code was not in the correct format. eg T2X 1V4 or T2X1V4" 
                                            ValidationGroup="instructor"
                                            Display="Dynamic"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label12" runat="server" Text="Birth Day" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <div class="input-group date" data-autoclose="true">
                                            <asp:TextBox ID="txt_birth" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                            <div class="input-group-addon">
                                                <span class="fa fa-clock-o"></span>
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                runat="server"
                                                ErrorMessage="Birth day is Required"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="instructor"
                                                ControlToValidate="txt_birth"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label10" runat="server" Text="Active" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList ID="ddl_active" runat="server" Height="30px" CssClass="form-control">
                                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                                            <asp:ListItem Value="N">No</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="form-group pull-right">
                                    <asp:LinkButton ID="btn_update" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_update_Click" ValidationGroup="instructor">Update</asp:LinkButton>
                                    <asp:LinkButton ID="btn_cancel" runat="server" CssClass="btn btn-default btn-warning" Width="100px" CausesValidation="false">Cancel</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:ObjectDataSource ID="ODSInstructor" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Instuctor_List" TypeName="PianoPlus_System.BLL.InstructorController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ODSRole" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Role_List" TypeName="PianoPlus_System.BLL.InstructorController"></asp:ObjectDataSource>
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

