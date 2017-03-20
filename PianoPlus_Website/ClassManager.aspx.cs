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

    }
}