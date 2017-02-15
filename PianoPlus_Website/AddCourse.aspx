<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="AddCourse" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Course</h2>
            <ol class="breadcrumb">
                <li class="active">
                    <a href="#">All Courses</a>
                </li>
                <li>
                    <a href="#"><span class="text-navy">Add Course</span></a>
                </li>
            </ol>
        </div>
        <div class="col-lg-2"></div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Add New Course</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="i-box-content">
                        <div class="form-horizontal">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <asp:Label ID="CourseCodeLabel" runat="server" Text="Course Code" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_courseCode" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldCourseCode"
                                            runat="server"
                                            ErrorMessage="Course code is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_courseCode"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group">

                                    <asp:Label ID="CourseTypeLabel" runat="server" Text="Course Type" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:DropDownList ID="ddl_courseType" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select a Type</asp:ListItem>
                                            <asp:ListItem Value="Individual">Individual</asp:ListItem>
                                            <asp:ListItem Value="Group">Group</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldCourseType"
                                            InitialValue ="0"
                                            runat="server"
                                            ErrorMessage="Course type is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="ddl_courseType"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <asp:Label ID="CourseNameLabel" runat="server" Text="Course Name" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_courseName" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldCourseName"
                                            runat="server"
                                            ErrorMessage="Course name is required"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ControlToValidate="txt_courseName"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Seatslabel" runat="server" Text="Total seats" CssClass="col-lg-3 control-label"></asp:Label>
                                    <div class="col-lg-9">
                                        <asp:TextBox ID="txt_totalSeats" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="TotalSeatsLabel"
                                            runat="server"
                                            ErrorMessage="Total seats is required"
                                            ForeColor="Red"
                                            ControlToValidate="txt_totalSeats"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="form-group pull-right">
                                        <asp:LinkButton ID="btn_add" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_add_Click">Add</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

