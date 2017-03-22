<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!--[header-background]-->
    <section id="start">
        <div class="container-fluid post-background">
            <h2 data-sr='wait 0.5s, then enter left and hustle 100px over 2s'>Our concert in Barcelona</h2>
            <p data-sr='wait 0.9s, then bottom left and hustle 100px over 2s'>Barcelona - 22 september 2015</p>
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

                <div runat="server" id="content">

                </div>
            </div>
        </div>
    </div>
    <!--[content-end]-->
</asp:Content>

