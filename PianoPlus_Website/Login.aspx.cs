﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using System.Web.Helpers;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        StudentController studentController = new StudentController();
        InstructorController instructorController = new InstructorController();

        string email = txt_email.Text;

        if (studentController.CheckIfEmailIsAvailable(email) == false) 
        {
            Student currentStudent = studentController.GetStudentInfo(email);
            var password = Crypto.Hash((txt_password.Text + currentStudent.PassSalt), "MD5");
            if (password == currentStudent.PassHash && currentStudent.Active == 'Y'.ToString())
            {
                Session["Email"] = currentStudent.Email;
                Session["StudentID"] = currentStudent.StudentID;
                Session["Name"] = currentStudent.FirstName + " " + currentStudent.LastName;

                Application.Lock();
                ((List<string>)Application["Users"]).Add(Session["Email"].ToString());
                Application.UnLock();

                Response.Redirect("~/Default.aspx");
            }
            else
            {
                MessageUserControl.ShowInfo("Incorrect user ID or password. Type the correct user ID and password, and try again.");
            }
        }
        else if(instructorController.CheckIfEmailIsAvailable(email) == false)
        {
            Instructor currentInstuctor = instructorController.GetInstructorInfo(email);
            var password = Crypto.Hash((txt_password.Text + currentInstuctor.PassSalt), "MD5");
            if(password == currentInstuctor.PassHash && currentInstuctor.Active == 'Y'.ToString())
            {
                Session["Email"] = currentInstuctor.Email;
                Session["InstructorID"] = currentInstuctor.InstructorID;
                Session["RoleID"] = currentInstuctor.RoleID;
                Session["Name"] = currentInstuctor.FirstName + " " + currentInstuctor.LastName;

                Application.Lock();
                ((List<string>)Application["Users"]).Add(Session["Email"].ToString());
                Application.UnLock();

                Response.Redirect("~/Default.aspx");
            }
            else
            {
                MessageUserControl.ShowInfo("Incorrect user ID or password. Type the correct user ID and password, and try again.");
            }

        }
        else
        {
            MessageUserControl.ShowInfo("Incorrect user ID or password. Type the correct user ID and password, and try again.");
        }
    }
}