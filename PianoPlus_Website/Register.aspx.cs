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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string email = txt_email.Text;
        Student newStudent = null;
        StudentController userController = new StudentController();
        InstructorController instructorController = new InstructorController();

        bool StudentExists = userController.CheckIfEmailIsAvailable(email);
        bool InstructorExists = instructorController.CheckIfEmailIsAvailable(email);

        if(StudentExists == true && InstructorExists == true)
        {
            newStudent = new Student();
            newStudent.FirstName = txt_firstName.Text;
            newStudent.LastName = txt_lastName.Text;
            newStudent.Email = txt_email.Text;
            newStudent.Address = txt_address.Text;
            newStudent.Province = ddl_province.SelectedValue;
            newStudent.City = txt_city.Text;
            newStudent.PostalCode = txt_postalCode.Text;
            newStudent.Phone = txt_phone.Text;

            var salt = Crypto.GenerateSalt();

            var hashed = Crypto.Hash(txt_password.Text + salt, "MD5");

            newStudent.PassSalt = salt;
            newStudent.PassHash = hashed;

            if(userController.AddNewStudent(newStudent) == true)
            {
                txt_address.Text = "";
                txt_city.Text = "";
                txt_email.Text = "";
                txt_firstName.Text = "";
                txt_lastName.Text = "";
                txt_password.Text = "";
                txt_phone.Text = "";
                txt_postalCode.Text = "";
                ddl_province.SelectedValue = "0";


            }
            else
            {
                MessageUserControl.ShowInfo("Cannot add new student, please try again.");
            }

        }
        else
        {
            MessageUserControl.ShowInfo("This email is already exists, please try different email address.");
        }
    }
}