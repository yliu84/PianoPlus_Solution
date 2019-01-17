<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="BlogView.aspx.cs" Inherits="BlogView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <style type="text/css">
        .post-preview p{
            color:GrayText;
            margin-bottom:5px;
        }
    </style>
    <!--[header-background]-->
    <section id="start">
        <div class="container-fluid blog">
            <h2 data-sr='wait 0.5s, then enter left and hustle 100px over 2s'>Piano Plus Blog</h2>
            <p data-sr='wait 0.9s, then enter bottom and hustle 100px over 2s'>Music is our life</p>
        </div>
    </section>
    <!--[header-background-end]-->

    <!--[content-]-->
    <div class="container-fluid">
        <div class="col-md-8 col-md-offset-2">
            <div class="row border-blog">
                <asp:LinkButton ID="btn_addNewPost" runat="server" CssClass="btn btn-success pull-right" Visible="false" OnClick="btn_addNewPost_Click">Add a New Post</asp:LinkButton>
            </div>
            <div class="blog-main">

                <asp:Repeater ID="rpt_posts" runat="server" OnItemCommand="rpt_posts_ItemCommand" OnItemDataBound="rpt_posts_ItemDataBound">
                    <ItemTemplate>
                        <div class="post-preview">
                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("BlogID") %>' ID="btn_post" >
                                <h2 class="post-title"><%# Eval("Title") %></h2>
                                <asp:Literal ID="lbl_content" runat ="server" Text='<%# Eval("Content").ToString().Length>=200 ? Eval("Content").ToString().Substring(0,200)+"..." :Eval("Content")%>' ></asp:Literal>
                                <%--<div class="post-subtitle" runat="server" id="summary"><%# Eval("Content").ToString().Length>=200 ? Eval("Content").ToString().Substring(0,200)+"..." :Eval("Content").ToString()%></div>--%>
                            </asp:LinkButton>
                            <p class="post-meta">Posted by <%# Eval("InstructorName") %> on <%# Eval("PostDate") %></p>
                        </div>
                        <hr>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
        <div class="col-md-2 right-column" data-sr='wait 0.2s, then enter left and hustle 50px over 1s'>
            <h3>Years</h3>
            <ul>
                <li class="cat"><a href="#">2019</a></li>

            </ul>
        </div>
    </div>
    <%--<script src="Scripts/jquery-2.1.1.js"></script>--%>
    <script type="text/javascript" src="Scripts/js/jquery-1.11.2.min.js"></script>
    <script>
        $(document).ready(function () {

            $('#summary').toString().replace(/(<([^>]+)>)/g, "");
            //$('.post-subtitle').text();

        });
    </script>
</asp:Content>

