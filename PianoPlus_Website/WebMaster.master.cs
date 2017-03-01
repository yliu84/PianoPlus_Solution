using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            a_email.InnerText = Session["email"].ToString();
            li_loggedin.Visible = true;
            li_signUp.Visible = false;
            li_signIn.Visible = false;
        }
        else
        {
            li_loggedin.Visible = false;
        }

    }

    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Application.Lock();
        ((List<string>)Application["Users"]).Remove(Session["Email"].ToString());
        Application.UnLock();
        Session["Email"] = null;
        Response.Redirect("~/Default.aspx");
    }
}
