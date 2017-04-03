using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using System.Web.Helpers;


public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Email"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {

        StudentController studentController = new StudentController();
        InstructorController instructorController = new InstructorController();
        string currentEmail = Session["Email"].ToString();

        if (studentController.CheckIfEmailIsAvailable(currentEmail) == false)
        {

        }
        else if (instructorController.CheckIfEmailIsAvailable(currentEmail) == false)
        {

            Instructor currentInstructor = instructorController.GetInstructorInfo(currentEmail);
            string currentPassword = Crypto.Hash((txt_currentPassword.Text + currentInstructor.PassSalt), "MD5");
            if (currentPassword == currentInstructor.PassHash)
            {
                var newPassword = Crypto.Hash((txt_newPassword.Text + currentInstructor.PassSalt), "MD5");
                currentInstructor.PassHash = newPassword;
                instructorController.UpdateInstructor(currentInstructor);
                MessageUserControl.ShowInfo("Password successfully changed.");
            }
            else
            {
                MessageUserControl.ShowInfo("Current password is not correct. Type the correct password, and try again.");
            }

        }
        else
        {
            MessageUserControl.ShowInfo("Unexpected Error.");
        }
    }
}