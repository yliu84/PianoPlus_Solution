using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_System.BLL;
using PianoPlus_Data.POCOS;
using System.Web.Script.Serialization;
using System.Web.Helpers;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null && Session["InstructorID"] != null)
        {
            EventController eventController = new EventController();
            InstructorController instructorController = new InstructorController();
            StudentController studentController = new StudentController();
            CourseController courseController = new CourseController();

            List<Events> events = new List<Events>();
            int instructorId = int.Parse(Session["InstructorID"].ToString());

            events = eventController.Event_list(instructorId);

            if (events.Count() != 0)
            {
                EventRepeater.DataSource = events;
                EventRepeater.DataBind();
            }

            lbl_studentCounter.Text = studentController.StudentCounter().ToString();
            lbl_instructorCounter.Text = instructorController.InstructorCounter().ToString();
            lbl_courseCounter.Text = courseController.CourseCounter().ToString();
            lbl_eventCounter.Text = eventController.EventCounter(instructorId).ToString();


        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
       
    }

    [WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetEvents()
    {
        JavaScriptSerializer jss = new JavaScriptSerializer();
        List<CalendarEvents> eventList = new List<CalendarEvents>();

        CalenderController controller = new CalenderController();

        if (controller.GetEvents().Count() != 0)
        {
            eventList = controller.GetEvents();
        }
        string Data = jss.Serialize(eventList);

        return Data;
    }
}