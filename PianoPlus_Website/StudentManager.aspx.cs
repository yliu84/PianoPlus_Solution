using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data;
using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;

public partial class StudentManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_select_Click(object sender, EventArgs e)
    {
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int studentID = Convert.ToInt32(StudentGridView.DataKeys[rowIndex].Values[0]);

        StudentController studentController = new StudentController();
        Student currentStudent = studentController.GetStudentInfoByStudentID(studentID);

        if(currentStudent != null)
        {
            txt_studentID.Text = currentStudent.StudentID.ToString();
            txt_firstName.Text = currentStudent.FirstName;
            txt_lastName.Text = currentStudent.LastName;
            txt_email.Text = currentStudent.Email;
            txt_phone.Text = currentStudent.Phone;
            txt_address.Text = currentStudent.Address;
            ddl_province.SelectedValue = currentStudent.Province;
            txt_city.Text = currentStudent.City;
            txt_postalCode.Text = currentStudent.PostalCode;
            ddl_active.SelectedValue = currentStudent.Active;
        }
    }
}