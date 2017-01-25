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

        bool exists = userController.CheckIfEmailIsAvailable(email);

        if(exists == true)
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

        }
    }
}