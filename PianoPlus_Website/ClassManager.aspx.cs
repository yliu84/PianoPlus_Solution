using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus_Data.POCOS;
using System.Net;
using System.Web.Helpers;
public partial class ClassManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RebindClasses();
        }

    }

    private void RebindClasses()
    {
        CourseController controller = new CourseController();

        ddl_course.DataSource = controller.Course_List();
        ddl_course.DataTextField = "CourseName";
        ddl_course.DataValueField = "CourseCode";
        ddl_course.DataBind();
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
        GridViewRow gridRow = ClassGridView.Rows[rowIndex];

        //Get keys
        DateTime startDate = (DateTime)ClassGridView.DataKeys[rowIndex].Values[0];
        string courseCode = ClassGridView.DataKeys[rowIndex].Values[1].ToString();
        int instructorID = Convert.ToInt32(ClassGridView.DataKeys[rowIndex].Values[2]);
        
        ClassController classController = new ClassController();

        //Get Classes
        List<StudentClass> currentClasses = classController.GetClassesInfoByStartEndDateAndInstructorID(startDate, courseCode, instructorID);

        txt_date.Text = currentClasses[0].StartTime.Date.ToString("d");
        txt_startTime.Text = currentClasses[0].StartTime.TimeOfDay.ToString();
        txt_endTime.Text = currentClasses[0].EndTime.TimeOfDay.ToString();

        txt_Room.Text = currentClasses[0].Room;
        ddl_course.SelectedValue = currentClasses[0].CourseCode; 
        //txt_studentName.Text = currentClass.Student.FirstName + " " + currentClass.Student.LastName;

        label_oldStartTime.Text = startDate.ToString();
        label_oldCourseCode.Text = currentClasses[0].CourseCode;

        //Fill Students Grid
        List<StudentInf> studentList = new List<StudentInf>();
        StudentController studentController = new StudentController();
        foreach (StudentClass clas in currentClasses)
        {
            StudentInf enrolledStudent = studentController.GetStudentInfoByStudentID(clas.StudentID);
            studentList.Add(enrolledStudent);
        }
        StudentGridView.DataSource = studentList;
        StudentGridView.DataBind();

        btn_cancel.Enabled = true;
        btn_cancel.Visible = true;

        if (classController.IsHistorical(currentClasses[0]))
        {
            txt_date.Enabled = false;
            txt_startTime.Enabled = false;
            txt_endTime.Enabled = false;

            txt_Room.Enabled = false;
            ddl_course.Enabled = false;

            label_oldStartTime.Enabled = false;
            label_oldCourseCode.Enabled = false;

            btn_submit.Enabled = false;
            btn_submit.Visible = false;

            lbl_ClassInfo.Text = "Class Info (Historical, cannot update values.)";
            StudentGridView.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in StudentGridView.Rows)
            {

                row.Cells[0].Visible = false;
            }

        }
        else
        {
            btn_submit.Enabled = true;
            btn_submit.Visible = true;
            txt_date.Enabled = true;
            txt_startTime.Enabled = true;
            txt_endTime.Enabled = true;

            txt_Room.Enabled = true;
            ddl_course.Enabled = true;

            label_oldStartTime.Enabled = true;
            label_oldCourseCode.Enabled = true;
            lbl_ClassInfo.Text = "Class Info";
            StudentGridView.HeaderRow.Cells[0].Visible = true;
            foreach (GridViewRow row in StudentGridView.Rows)
            {

                row.Cells[0].Visible = true;
            }
        }
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
            int instructorID = 2000;
            string courseCode = ddl_course.SelectedValue;
            DateTime date = DateTime.Parse(txt_date.Text);
            DateTime startTime = DateTime.Parse(txt_date.Text + " " + txt_startTime.Text);
            DateTime endTime = DateTime.Parse(txt_date.Text + " " + txt_endTime.Text);
            string dayOfWeek = (date.DayOfWeek).ToString();
            double hours = endTime.Subtract(startTime).TotalHours;
            string room = txt_Room.Text;
            List<StudentClass> updatedClasses = new List<StudentClass>();

            for (int i = 0; i < StudentGridView.Rows.Count; i++)
            {
                updatedClass = new StudentClass();
                updatedClass.InstructorID = instructorID;
                updatedClass.CourseCode = courseCode;
                updatedClass.StartTime = startTime;
                updatedClass.EndTime = endTime;
                updatedClass.DayOfWeek = dayOfWeek;
                updatedClass.Hours = hours;
                updatedClass.Room = room;
                updatedClasses.Add(updatedClass);
            }

            DateTime oldStartTime = Convert.ToDateTime(label_oldStartTime.Text);
            string oldCourseCode = label_oldCourseCode.Text;

            int result = classController.UpdatedClassStudentCheck(updatedClass);

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
                    classController.UpdateClass(updatedClasses, oldCourseCode, oldStartTime, instructorID);
                    Reset();

                }, "Success", "Class has been updated.");
            }


        }
    }
    protected void btn_deleteStudentClass_Click(object sender, EventArgs e)
    {
        StudentClass currentClass = null;

        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int studentID = Convert.ToInt32(StudentGridView.DataKeys[0].Value);
        int instructorID = 2000;

        DateTime oldStartTime = Convert.ToDateTime(label_oldStartTime.Text);
        string oldCourseCode = label_oldCourseCode.Text;



        ClassController classController = new ClassController();
        currentClass = classController.GetClassByStartDateStudentIDCourseCodeAndInstructorID(oldStartTime, oldCourseCode, studentID, instructorID);

        MessageUserControl.TryRun(() =>
        {
            classController.RemoveStudentClass(currentClass.StartTime, currentClass.InstructorID, currentClass.StudentID, currentClass.CourseCode);
            Reset();
            RebindClasses();

        }, "Success", "Student has been removed from the class.");

    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void Reset()
    {
        ClassMultiView.Visible = false;
        txt_startTime.Text = "";
        txt_endTime.Text = "";
        txt_date.Text = "";
        txt_Room.Text = "";
        ddl_course.SelectedValue = "0";
        btn_cancel.Enabled = false;
        btn_cancel.Visible = false;
        btn_submit.Enabled = false;
        btn_submit.Visible = false;
        label_oldStudentID.Text = "";
        label_oldStartTime.Text = "";
        label_oldCourseCode.Text = "";
        StudentGridView.DataSource = null;
        StudentGridView.DataBind();
    }
}