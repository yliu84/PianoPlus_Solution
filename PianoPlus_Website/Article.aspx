<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!--[header-background]-->
    <section id="start">
        <div class="container-fluid post-background">
            <h2 data-sr='wait 0.5s, then enter left and hustle 100px over 2s'>Music we love</h2>
            <p data-sr='wait 0.9s, then bottom left and hustle 100px over 2s'>We play every day</p>
        </div>
    </section>
    <!--[header-background-end]-->

    <!--[content-]-->
    <div class="container-fluid">
        <div class="col-md-8 col-md-offset-2">
            <div class="row border-blog">
            </div>
            <div class="row content-text">
                <div class="testimonial-border-album"></div>
                <h2 runat="server" id="title"></h2>
                <h5 runat="server" id="author"></h5>

                <div runat="server" style="padding-bottom:30px">
                    <asp:Literal Text="" runat="server" ID="content" />
                </div>
            </div>
        </div>
    </div>
    <!--[content-end]-->

    <script type="text/javascript" src="Scripts/js/jquery-1.11.2.min.js"></script>
</asp:Content>

