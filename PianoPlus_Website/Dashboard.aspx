<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div ng-app="myApp" ng-controller="myNgController" runat="server">

        <%--<script type="text/ng-template" id="modalContent.html">
        <div class="modal-header">
            <h3 class="modal-title">Events</h3>
        </div>
        <div class="modal-body">
            <div class="error">{{Message}}</div>
            <div class="form-group">
                <label>Event Title : </label>
                <input type="text" ng-model="NewEvent.Title" autofocus class="form-control" />
            </div>
            <div class="form-group">
                <label>Description : </label>
                <input type="text" ng-model="NewEvent.Description" class="form-control" />
            </div>
            <div class="form-group">
                <label>Time Slot : </label>
                <span>{{NewEvent.StartAt}} - {{NewEvent.EndAt}}</span>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" type="button" ng-click="ok()">Save</button> 
            <button class="btn btn-danger" type="button" ng-show="NewEvent.EventID > 0" ng-click="delete()">Delete</button> 
            <button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button> 

        </div>
        </script>--%>

        <div class="wrapper wrapper-content">
           <%-- <div class="row animated fadeInDown">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Events Calendar</h5>
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
                            <div id="calendar" runat="server" ui-calendar="uiConfig.calendar" ng-model="eventSources" calendar="myCalendar"></div>
                        </div>
                    </div>
                </div>
            </div>--%>

            <div class="row">
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right">Total</span>
                            <h5>Students</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <asp:Label ID="lbl_studentCounter" runat="server" Text="0"></asp:Label>
                            </h1>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right">Total</span>
                            <h5>Instructors</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <asp:Label ID="lbl_instructorCounter" runat="server" Text="0"></asp:Label>
                            </h1>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right">Total</span>
                            <h5>Courses</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <asp:Label ID="lbl_courseCounter" runat="server" Text="0"></asp:Label>
                            </h1>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right">Total</span>
                            <h5>Events</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">
                                <asp:Label ID="lbl_eventCounter" runat="server" Text="0"></asp:Label>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row animated fadeInRight">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Events TimeLine</h5>
                        </div>
                        <div class="ibox-content" id="ibox-content">

                            <div id="vertical-timeline" class="vertical-container dark-timeline center-orientation">
                                <asp:Repeater ID="EventRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="vertical-timeline-block">
                                            <div class="vertical-timeline-icon navy-bg">
                                                <i class="fa fa-file-text"></i>
                                            </div>

                                            <div class="vertical-timeline-content">
                                                <h2><%# Eval("Title") %></h2>
                                                <p>
                                                    <%# Eval("Description") %>
                                                </p>
                                                <span class="vertical-date"><%# Eval("StartAt", "{0:MM/dd/yyyy}") %>
                                            <br />
                                                    <small><%# Eval("StartAt", "{0:hh:mm tt}") %> - <%# Eval("EndAt", "{0:hh:mm tt}") %></small>
                                                </span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%-- CSS --%>
    <link href="Content/fullcalendar.css" rel="stylesheet" />

<%-- JS --%>
    
    <script src="Scripts/jquery-2.1.1.js"></script>
    <script src="Scripts/Calendar/moment.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.0/angular.js"></script>
    <script src="Scripts/Calendar/calendar.js"></script>
    <script src="Scripts/Calendar/fullcalendar.js"></script>
    <script src="Scripts/Calendar/gcal.js"></script>

    <script src="Scripts/Calendar/MyApp.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/1.3.2/ui-bootstrap-tpls.min.js"></script>

    <style>
        .error {
            color: red;
        }
    </style>
</asp:Content>

