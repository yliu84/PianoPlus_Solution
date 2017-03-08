using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null && Session["Name"] != null)
        {
            lbl_name.Text = Session["Name"].ToString();
        }
    }
    protected void btn_logOut_Click(object sender, EventArgs e)
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
