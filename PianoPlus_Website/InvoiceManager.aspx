<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="InvoiceManager.aspx.cs" Inherits="InvoiceManager" %>

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
                            <asp:GridView ID="StudentGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" DataKeyNames="AccountID,StudentID" AutoGenerateColumns="False" DataSourceID="ODSStudent" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_view" runat="server" CssClass="btn btn-primary" OnClick="btn_view_Click">View</asp:LinkButton>
                                            <asp:LinkButton ID="btn_select" runat="server" CssClass="btn btn-default" OnClick="btn_select_Click">PDF</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="AccountID" HeaderText="AccountID" SortExpression="AccountID" Visible="false"/>
                                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                                    <asp:BoundField DataField="StudentFullName" HeaderText="Student Name" SortExpression="StudentFullName" />
                                    <asp:BoundField DataField="AccountTotal" HeaderText="Account Total" SortExpression="AccountTotal" />
                             
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
                <div class="ibox float-e-margins" visible="false" id="transactions" runat="server">
                    <div class="ibox-title">
                        <h5>Transactions</h5>
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
                        <div class="form-horizontal" runat="server" visible="false">
                            <div class="col-lg-12">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="Student ID" CssClass="col-lg-2 control-label "></asp:Label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="txt_studentId" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Student Name" CssClass="col-lg-2 control-label"></asp:Label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="txt_name" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <asp:GridView ID="TransactionGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" DataKeyNames="TransactionID" AllowPaging="True" AutoGenerateColumns="False">
                                <Columns>
                                    <%--<asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_pdf" runat="server" CssClass="btn btn-default" OnClick="btn_pdf_Click">PDF</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" SortExpression="TransactionID" />
                                    <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" Visible="false" />
                                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" SortExpression="InstructorID" Visible="false"/>
                                    <asp:BoundField DataField="InstructFullName" HeaderText="Instructor" SortExpression="InstructFullName" />
                                    <asp:BoundField DataField="CourseDescription" HeaderText="Course" SortExpression="CourseDescription" />
                                    <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                                    <asp:BoundField DataField="LessonTotal" HeaderText="Lesson Total" SortExpression="LessonTotal" />
                                    <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" />                                   
                                </Columns>
                                <EmptyDataTemplate>
                                    No transaction found
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <asp:ObjectDataSource ID="ODSStudent" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Account_List" TypeName="PianoPlus_System.BLL.InvoiceController">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_studentName" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>
    <script src="Scripts/jquery-2.1.1.js"></script>
</asp:Content>

