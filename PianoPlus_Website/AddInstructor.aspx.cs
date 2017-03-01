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

public partial class AddInstructor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        string email = txt_email.Text;
        Instructor newInstructor = null;
        StudentController studentController = new StudentController();
        InstructorController instructorController = new InstructorController();

        bool StudentExists = studentController.CheckIfEmailIsAvailable(email);
        bool InstructorExists = instructorController.CheckIfEmailIsAvailable(email);

        if (StudentExists == true && InstructorExists == true)
        {
            newInstructor = new Instructor();
            newInstructor.FirstName = txt_firstName.Text;
            newInstructor.RoleID = "Adm";
            newInstructor.LastName = txt_lastName.Text;
            newInstructor.Email = txt_email.Text;
            newInstructor.Address = txt_address.Text;
            newInstructor.Province = ddl_province.SelectedValue;
            newInstructor.City = txt_city.Text;
            newInstructor.PostalCode = txt_postalCode.Text;
            newInstructor.Phone = txt_phone.Text;
            newInstructor.Active = 'Y'.ToString();
            newInstructor.CreateDate = DateTime.Today;

            var salt = Crypto.GenerateSalt();

            var hashed = Crypto.Hash(txt_password.Text + salt, "MD5");

            newInstructor.PassSalt = salt;
            newInstructor.PassHash = hashed;

            if (instructorController.AddNewInstructor(newInstructor) == true)
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
                MessageUserControl.ShowInfo("New Instructor added successful, please log in.");

            }
            else
            {
                MessageUserControl.ShowInfo("Cannot add new instructor, please try again.");
            }

        }
        else
        {
            MessageUserControl.ShowInfo("This email is already exists, please try different email address.");
        }
    }
}