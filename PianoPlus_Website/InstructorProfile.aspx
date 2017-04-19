<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="InstructorProfile.aspx.cs" Inherits="InstructorProfile" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   <link href="Content/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
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
  
                        <asp:Image CssClass="img-circle circle-border" runat="server" ImageUrl="~/Images/profile.png" alt="profile picture" ID="img_instructor" />

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
                                <ul class="unstyled">
                                    <li><i class="fa fa-phone"></i>
                                        <asp:Label ID="lbl_Phone" runat="server" Text="Label"></asp:Label></li>
                                    <li><i class="fa fa-envelope"></i>
                                        <asp:Label ID="lbl_Email" runat="server" Text="Label"></asp:Label></li>                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="ibox">
                    <div class="ibox-content">
                        <asp:UpdatePanel runat="server" ID="up_profile" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
                                <asp:Panel runat="server" ID="display_panel">
                                <div class="form-horizontal">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label10" runat="server" Text="Instructor ID" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_id" runat="server" CssClass="col-lg-9"></asp:Label>

                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label11" runat="server" Text="First Name" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_firstName" runat="server" CssClass="col-lg-9"></asp:Label>


                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label13" runat="server" Text="Last Name" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_LastName" runat="server" CssClass="col-lg-9"></asp:Label>

                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label14" runat="server" Text="Email" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_instructorEmail" runat="server" class="col-lg-9"></asp:Label>

                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label16" runat="server" Text="Phone" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_instructorPhone" runat="server" class="col-lg-9"></asp:Label>

                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label15" runat="server" Text="Role" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_role" runat="server" class="col-lg-9"></asp:Label>

                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label18" runat="server" Text="Address" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_address" runat="server" class="col-lg-9"></asp:Label>

                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label19" runat="server" Text="Province" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_province" runat="server" class="col-lg-9"></asp:Label>

                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label20" runat="server" Text="City" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_city" runat="server" class="col-lg-9"></asp:Label>

                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label21" runat="server" Text="Postal Code" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_postalCode" runat="server" class="col-lg-9"></asp:Label>


                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label22" runat="server" Text="Birth Day" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_birthDay" runat="server" class="col-lg-9"></asp:Label>

                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label17" runat="server" Text="Active (Y/N)" CssClass="col-lg-3"></asp:Label>

                                            <asp:Label ID="lbl_active" runat="server" class="col-lg-9"></asp:Label>

                                        </div>

                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group pull-right m-b-lg">
                                            <asp:LinkButton ID="btn_edit" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_edit_Click" CausesValidation="false">Edit</asp:LinkButton>

                                        </div>
                                    </div>
                                </div>
                                </asp:Panel>

                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:Panel runat="server" DefaultButton="btn_update" ID="edit_panel" Visible="false">
                                    <div class="form-horizontal">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Instructor ID" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txt_instructorID" runat="server" CssClass="form-control" placeholder="Instructor ID" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="First Name" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txt_firstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldFName"
                                                    runat="server"
                                                    ErrorMessage="First name is Required"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    ControlToValidate="txt_firstName"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server"
                                                    ErrorMessage="First Name length must be between 1 to 20 characters!"
                                                    ControlToValidate="txt_firstName"
                                                    ValidationExpression="^[a-zA-Z]{1,20}$"
                                                    ValidationGroup="instructor"
                                                    ForeColor="Red"
                                                    Display="Dynamic" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" Text="Last Name" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txt_lastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldLName"
                                                    runat="server"
                                                    ErrorMessage="Last name is Required"
                                                    Display="Dynamic"
                                                    ValidationGroup="instructor"
                                                    ForeColor="Red"
                                                    ControlToValidate="txt_lastName"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server"
                                                    ErrorMessage="Last Name length must be between 1 to 20 characters!"
                                                    ControlToValidate="txt_lastName"
                                                    ValidationExpression="^[a-zA-Z]{1,20}$"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    Display="Dynamic" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label4" runat="server" Text="Email" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="Email" Enabled="false"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldEmail"
                                                    runat="server"
                                                    ErrorMessage="Email is Required"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    ControlToValidate="txt_email"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server"
                                                    ErrorMessage="Invalid Email Format. Email must have between 5-50 lowercase characters!"
                                                    ControlToValidate="txt_email"
                                                    ValidationExpression="^(?!.{51})([a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)$"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    Display="Dynamic" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label5" runat="server" Text="Phone" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldPhone"
                                                    runat="server"
                                                    ErrorMessage="Phone is Required"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    ControlToValidate="txt_phone"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server"
                                                    ErrorMessage="Invalid Phone Number!"
                                                    ControlToValidate="txt_phone"
                                                    ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    Display="Dynamic" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label6" runat="server" Text="Address" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txt_address" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldAddress"
                                                    runat="server"
                                                    ErrorMessage="Address is Required"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    ControlToValidate="txt_address"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label7" runat="server" Text="Province" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:DropDownList ID="ddl_province" runat="server" Height="34px" CssClass="form-control" ForeColor="GrayText">
                                                    <asp:ListItem Value="0">Choose a Province</asp:ListItem>
                                                    <asp:ListItem Value="AB">Alberta</asp:ListItem>
                                                    <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                                                    <asp:ListItem Value="MB">Manitoba</asp:ListItem>
                                                    <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                                                    <asp:ListItem Value="NL">Newfoundland and Labrador</asp:ListItem>
                                                    <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                                                    <asp:ListItem Value="ON">Ontario</asp:ListItem>
                                                    <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                                                    <asp:ListItem Value="QC">Quebec</asp:ListItem>
                                                    <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                                                    <asp:ListItem Value="NT">Northwest Territories</asp:ListItem>
                                                    <asp:ListItem Value="NU">Nunavut</asp:ListItem>
                                                    <asp:ListItem Value="YT">Yukon</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldProvince"
                                                    InitialValue="0"
                                                    runat="server"
                                                    ErrorMessage="Province is Required"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    ControlToValidate="ddl_province"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label8" runat="server" Text="City" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txt_city" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldCity"
                                                    runat="server"
                                                    ErrorMessage="City is Required"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    ControlToValidate="txt_city"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label9" runat="server" Text="Postal Code" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txt_postalCode" runat="server" CssClass="form-control" placeholder="Postal Code"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldPostalCode"
                                                    runat="server"
                                                    ErrorMessage="Postal Code is Required"
                                                    Display="Dynamic"
                                                    ValidationGroup="instructor"
                                                    ForeColor="Red"
                                                    ControlToValidate="txt_postalCode"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regexPostal"
                                                    runat="server"
                                                    ValidationExpression="^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$"
                                                    ControlToValidate="txt_postalCode"
                                                    ErrorMessage="Postal code was not in the correct format. eg T2X 1V4 or T2X1V4"
                                                    ValidationGroup="instructor"
                                                    Display="Dynamic"
                                                    ForeColor="Red"></asp:RegularExpressionValidator>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Label ID="Label12" runat="server" Text="Birth Day" CssClass="col-lg-3 control-label"></asp:Label>
                                            <div class="col-lg-9">
                                                <div class="input-group" data-autoclose="true">
                                                    <asp:TextBox ID="txt_birth" runat="server" TextMode="Date" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                                    <div class="input-group-addon">
                                                        <span class="fa fa-clock-o"></span>
                                                    </div>
                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                    runat="server"
                                                    ErrorMessage="Birth day is Required"
                                                    Display="Dynamic"
                                                    ForeColor="Red"
                                                    ValidationGroup="instructor"
                                                    ControlToValidate="txt_birth"></asp:RequiredFieldValidator>
                                            </div>
                                         
                                        </div>

                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group pull-right m-b-lg">
                                            <asp:LinkButton ID="btn_update" runat="server" CssClass="btn btn-success" Width="100px" OnClick="btn_update_Click" ValidationGroup="instructor">Update</asp:LinkButton>
                                            <asp:LinkButton ID="btn_cancel" runat="server" CssClass="btn btn-default btn-warning" Width="100px" CausesValidation="false" OnClick="btn_cancel_Click">Cancel</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>

                                    
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_update" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="Scripts/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
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

        })
    </script>
</asp:Content>

