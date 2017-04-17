<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="BlogManager.aspx.cs" Inherits="BlogManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Blog</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a><span class="text-navy">All Posts</span></a>
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
                        <h5>Post List</h5>
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
                            <asp:GridView ID="PostGridView" runat="server" CssClass="table table-bordered table-condensed table-responsive" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ODSBlog" DataKeyNames="BlogID">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="BlogID" HeaderText="BlogID" SortExpression="BlogID" Visible="false" />
                                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" SortExpression="InstructorID" Visible="false" />
                                    <asp:BoundField DataField="PostDate" HeaderText="PostDate" SortExpression="PostDate"  />
                                    <asp:BoundField DataField="Content" HeaderText="Content" SortExpression="Content" Visible="false" />
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                </Columns>
                                <EmptyDataTemplate>
                                    No post found
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:ObjectDataSource ID="ODSBlog" runat="server" DataObjectTypeName="PianoPlus_Data.Entities.Blog" DeleteMethod="Delete_Post" OldValuesParameterFormatString="original_{0}" SelectMethod="GetPostsByInstructorID" TypeName="PianoPlus_System.BLL.BlogController">
        <SelectParameters>
            <asp:SessionParameter Name="instructorID" SessionField="InstructorID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <script src="Scripts/jquery-2.1.1.js"></script>
</asp:Content>

