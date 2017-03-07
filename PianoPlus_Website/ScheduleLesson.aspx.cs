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
    //protected void calender_SelectDate_SelectionChanged(object sender, EventArgs e)
    //{
    //    txt_CalenderDate.Text = calender_SelectDate.SelectedDate.ToLongDateString();
    //    PopulateDaySchedule(calender_SelectDate.SelectedDate);
    //}
    //private void PopulateDaySchedule(DateTime selectedDate)
    //{
    //    CalenderController instructorController = new CalenderController();
    //    ScheduleGridView.DataSource = instructorController.GetInstructorScheduleForDay(2000, selectedDate);
    //    ScheduleGridView.DataBind();        
    //}
    //protected void btn_EnrollLesson_Click(object sender, EventArgs e)
    //{
    //    string room = txt_Room.Text;
    //    string startTime = txt_StartTime.Text;
    //    string endTime = txt_EndTime.Text;
    //    string date = txt_CalenderDate.Text;
    //    DateTime startDateTime = Convert.ToDateTime(date + " " + startTime);
    //    DateTime endDateTime = Convert.ToDateTime(date + " " + endTime);
    //    CalenderController calenderController = new CalenderController();

    //    //PUT IN THE GODDAM CHECK HERE
    //}

    protected void btn_select_Click(object sender, EventArgs e)
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
}