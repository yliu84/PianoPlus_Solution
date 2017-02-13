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
using System.Web.Script.Serialization;
using System.Web.Helpers;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    [WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public List<Events> GetEvents()
    {
        List<Events> eventList = new List<Events>();

        CalenderController controller = new CalenderController();

        if (controller.GetEvents() != null)
        {
            eventList = controller.GetEvents();
        }

        return eventList;
    }
}