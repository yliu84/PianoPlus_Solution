<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentManager.aspx.cs" Inherits="StudentManager" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Student</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a><span class="text-navy">All Students</span></a>
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
                        <h5>Seach student and check student details</h5>
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
                            <asp:GridView ID="StudentGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="ODSStudent">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Text="Select" ID="btn_select" runat="server" CssClass="btn btn-sm btn-info" OnClick="btn_select_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" Visible="False" />
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="False"/>
                                    <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" Visible="False"/>
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="False"/>
                                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" Visible="False"/>
                                    <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" />
                                    <asp:BoundField DataField="PassHash" HeaderText="PassHash" SortExpression="PassHash" Visible="False" />
                                    <asp:BoundField DataField="PassSalt" HeaderText="PassSalt" SortExpression="PassSalt" Visible="False" />
                                    <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" DataFormatString="{0:d}" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="ibox float-e-margins">
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
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Last Name" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_lastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Email" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Phone" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Address" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_address" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
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
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="City" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_city" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="Postal Code" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_postalCode" runat="server" CssClass="form-control" placeholder="Postal Code"></asp:TextBox>
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
                                    <asp:LinkButton ID="btn_update" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_update_Click">Update</asp:LinkButton>
                                    <asp:LinkButton ID="btn_cancel" runat="server" CssClass="btn btn-default btn-warning" Width="100px">Cancel</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:ObjectDataSource ID="ODSStudent" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Student_List" TypeName="PianoPlus_System.BLL.StudentController"></asp:ObjectDataSource>
    </div>
    
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

