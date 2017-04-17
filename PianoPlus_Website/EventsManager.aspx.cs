using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data;
using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;

public partial class EventsManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            txt_startTime.Enabled = true;
            txt_endTime.Enabled = true;
        }
    }
    protected void btn_show_Click(object sender, EventArgs e)
    {
        New_Event.Visible = true;
    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        EventController eventController = new EventController();
        Events newEvent = null;

        if(IsValid)
        {
            newEvent = new Events();
            newEvent.Title = txt_title.Text;
            newEvent.StartAt = DateTime.Parse(txt_date.Text + " " + txt_startTime.Text);
            newEvent.EndAt = DateTime.Parse(txt_date.Text + " " + txt_endTime.Text);
            newEvent.Description = txt_description.Text;
            newEvent.InstructorID = int.Parse(Session["InstructorID"].ToString());
            newEvent.IsFullDay = cb_fullDay.Checked;

            MessageUserControl.TryRun(() =>
            {
                eventController.Add_Event(newEvent);
                EventGridView.DataBind();
                btn_reset_Click(sender, e);
            }, "Success", "New event added");
        }
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        New_Event.Visible = false;
        txt_date.Text = "";
        txt_description.Text = "";
        txt_endTime.Text = "";
        txt_startTime.Text = "";
        txt_title.Text = "";
    }
    protected void cb_fullDay_CheckedChanged(object sender, EventArgs e)
    {
        if(cb_fullDay.Checked)
        {
            txt_startTime.Text = "00:00";
            txt_endTime.Text = "23:59";
            txt_startTime.Enabled = false;
            txt_endTime.Enabled = false;
        }
        else
        {
            txt_startTime.Enabled = true;
            txt_endTime.Enabled = true;
            txt_startTime.Text = "";
            txt_endTime.Text = "";
        }
    }
}