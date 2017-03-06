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

    }
    protected void calender_SelectDate_SelectionChanged(object sender, EventArgs e)
    {
        txt_CalenderDate.Text = calender_SelectDate.SelectedDate.ToLongDateString();
        PopulateDaySchedule(calender_SelectDate.SelectedDate);
    }
    private void PopulateDaySchedule(DateTime selectedDate)
    {
        InstructorController instructorController = new InstructorController();
        ScheduleGridView.DataSource = instructorController.GetInstructorScheduleForDay(2000, selectedDate);
        ScheduleGridView.DataBind();        
    }
    protected void btn_EnrollLesson_Click(object sender, EventArgs e)
    {
        string room = txt_Room.Text;
        string startTime = txt_StartTime.Text;
        string endTime = txt_EndTime.Text;
        string date = txt_CalenderDate.Text;
        int studentID = Convert.ToInt32(txt_StudentID.Text);
        int instructorID = 2000;
        string courseCode= txt_CourseCode.Text;
        DateTime startDateTime = Convert.ToDateTime(date + " " + startTime);
        DateTime endDateTime = Convert.ToDateTime(date + " " + endTime);
        CalenderController calenderController = new CalenderController();

        StudentClass lesson = new StudentClass();


        StudentController studentController = new StudentController();
        lesson.Student = studentController.GetStudentInfoByStudentID(studentID);
        lesson.StudentID = studentID;

        InstructorController instructorController = new InstructorController();
        lesson.Instructor = instructorController.GetInstructorInfoByID(instructorID);
        lesson.InstructorID = instructorID;

        lesson.Room = room;
        lesson.StartTime = startDateTime;
        lesson.EndTime = endDateTime;

        CourseController courseController = new CourseController();
        lesson.Course = courseController.GetCourseInfoByCourseCode(courseCode);
        lesson.CourseCode = courseCode;

        lesson.DayOfWeek = startDateTime.DayOfWeek.ToString();
        lesson.Hours = endDateTime.Hour - startDateTime.Hour;

        if (instructorController.AddStudentClass(lesson))
        {
            MessageUserControl.ShowInfo("Lesson added");
        }
        else
        {
            MessageUserControl.ShowInfo("Lesson added failed");
        }

        //if (calenderController.IsConflictingTime(startDateTime, endDateTime))
        //    MessageUserControl.ShowInfo("Timeslot conflicts with another appointment");
        //else
        //{
        //    string studentID = txt_CalenderDate=
        //}

        //PUT IN THE GODDAM CHECK HERE
    }
}