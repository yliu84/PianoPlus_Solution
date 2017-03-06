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
        CalenderController instructorController = new CalenderController();
        ScheduleGridView.DataSource = instructorController.GetInstructorScheduleForDay(2000, selectedDate);
        ScheduleGridView.DataBind();        
    }
    protected void btn_EnrollLesson_Click(object sender, EventArgs e)
    {
        string room = txt_Room.Text;
        string startTime = txt_StartTime.Text;
        string endTime = txt_EndTime.Text;
        string date = txt_CalenderDate.Text;
        DateTime startDateTime = Convert.ToDateTime(date + " " + startTime);
        DateTime endDateTime = Convert.ToDateTime(date + " " + endTime);
        CalenderController calenderController = new CalenderController();

        //PUT IN THE GODDAM CHECK HERE
    }
}