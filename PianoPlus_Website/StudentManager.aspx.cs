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

public partial class StudentManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            StudentGridView.DataBind();
        }
    }
    protected void btn_select_Click(object sender, EventArgs e)
    {
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int studentID = Convert.ToInt32(StudentGridView.DataKeys[rowIndex].Values[0]);

        StudentController studentController = new StudentController();
        Student currentStudent = studentController.GetStudentInfoByStudentID(studentID);

        if(currentStudent != null)
        {
            StudentProfile.Visible = true;
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

    protected void btn_update_Click(object sender, EventArgs e)
    {
        Student currentStudent = null;

        string email = txt_email.Text;
        string id = txt_studentID.Text;

        if(string.IsNullOrEmpty(id))
        {
            MessageUserControl.ShowInfo("Please select a student before click Update Button");
        }
        else
        {
            StudentController studentController = new StudentController();

            MessageUserControl.TryRun(() =>
            {

                currentStudent = new Student();
                currentStudent.StudentID = int.Parse(txt_studentID.Text);
                currentStudent.FirstName = txt_firstName.Text;
                currentStudent.LastName = txt_lastName.Text;
                currentStudent.Phone = txt_phone.Text;
                currentStudent.Email = email;
                currentStudent.Address = txt_address.Text;
                currentStudent.Province = ddl_province.SelectedValue;
                currentStudent.City = txt_city.Text;
                currentStudent.PostalCode = txt_postalCode.Text;
                currentStudent.Active = ddl_active.SelectedValue;


                studentController.UpdateStudent(currentStudent);

            }, "Success", "Student Updated");

            StudentGridView.DataBind();
        }

        

    }
}