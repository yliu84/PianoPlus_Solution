<%@ Page Title="" Language="C#" MasterPageFile="~/WebMaster.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style type="text/css">
        p{
            color:GrayText;
            margin-bottom:5px;
            font-size:16px;
        }

    </style>

    <!--[header-background]-->
    <section id="start">
        <div class="container-fluid post-background">
            <h2 data-sr='wait 0.5s, then enter left and hustle 100px over 2s'>Get In Touch</h2>
        </div>
    </section>
    <!--[header-background-end]-->

    <!--[contact]-->
<div class="container-fluid contact-background">
    <section id="contact">
       
    <div class="row contact">
        
        <div class="col-md-6 col-md-offset-2 contact-header" data-sr='wait 0.2s, then enter left and hustle 50px over 1s'>
            <div class="border-contact"></div>
             <label runat="server" class="alert-info text-center text-info" style="padding:25px" id="DisplayMessage" visible="false"></label>
            <h2>Leave Us a Message</h2>
            <div class="form-group">
                <div class="input-group">
                    <input runat="server" type="text" class="form-control" name="InputName" id="InputName" placeholder="Name" required="required" />
                    <span class="input-group-addon"><i></i></span></div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <input runat="server" type="email" class="form-control" id="InputEmail" name="InputEmail" placeholder="Email" required="required" />
                    <span class="input-group-addon"><i></i></span></div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <textarea runat="server" name="InputMessage" id="InputMessage" class="form-control" rows="10" placeholder="Message" required="required" ></textarea>
                    <span class="input-group-addon"><i></i></span></div>
            </div>
            <div class="form-group">
            </div>
            <div class="col-md-12 contact-send">
                <asp:Button ID="buttonContact" runat="server" Text="Send" class="btn send hvr-shutter-out-vertical-contact-form" OnClick="buttonContact_Click" />
            </div>
        </div>
        <div class="col-md-4 lead" data-sr='wait 0.1s, then enter bottom and hustle 55px over 1.5s'>
            <h2>Contacts</h2>
            <div class="testimonial-border"></div>
            <p>Mobile: (778) 896 - 9098</p>
            <p>Mail: info.hymedu@gmail.com</p>
            <br />
            <h2>WeChat</h2>
            <div class="testimonial-border"></div>
            <img src="Images/wechat.jpg" alt="wechat" width="60%" />

        </div>
        <hr class="featurette-divider hidden-lg" />
    </div>
    </section>
</div>
<!--[contact-end]-->
    <script type="text/javascript" src="Scripts/js/jquery-1.11.2.min.js"></script>
</asp:Content>

