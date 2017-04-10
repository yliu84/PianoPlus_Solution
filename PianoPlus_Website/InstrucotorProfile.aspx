<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="InstrucotorProfile.aspx.cs" Inherits="InstrucotorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Profile</h2>
            
        </div>

        <div class="col-lg-2"></div>
    </div>

    <div class="wrapperwrapper-content animated fadeInRight">
        <div class="row m-b-lg m-t-lg">
                <div class="col-md-6">

                    <div class="profile-image text-center">
                        <asp:Image CssClass="img-circle circle-border m-b-md" runat="server" ImageUrl="~/Images/profile.png" alt="profile picture" ID="img_instructor" />
                        <button class="pmop-edit" type="button" data-toggle="modal" data-target="#myModal6">
                                <i class="zmdi zmdi-camera"></i><span
                                    class="hidden-xs">Upload Image</span>
                            </button>
                    </div>

                     <div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title">Upload Profile Picture</h4>
                                 
                                </div>
                                <div class="modal-body">
                                    
                                        <div class="row">
                                        <div class="col-md-12">                                          
                                            <img src="Images/profile.png" id="img_preview" runat="server" class="col-md-12" />
                                        </div>

                                        <div class="col-md-12" style="padding-top:10px;padding-bottom:10px">

                                            <div class="btn-group">
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </div>
                                            <asp:Label ID="lbl_message" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-white btn-sm" data-dismiss="modal">Close</button>
                                    <asp:LinkButton CssClass="btn btn-primary btn-sm" runat="server" ID="btn_savePhoto" OnClick="btn_savePhoto_Click" Text="Save changes" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="profile-info">
                        <div class="">
                            <div>
                                <h2 class="no-margins">
                                    
                                    <asp:Label ID="lbl_name" runat="server" Text="Alex Smith"></asp:Label>
                                </h2>
                                <h4>Instructor</h4>
                                <small>
                                    There are many variations of passages of Lorem Ipsum available, but the majority
                                    have suffered alteration in some form Ipsum available.
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    
    <script src="Scripts/jquery.min.js"></script>
    <script type="text/javascript">

        $("#FileUpload1").change(function () {

            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;

            if (regex.test($(this).val().toLowerCase())) {

                if (typeof (FileReader) != "undefined") {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#img_preview").attr("src", e.target.result);
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                } else {
                    alert("This browser does not support FileReader.");
                }

            } else {
                alert("Please upload a valid image file.");
            }
        })
    </script>
</asp:Content>

