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

public partial class ScheduleLesson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            CourseController controller = new CourseController();

            ddl_course.DataSource = controller.Course_List();
            ddl_course.DataTextField = "CourseName";
            ddl_course.DataValueField = "CourseCode";
            ddl_course.DataBind();
        }
    }

    protected void btn_search_Click(object sender, EventArgs e)

    {
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int studentID = Convert.ToInt32(StudentGridView.DataKeys[rowIndex].Values[0]);

        StudentController studentController = new StudentController();
        Student currentStudent = studentController.GetStudentInfoByStudentID(studentID);

        if (currentStudent != null)
        {
            txt_studentID.Text = studentID.ToString();
            txt_name2.Text = currentStudent.FirstName + " " + currentStudent.LastName;
        }
    }
    protected void txt_date_TextChanged(object sender, EventArgs e)
    {
        ClassController controller = new ClassController();
        List<StudentClass> classList= null;
        int instructorID = 2000;

        if(!string.IsNullOrEmpty(txt_date.Text))
        {
            DateTime classDay = DateTime.Parse(txt_date.Text);

            classList = new List<StudentClass>();

            classList = controller.DailyClasses_List(classDay,instructorID);

            DailyClassGridView.DataSource = classList;
            DailyClassGridView.DataBind();
        }
    }
    protected void btn_select_Click(object sender, EventArgs e)
    {

    }
}