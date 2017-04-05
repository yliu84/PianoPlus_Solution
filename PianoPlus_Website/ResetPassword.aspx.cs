using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_Data.POCOS;
using PianoPlus_System.BLL;
using System.Net;
using System.Web.Helpers;


public partial class ResetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string tokenID = Request.QueryString["tokenID"];
        if (tokenID != null)
        {
            PasswordResetController passResetController = new PasswordResetController();
            if (!passResetController.IsTokenValid(tokenID))
            {
                lbl_heading.Text = "This token is invalid. Click on home to go to homepage.";
                btn_submit.Enabled = false;

                txt_confirmPassword.Enabled = false;

                txt_newPassword.Enabled = false;

            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            PasswordResetController passwordResetController = new PasswordResetController();
            string tokenID = Request.QueryString["tokenID"];
            string newPassword = txt_newPassword.Text;
            passwordResetController.UseToken(tokenID, newPassword);

            MessageUserControl.ShowInfo("Password has successfully been change log in from homepage.");
        }
        
    }
    protected void btn_toHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}