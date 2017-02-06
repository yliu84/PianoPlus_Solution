using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data;
using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus.UI;

public partial class InstructorManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            InstructorGridView.DataBind();
        }
    }
    protected void btn_select_Click(object sender, EventArgs e)
    {
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int instructorID = Convert.ToInt32(InstructorGridView.DataKeys[rowIndex].Values[0]);

        InstructorController instructorController = new InstructorController();
        Instructor currentInstructor = instructorController.GetInstructorInfoByID(instructorID);

        if (currentInstructor != null)
        {
            txt_studentID.Text = currentInstructor.InstructorID.ToString();
            txt_firstName.Text = currentInstructor.FirstName;
            txt_lastName.Text = currentInstructor.LastName;
            ddl_role.SelectedValue = currentInstructor.RoleID;
            txt_email.Text = currentInstructor.Email;
            txt_phone.Text = currentInstructor.Phone;
            txt_address.Text = currentInstructor.Address;
            ddl_province.SelectedValue = currentInstructor.Province;
            txt_city.Text = currentInstructor.City;
            txt_postalCode.Text = currentInstructor.PostalCode;
            ddl_active.SelectedValue = currentInstructor.Active;
        }
    }
    protected void btn_update_Click(object sender, EventArgs e)
    {

    }
}