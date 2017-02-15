using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using System.Net;
using System.Web.Helpers;

public partial class AddCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        Course newCourse = null;
        CourseController courseController = new CourseController();
        newCourse = new Course();
        newCourse.CourseCode = txt_courseCode.Text;
        newCourse.CourseType = ddl_courseType.SelectedValue;
        newCourse.CourseName = txt_courseName.Text;
        newCourse.Active = "Y";
        newCourse.TotalSeats = int.Parse(txt_totalSeats.Text);
        if (courseController.AddNewCourse(newCourse) == true)
        {
            MessageUserControl.ShowInfo("Course added successfully!");
        }
        else
        {
            MessageUserControl.ShowInfo("Cannot add new course, please try again!");
        }
    }
}