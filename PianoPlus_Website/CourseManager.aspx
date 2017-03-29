<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="CourseManager.aspx.cs" Inherits="CourseManager" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Course</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a><span class="text-navy">All Courses</span></a>
                </li>
                <li>
                    <a href="AddCourse.aspx">Add Course</a>
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
                        <h5>Search Courses and view Details</h5>
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
                            <asp:GridView ID="CourseGridView" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="False" DataKeyNames="CourseCode" DataSourceID="ODSCourses">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton Text="Select" ID="btn_select" runat="server" CssClass="btn btn-sm btn-info" OnClick="btn_select_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" Visible="False" />
                                    <asp:BoundField DataField="CourseType" HeaderText="Course Type" SortExpression="CourseType" />
                                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName" />
                                    <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" Visible="False" />
                                    <asp:BoundField DataField="TotalSeats" HeaderText="Total Seats" SortExpression="TotalSeats" />
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
                <div class="ibox float-e-margins" runat="server" visible="false" id="CourseInformation">
                    <div class="ibox-title">
                        <h5>Course Information</h5>
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
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Course Code" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_courseCode" runat="server" CssClass="form-control" placeholder="Course Code" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Course Type" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_courseType" runat="server" CssClass="form-control" placeholder="Course Type"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldCourseType"
                                            runat="server"
                                            ErrorMessage="Course type is required"
                                            Display="Dynamic"
                                            ValidationGroup="course"
                                            ForeColor="Red"
                                            ControlToValidate="txt_courseType"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Course Name" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_courseName" runat="server" CssClass="form-control" placeholder="Course Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldCourseName"
                                            runat="server"
                                            ErrorMessage="Course name is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ValidationGroup="course"
                                            ControlToValidate="txt_courseName"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label1y" runat="server" Text="Active" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList ID="ddl_active" runat="server" Height="30px" CssClass="form-control">
                                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                                            <asp:ListItem Value="N">No</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Total Seats" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_totalSeats" runat="server" CssClass="form-control" placeholder="Total Seats"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldSeats"
                                            runat="server"
                                            ErrorMessage="Total Seats Required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ValidationGroup="course"
                                            ControlToValidate="txt_totalSeats"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-12">
                                <div class="form-group pull-right">
                                    <asp:LinkButton ID="btn_update" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_update_Click" ValidationGroup="course">Update</asp:LinkButton>
                                    <asp:LinkButton ID="btn_cancel" runat="server" CssClass="btn btn-default btn-warning" Width="100px" CausesValidation="false">Cancel</asp:LinkButton>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div />
        <asp:ObjectDataSource ID="ODSCourses" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Course_List" TypeName="PianoPlus_System.BLL.CourseController"></asp:ObjectDataSource>
    </div>
    <script src="Scripts/jquery-2.1.1.js"></script>
</asp:Content>

