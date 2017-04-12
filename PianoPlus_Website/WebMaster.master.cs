using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus_Data.POCOS;

public partial class WebMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            InstructorController instructorController = new InstructorController();
            a_email.InnerText = Session["email"].ToString();
            li_loggedin.Visible = true;
            li_signUp.Visible = false;
            li_signIn.Visible = false;

            if (instructorController.GetInstructorInfo(Session["email"].ToString()) != null)
            {
                li_admin.Visible = true;
                li_account.Visible = false;
            }
            else
            {
                li_admin.Visible = false;
                li_account.Visible = true;
            }

        }
        else
        {
            li_loggedin.Visible = false;
        }

    }

    protected void btn_logout_Click(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            Application.Lock();
            ((List<string>)Application["Users"]).Remove(Session["Email"].ToString());
            Application.UnLock();
            Session["Email"] = null;
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
        
    }
}
