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
            UpdatePanel2.Update();
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

    protected void btn_next_Click(object sender, EventArgs e)
    {
        step1.Attributes["class"] = "disabled";
        step2.Attributes["class"] = "active";
        step3.Attributes["class"] = "disabled";

        tabTwo.Attributes.Add("class", "active");
        tabOne.Visible = false;
        tabTwo.Visible = true;
        tabThree.Visible = false;



    }
    protected void btn_back_Click(object sender, EventArgs e)
    {
        step1.Attributes["class"] = "active";
        step2.Attributes["class"] = "disabled";
        step3.Attributes["class"] = "disabled";

        tabOne.Visible = true;
        tabTwo.Visible = false;
        tabThree.Visible = false;
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            step1.Attributes["class"] = "disabled";
            step2.Attributes["class"] = "disabled";
            step3.Attributes["class"] = "active";

            tabThree.Attributes.Add("class", "active");
            tabOne.Visible = false;
            tabTwo.Visible = false;
            tabThree.Visible = true;

            txt_name.Text = txt_name2.Text;
            txt_selectedDate.Text = txt_date.Text;
            txt_startT.Text = txt_startTime.Text;
            txt_endT.Text = txt_endTime.Text;
        }
        
    }
    protected void btn_back2_Click(object sender, EventArgs e)
    {
        step1.Attributes["class"] = "disabled";
        step2.Attributes["class"] = "active";
        step3.Attributes["class"] = "disabled";

        tabOne.Visible = false;
        tabTwo.Visible = true;
        tabThree.Visible = false;
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        StudentClass newClass = null;
        ClassController classController = new ClassController();

        if(Page.IsValid)
        {
            int studentID = int.Parse(txt_studentID.Text);
            int instructorID = 2000;
            string courseCode = ddl_course.SelectedValue;
            DateTime date = DateTime.Parse(txt_date.Text);
            DateTime startTime = DateTime.Parse(txt_date.Text + " " + txt_startTime.Text);
            DateTime endTime = DateTime.Parse(txt_date.Text + " " + txt_endTime.Text);
            string dayOfWeek = (date.DayOfWeek).ToString();
            double hours = endTime.Subtract(startTime).TotalHours;
            string room = txt_Room.Text;

            newClass = new StudentClass();
            newClass.StudentID = studentID;
            newClass.InstructorID = instructorID;
            newClass.CourseCode = courseCode;
            newClass.StartTime = startTime;
            newClass.EndTime = endTime;
            newClass.DayOfWeek = dayOfWeek;
            newClass.Hours = hours;
            newClass.Room = room;

            MessageUserControl.TryRun(() =>
            {
                classController.AddClass(newClass);

                step1.Attributes["class"] = "active";
                step2.Attributes["class"] = "disabled";
                step3.Attributes["class"] = "disabled";

                tabOne.Visible = true;
                tabTwo.Visible = false;
                tabThree.Visible = false;
                reset();

            }, "Success", "New class added");
        }
    }

    protected void reset()
    {
        txt_name.Text = "";
        txt_name2.Text = "";
        txt_studentID.Text = "";
        txt_startTime.Text = "";
        txt_startT.Text = "";
        txt_endTime.Text = "";
        txt_endT.Text = "";
        txt_date.Text = "";
        txt_selectedDate.Text = "";
        txt_Room.Text = "";
        ddl_course.SelectedValue = "0";
        txt_studentName.Text = "";
    }
}