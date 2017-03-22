<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="BlogView.aspx.cs" Inherits="BlogView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .post-subtitle p{
            color:black;
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
            <div class="row border-blog"></div>
            <div class="blog-main">

                <asp:Repeater ID="rpt_posts" runat="server" OnItemCommand="rpt_posts_ItemCommand">
                    <ItemTemplate>
                        <div class="post-preview">
                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("BlogID") %>' ID="btn_post" >
                                <h2 class="post-title"><%# Eval("Title") %></h2>
                                <%--<asp:label ID="lbl_content" runat ="server" Text='<%# Eval("Content").ToString().Length>=100 ? Eval("Content").ToString().Substring(0,100)+"..." :Eval("Content")%>' ></asp:label>--%>
                                <h4 class="post-subtitle"><%# Eval("Content").ToString().Length>=200 ? Eval("Content").ToString().Substring(0,200)+"..." :Eval("Content")%></h4>
                            </asp:LinkButton>
                            <p class="post-meta">Posted by <%# Eval("InstructorName") %> on <%# Eval("PostDate") %></p>
                        </div>
                        <hr>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
    <script type="text/javascript" src="Scripts/js/jquery-1.11.2.min.js"></script>
</asp:Content>

