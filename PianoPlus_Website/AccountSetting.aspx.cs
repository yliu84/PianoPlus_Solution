using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data;
using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus.UI;

public partial class AccountSetting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null && Session["Name"] != null)
        {
            
            if(!IsPostBack)
            {
                lbl_message.Text = "";

                RetrieveStudentProfile();
            }

        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btn_saveBasic_Click(object sender, EventArgs e)
    {

    }
    protected void btn_saveContact_Click(object sender, EventArgs e)
    {

    }

    public void RetrieveStudentProfile()
    {
        StudentController studentManager = new StudentController();
        Student student = new Student();
        if (Session["StudentID"] != null)
        {
            string email = Session["email"].ToString();
            student = studentManager.GetStudentInfo(email);
            if (student != null)
            {
                lbl_name.Text = Session["Name"].ToString();
                lbl_firstname.Text = student.FirstName;
                lbl_lastname.Text = student.LastName;
                lbl_phone.Text = student.Phone;
                lbl_email.Text = student.Email;
                lbl_address.Text = student.Address;
                lbl_city.Text = student.City;
                lbl_province.Text = student.Province;
                lbl_postalcode.Text = student.PostalCode;

                txt_firstName.Text = student.FirstName;
                txt_lastname.Text = student.LastName;
                txt_phonenumber.Text = student.Phone;
                txt_email.Text = student.Email;
                txt_address.Text = student.Address;
                txt_city.Text = student.City;
                txt_province.Text = student.Province;
                txt_postalcode.Text = student.PostalCode;

                lbl_studentPhone.Text = student.Phone;
                lbl_studentEmail.Text = student.Email;
                lbl_studentAddress.Text = student.Address;
                lbl_studentCity.Text = student.City;
                lbl_studentProvince.Text = student.Province;
            }
        }
        
        


    }

    protected void btn_savePhoto_Click(object sender, EventArgs e)
    {
        HttpPostedFile postedFile = FileUpload1.PostedFile;
        string fileName = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(fileName);
        int fileSize = postedFile.ContentLength;
        int id = int.Parse(Session["StudentID"].ToString());


        StudentController studentManager = new StudentController();

        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" ||
            fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            lbl_message.Visible = true;

            if (bytes != null)
            {
                if (studentManager.UpdateProfileImage(id, bytes) == true)
                {
                    lbl_message.Text = "Image upload successfully.";
                    lbl_message.ForeColor = System.Drawing.Color.Green;
                }
            }
            else
            {
                lbl_message.Text = "Please select a image before click upload button";
                lbl_message.ForeColor = System.Drawing.Color.Red;
            }

        }
        else
        {
            lbl_message.Visible = true;
            lbl_message.Text = "Only images (.jpg, .png, .gif, and .bmp) can be uploaded";
            lbl_message.ForeColor = System.Drawing.Color.Red;

        }

        

        


    }
}