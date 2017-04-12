using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data;
using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null && Session["InstructorID"] != null)
        {
            lbl_name.Text = Session["Name"].ToString();

            Instructor instructor = new Instructor();
            InstructorController instructorController = new InstructorController();
            int instructorId = int.Parse(Session["InstructorID"].ToString());
            instructor = instructorController.GetInstructorInfoByID(instructorId);

            if (instructor.ProfileImage != null)
            {
                img_profile.ImageUrl = "~/DisplayImage.aspx?instructorId=" + Session["InstructorID"].ToString();
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
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
