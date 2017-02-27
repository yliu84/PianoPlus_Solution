using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data;
using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus.UI;

public partial class CourseManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CourseGridView.DataBind();
        }
    }

    protected void btn_update_Click(object sender, EventArgs e)
    {
        Course currentCourse = null;

        //string email = txt_email.Text;
        string id = txt_courseCode.Text;

        if (string.IsNullOrEmpty(id))
        {
            MessageUserControl.ShowInfo("Please select a course before clicking the Update Button");
        }
        else
        {
            CourseController courseController = new CourseController();

            MessageUserControl.TryRun(() =>
            {

                currentCourse = new Course();
                currentCourse.CourseCode = txt_courseCode.Text;
                currentCourse.CourseType = txt_courseType.Text;
                currentCourse.CourseName = txt_courseName.Text;
                currentCourse.TotalSeats = int.Parse(txt_totalSeats.Text);
                currentCourse.Active = ddl_active.SelectedValue;


                courseController.UpdateCourse(currentCourse);

            }, "Success", "Course Updated");

            CourseGridView.DataBind();
        }
    }

    protected void btn_select_Click(object sender, EventArgs e)
    {
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        string courseCode = CourseGridView.DataKeys[rowIndex].Values[0].ToString();

        CourseController courseController = new CourseController();
        Course selectedCourse = courseController.GetCourseInfoByCourseCode(courseCode);

        if (selectedCourse != null)
        {
            CourseInformation.Visible = true;
            txt_courseCode.Text = selectedCourse.CourseCode;
            txt_courseName.Text = selectedCourse.CourseName;
            txt_courseType.Text = selectedCourse.CourseType;
            ddl_active.SelectedValue = selectedCourse.Active;
            txt_totalSeats.Text = selectedCourse.TotalSeats.ToString();
        }
    }
}