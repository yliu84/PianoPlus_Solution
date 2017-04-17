using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChatRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            txtNickName.Text = Session["Name"].ToString();
            if (Session["InstructorID"] != null)
                txtNickName.Text += " (Instructor)";
            if (Session["StudentID"] != null)
                txtNickName.Text = Session["Name"].ToString();

            a_email.InnerText = Session["email"].ToString();
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void btn_logout_Click(object sender, EventArgs e)
    {

    }
}