using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ScheduleLesson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void calender_SelectDate_SelectionChanged(object sender, EventArgs e)
    {
        txt_CalenderDate.Text = calender_SelectDate.SelectedDate.ToLongDateString();
    }
}