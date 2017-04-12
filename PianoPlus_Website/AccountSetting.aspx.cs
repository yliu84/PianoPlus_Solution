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
            int isEdit = int.Parse(hidden_editmode.Value);
            a_email.Visible = true;
            li_rightddl_login.Visible = false;
            li_rightddl_logout.Visible = true;
            a_email.InnerHtml = Session["email"].ToString();

            if(isEdit == 0)
            {
                lbl_message.Text = "";
                RetrieveStudentProfile();
            }
                
        }
        else
        {
            // Redirect to the home page if session is empty.
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btn_saveBasic_Click(object sender, EventArgs e)
    {
        StudentController studentManager = new StudentController();
        int studentId = int.Parse(Session["StudentID"].ToString());
        Student student = null;
        Student find = new Student();
        find = studentManager.GetStudentByStudentID(studentId);
        if(Page.IsValid)
        {
            
            student = new Student();
            student.StudentID = studentId;
            student.FirstName = txt_firstName.Text;
            student.LastName = txt_lastname.Text;
            student.BirthDay = DateTime.Parse(txt_birthDay.Text).Date;
            student.Phone = find.Phone;
            student.Email = find.Email;
            student.Address = find.Address;
            student.Province = find.Province;
            student.City = find.City;
            student.PostalCode = find.PostalCode;
            student.Active = find.Active;


             MessageUserControl.TryRun(() =>
                 {
                     studentManager.UpdateStudent(student);
                     ScriptManager.RegisterStartupScript(this, GetType(), "EndEdit", "EndEdit();", true);
                     
                     
                 },"Success", "Basic information updated");
            

        }
    }
    protected void btn_saveContact_Click(object sender, EventArgs e)
    {
        StudentController studentManager = new StudentController();
        int studentId = int.Parse(Session["StudentID"].ToString());
        Student student = null;
        Student find = new Student();
        find = studentManager.GetStudentByStudentID(studentId);
        if (Page.IsValid)
        {

            student = new Student();
            student.StudentID = studentId;
            student.FirstName = find.FirstName;
            student.LastName = find.LastName;
            student.BirthDay = find.BirthDay;
            student.Phone = txt_phonenumber.Text;
            student.Email = txt_email.Text;
            student.Address = txt_address.Text;
            student.Province = txt_province.Text;
            student.City = txt_city.Text;
            student.PostalCode = txt_postalcode.Text;
            student.Active = find.Active;


            MessageUserControl.TryRun(() =>
            {
                studentManager.UpdateStudent(student);
                ScriptManager.RegisterStartupScript(this, GetType(), "EndEdit", "EndEdit();", true);
            }, "Success", "Contact information updated");


        }
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
                //lbl_name.Text = Session["Name"].ToString();
                lbl_firstname.Text = student.FirstName;
                lbl_lastname.Text = student.LastName;
                lbl_phone.Text = student.Phone;
                lbl_email.Text = student.Email;
                lbl_address.Text = student.Address;
                lbl_city.Text = student.City;
                lbl_province.Text = student.Province;
                lbl_postalcode.Text = student.PostalCode;
                lbl_birthDay.Text = student.BirthDay.ToString("MM/dd/yyyy");

                txt_firstName.Text = student.FirstName;
                txt_lastname.Text = student.LastName;
                txt_phonenumber.Text = student.Phone;
                txt_email.Text = student.Email;
                txt_address.Text = student.Address;
                txt_city.Text = student.City;
                txt_province.Text = student.Province;
                txt_postalcode.Text = student.PostalCode;
                txt_birthDay.Text = student.BirthDay.ToString("yyyy-MM-dd");

                lbl_name.Text = student.StudentName;
                lbl_studentPhone.Text = student.Phone;
                lbl_studentEmail.Text = student.Email;
                lbl_studentAddress.Text = student.Address;
                lbl_studentCity.Text = student.City;
                lbl_studentProvince.Text = student.Province;

                if (student.ProfileImage != null)
                {
                    img_student.ImageUrl = "~/DisplayImage.aspx?studentId=" + Session["StudentID"].ToString(); 
                }
                    
            }
            else
            {
                MessageUserControl.ShowInfo("Can not found student information.");
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
            fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" ||
            fileExtension.ToLower() == ".jpeg")
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
                    img_student.DataBind();
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
    protected void btn_right_logout_Click(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            Application.Lock();
            ((List<string>)Application["Users"]).Remove(Session["Email"].ToString());
            Application.UnLock();
            Session["Email"] = null;
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}