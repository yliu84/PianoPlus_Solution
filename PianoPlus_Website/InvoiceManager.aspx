<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="InvoiceManager.aspx.cs" Inherits="StudentManager" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Invoice</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="InvoiceManager.aspx"><span class="text-navy">All Invoices</span></a>
                </li>
                <li>
                    <a href="AddPayment.aspx">Add Payment</a>
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
                        <h5>Search and Download Invoices</h5>
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
                                    <asp:ButtonField runat="server" ID="PopupButton" OnClientClick="window.open('Invoice.aspx')" Text="Printable Form" />
                                </Columns>
                                <EmptyDataTemplate>
                                    No data found
                                </EmptyDataTemplate>
                            </asp:GridView>
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

