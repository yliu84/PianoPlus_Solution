<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="EditPost.aspx.cs" ValidateRequest="false" Inherits="EditPost" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/summernote/summernote.css" rel="stylesheet" />
    <link href="Content/summernote/summernote-bs3.css" rel="stylesheet" />
    <style type="text/css">
        p{
            color:black;
        }

        ul{
            padding-left:25px;
            color:black;
        }
    </style>
    <!--[header-background]-->
    <section id="start">
        <div class="container-fluid post-background">
            <h2 data-sr='wait 0.5s, then enter left and hustle 100px over 2s'>Music we love</h2>
            <p style="font-size:36px" data-sr='wait 0.9s, then bottom left and hustle 100px over 2s'>We play every day</p>
        </div>
    </section>
    <!--[header-background-end]-->
    
    <div class="container" style="margin-top:20px">
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
        <div class="row">
            <div class="col-lg-12">
                <asp:TextBox ID="text_id" runat="server" Visible="false"></asp:TextBox>
                <div class="form-group">

                    <h4>Title:</h4>
                    <asp:TextBox ID="txt_title" runat="server" CssClass="form-control"></asp:TextBox>

                </div>

                <h4>Content:</h4>

                <asp:TextBox ID="txt_text" CssClass="summernote" runat="server" TextMode="MultiLine"></asp:TextBox>


                <div class="col-md-12 contact-send contact">
                    <asp:Button ID="btn_update" runat="server" Text="Update" OnClick="btn_update_Click" class="btn send" />
                </div>
            </div>
        </div>
    </div>


    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <%--<script src="Scripts/jquery-migration.js"></script>--%>
<%--    <script src="Scripts/bootstrap.min.js"></script>--%>
    <script src="Scripts/summernote/summernote.min.js"></script>

    <script>
        $(document).ready(function () {

            $(".summernote").summernote(
                {
                    height: 200
                }

                );


        });
    </script>

</asp:Content>

