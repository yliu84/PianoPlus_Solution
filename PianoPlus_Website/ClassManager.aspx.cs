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
public partial class ClassManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CourseController controller = new CourseController();

            ddl_course.DataSource = controller.Course_List();
            ddl_course.DataTextField = "CourseName";
            ddl_course.DataValueField = "CourseCode";
            ddl_course.DataBind();
        }

    }
    protected void TabsMenu_MenuItemClick(object sender, MenuEventArgs e)
    {
        if(e.Item.Value == "Students")
        {
            ClassMultiView.SetActiveView(StudentView);
        }

        else if (e.Item.Value == "Time")
        {

            ClassMultiView.SetActiveView(TimeView);
        }

        else if (e.Item.Value == "Course")
        {

            ClassMultiView.SetActiveView(CourseView);
        }
    }
    protected void btn_select_Click(object sender, EventArgs e)
    {

        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;

        DateTime startDate = (DateTime)ClassGridView.DataKeys[rowIndex].Values[0];
        DateTime endDate = (DateTime)ClassGridView.DataKeys[rowIndex].Values[1];
        int instructorID = Convert.ToInt32(ClassGridView.DataKeys[rowIndex].Values[2]);

        GridViewRow selectedRow = ClassGridView.Rows[rowIndex];

        ClassController classController = new ClassController();
        StudentClass currentClass = classController.GetClassInfoByStartEndDateAndInstructorID(startDate, endDate, instructorID);

        txt_studentID.Text = currentClass.StudentID + "";

        txt_date.Text = currentClass.StartTime.Date.ToString();
        txt_startTime.Text = currentClass.StartTime.TimeOfDay.ToString();
        txt_endTime.Text = currentClass.EndTime.TimeOfDay.ToString();

        txt_Room.Text = currentClass.Room;
        ddl_course.SelectedValue = currentClass.CourseCode; 
        txt_studentName.Text = currentClass.Student.FirstName + " " + currentClass.Student.LastName;

        label_oldStudentID.Text = currentClass.StudentID.ToString();
        label_oldStartTime.Text = currentClass.StartTime.ToString();
        label_oldCourseCode.Text = currentClass.CourseCode;

        btn_delete.Enabled = true;
        btn_delete.Visible = true;
        btn_submit.Enabled = true;
        btn_submit.Visible = true;
        ClassMultiView.Visible = true;

    }
    protected void txt_date_TextChanged(object sender, EventArgs e)
    {
        ClassController controller = new ClassController();
        List<StudentClass> classList = null;
        int instructorID = 2000;

        if (!string.IsNullOrEmpty(txt_date.Text))
        {
            DateTime classDay = DateTime.Parse(txt_date.Text);

            classList = new List<StudentClass>();

            classList = controller.DailyClasses_List(classDay, instructorID);

            DailyClassGridView.DataSource = classList;
            DailyClassGridView.DataBind();
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        StudentClass updatedClass = null;
        ClassController classController = new ClassController();

        if (Page.IsValid)
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

            updatedClass = new StudentClass();
            updatedClass.StudentID = studentID;
            updatedClass.InstructorID = instructorID;
            updatedClass.CourseCode = courseCode;
            updatedClass.StartTime = startTime;
            updatedClass.EndTime = endTime;
            updatedClass.DayOfWeek = dayOfWeek;
            updatedClass.Hours = hours;
            updatedClass.Room = room;

            DateTime oldStartTime = Convert.ToDateTime(label_oldStartTime.Text);
            string oldCourseCode = label_oldCourseCode.Text;
            int oldStudentID = Convert.ToInt32(label_oldStudentID.Text);

            int result = classController.ClassStudentCheck(updatedClass);

            if (result == 1)
            {
                MessageUserControl.ShowInfo("The student exist in the class");
            }
            else if (result == 2)
            {
                MessageUserControl.ShowInfo("The class time is conflict with another class, plase select a new time");
            }
            else
            {
                MessageUserControl.TryRun(() =>
                {
                    classController.UpdateClass(updatedClass, oldStudentID, oldCourseCode, oldStartTime);
                    Reset();

                }, "Success", "Class has been updated.");
            }


        }
    }
    protected void btn_delete_Click(object sender, EventArgs e)
    {
        StudentClass currentClass = null;

        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;

        DateTime startDate = (DateTime)ClassGridView.DataKeys[rowIndex].Values[0];
        DateTime endDate = (DateTime)ClassGridView.DataKeys[rowIndex].Values[1];
        int instructorID = Convert.ToInt32(ClassGridView.DataKeys[rowIndex].Values[2]);

        GridViewRow selectedRow = ClassGridView.Rows[rowIndex];

        ClassController classController = new ClassController();
        currentClass = classController.GetClassInfoByStartEndDateAndInstructorID(startDate, endDate, instructorID);

        MessageUserControl.TryRun(() =>
        {
            classController.RemoveClass(currentClass.StartTime, currentClass.InstructorID, currentClass.StudentID, currentClass.CourseCode);
            Reset();

        }, "Success", "Class has been deleted.");
    }
    protected void Reset()
    {
        txt_studentName.Text = "";
        txt_name2.Text = "";
        txt_studentID.Text = "";
        txt_startTime.Text = "";
        txt_endTime.Text = "";
        txt_date.Text = "";
        txt_Room.Text = "";
        ddl_course.SelectedValue = "0";
        txt_studentName.Text = "";
        btn_delete.Enabled = false;
        btn_delete.Visible = false;
        btn_submit.Enabled = false;
        btn_submit.Visible = false;
        label_oldStudentID.Text = "";
        label_oldStartTime.Text = "";
        label_oldCourseCode.Text = "";
    }
}