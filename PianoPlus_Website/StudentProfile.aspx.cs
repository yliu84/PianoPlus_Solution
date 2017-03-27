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

public partial class StudentProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StudentController controller = new StudentController();
            Student student = new Student();
            student = controller.GetStudentInfo("test1@gmail.com");
            phoneValue.Text = student.Phone;
            emailValue.Text = student.Email;
            addressValue.Text = student.Address;
            provinceValue.Text = student.Province;
            cityValue.Text = student.City;
            postalCodeValue.Text = student.PostalCode;
        }
        

    }
    protected void btn_saveEdit_Click(object sender, EventArgs e)
    {
        edit.Visible = false;
        Student currentStudent = null;

        currentStudent = new Student();
        currentStudent.StudentID = 2000;
        currentStudent.Phone = phoneValue.Text;
        currentStudent.Email = emailValue.Text;
        currentStudent.Address = addressValue.Text;
        currentStudent.Province = provinceValue.Text;
        currentStudent.City = cityValue.Text;
        currentStudent.PostalCode = postalCodeValue.Text;
        currentStudent.ProfileImage = ProfileUpload.FileBytes;

        StudentController controller = new StudentController();
        MessageUserControl.TryRun(() =>
        {
            controller.UpdateStudentProfile(currentStudent);

        }, "Success", "Student Updated");
    }
    protected void EditBtn_Click(object sender, EventArgs e)
    {

        edit.Visible = true;
    }
}