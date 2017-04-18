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

public partial class InvoiceManager : System.Web.UI.Page
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
        Student currentStudent = studentController.GetStudentByStudentID(studentID);

        if (currentStudent != null)
        {
            HttpCookie studIDCookie = new HttpCookie("studID");
            studIDCookie.Value = currentStudent.StudentID.ToString();
            Response.Cookies.Add(studIDCookie);
            Response.Write("<script>window.open('Invoice.aspx')</script>");
        }
    }

    //protected void btn_update_Click(object sender, EventArgs e)
    //{
    //    Student currentStudent = null;

    //    string email = txt_email.Text;
    //    string id = txt_studentID.Text;

    //    if(string.IsNullOrEmpty(id))
    //    {
    //        MessageUserControl.ShowInfo("Please select a student before click Update Button");
    //    }
    //    else
    //    {
    //        StudentController studentController = new StudentController();

    //        MessageUserControl.TryRun(() =>
    //        {

    //            currentStudent = new Student();
    //            currentStudent.StudentID = int.Parse(txt_studentID.Text);
    //            currentStudent.FirstName = txt_firstName.Text;
    //            currentStudent.LastName = txt_lastName.Text;
    //            currentStudent.Phone = txt_phone.Text;
    //            currentStudent.Email = email;
    //            currentStudent.Address = txt_address.Text;
    //            currentStudent.Province = ddl_province.SelectedValue;
    //            currentStudent.City = txt_city.Text;
    //            currentStudent.PostalCode = txt_postalCode.Text;
    //            currentStudent.Active = ddl_active.SelectedValue;
    //            currentStudent.BirthDay = DateTime.Parse(txt_birth.Text);
    //            studentController.UpdateStudent(currentStudent);

    //        }, "Success", "Student Updated");

    //        StudentGridView.DataBind();
    //    }

        

    //}

}