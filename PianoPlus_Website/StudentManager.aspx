<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="StudentManager.aspx.cs" Inherits="StudentManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Student</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a>All Students</a>
                </li>
                <li>
                    <a href="#">Add Student</a>
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
                            <asp:GridView ID="StudentGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataSourceID="ODSStudent">
                                <Columns>
                                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" Visible="False" />
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" />
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                                    <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" />
                                    <asp:BoundField DataField="PassHash" HeaderText="PassHash" SortExpression="PassHash" Visible="False" />
                                    <asp:BoundField DataField="PassSalt" HeaderText="PassSalt" SortExpression="PassSalt" Visible="False" />
                                    <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:ObjectDataSource ID="ODSStudent" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Student_List" TypeName="PianoPlus_System.BLL.StudentController"></asp:ObjectDataSource>
    </div>

    
</asp:Content>

