<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentManager.aspx.cs" Inherits="StudentManager" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Student</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="StudentManager.aspx"><span class="text-navy">All Students</span></a>
                </li>
                <li>
                    <a href="AddStudent.aspx">Add Student</a>
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
                        <h5>Search student and check student details</h5>
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
                        <div class="input-group col-lg-6 float-e-margins">
                            <asp:TextBox ID="txt_studentName" runat="server" CssClass="form-control" placeholder="Search student name"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:LinkButton ID="btn_search" runat="server" CssClass="btn btn-primary">Go!</asp:LinkButton>
                            </span>
                        </div>
                       
                        <div class="table-responsive">
                            <asp:GridView ID="StudentGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="ODSStudent" AllowPaging="True">
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
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="False"/>
                                    <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" Visible="False"/>
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="False"/>
                                    <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" Visible="False"/>
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
            </div>

            <div class="col-lg-12">
                <div class="ibox float-e-margins" runat="server" visible="false" id="StudentProfile">
                    <div class="ibox-title">
                        <h5>Student Profile</h5>
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
                                    <asp:Label ID="Label1" runat="server" Text="Student ID" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_studentID" runat="server" CssClass="form-control" placeholder="Student ID" Enabled="false"></asp:TextBox>
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
                                            ValidationGroup="student"
                                            ControlToValidate="txt_firstName"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="First Name length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_firstName"
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ValidationGroup="student"
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
                                            ValidationGroup="student"
                                            ForeColor="Red"
                                            ControlToValidate="txt_lastName"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Last Name length must be between 1 to 20 characters!"
                                            ControlToValidate="txt_lastName"
                                            ValidationExpression="^[a-zA-Z]{1,20}$"
                                            ForeColor="Red"
                                            ValidationGroup="student"
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
                                            ValidationGroup="student"
                                            ControlToValidate="txt_email"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Invalid Email Format. Email must have between 5-50 lowercase characters!"
                                            ControlToValidate="txt_email"
                                            ValidationExpression="^(?!.{51})([a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)$"
                                            ForeColor="Red"
                                            ValidationGroup="student"
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
                                            ValidationGroup="student"
                                            ControlToValidate="txt_phone"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ErrorMessage="Invalid Phone Number!"
                                            ControlToValidate="txt_phone"
                                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
                                            ForeColor="Red"
                                            ValidationGroup="student"
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
                                            ValidationGroup="student"
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
                                            ValidationGroup="student"
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
                                            ValidationGroup="student"
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
                                            ValidationGroup="student"
                                            ForeColor="Red"
                                            ControlToValidate="txt_postalCode"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexPostal" 
                                            runat="server" 
                                            ValidationExpression="^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$" 
                                            ControlToValidate="txt_postalCode" 
                                            ErrorMessage="Postal code was not in the correct format. eg T2X 1V4 or T2X1V4" 
                                            ValidationGroup="student"
                                            Display="Dynamic"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        
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
                                    <asp:LinkButton ID="btn_update" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_update_Click" ValidationGroup="student">Update</asp:LinkButton>
                                    <asp:LinkButton ID="btn_cancel" runat="server" CssClass="btn btn-default btn-warning" Width="100px" CausesValidation="false">Cancel</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:ObjectDataSource ID="ODSStudent" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Student_List" TypeName="PianoPlus_System.BLL.StudentController">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_studentName" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <script src="Scripts/jquery-2.1.1.js"></script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    {extend: 'copy' },
                    {extend: 'csv' },
                    {extend: 'excel', title: 'ExampleFile'},
                    {extend: 'pdf', title: 'ExampleFile'},

                    {
                        extend: 'print',
                        customize: function (win) {
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                        }
                    }
                ]

            });

        });
    </script>--%>
</asp:Content>

