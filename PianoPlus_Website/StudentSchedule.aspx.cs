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
using PianoPlus_Data.POCOS;
using PianoPlus.UI;

public partial class StudentSchedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null && Session["Name"] != null)
        {
           
            a_email.Visible = true;
            li_rightddl_login.Visible = false;
            li_rightddl_logout.Visible = true;
            a_email.InnerHtml = Session["email"].ToString();
            int id = int.Parse(Session["StudentID"].ToString());
            ClassController classController = new ClassController();
            List<ClassInfo> classes = new List<ClassInfo>();

            lbl_message.Text = "";
            RetrieveStudentProfile();

            if(!this.IsPostBack)
            {
                if (classController.GetClassesByEndTimeAndStudentID(id).Count() > 0)
                {
                    //Attribute to show the Plus Minus Button.
                    ClassSchedule.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

                    //Attribute to hide column in Phone.
                    ClassSchedule.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
                    ClassSchedule.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
                    ClassSchedule.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                    ClassSchedule.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
                    ClassSchedule.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";

                    //Adds THEAD and TBODY to GridView.
                    ClassSchedule.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                if (classController.GetClassHistoryByStudentID(id).Count() > 0)
                {
                    ClassHistory.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

                    //Attribute to hide column in Phone.
                    ClassHistory.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
                    ClassHistory.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
                    ClassHistory.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                    ClassHistory.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
                    ClassHistory.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";

                    //Adds THEAD and TBODY to GridView.
                    ClassHistory.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                
            }
           
            

        }
        else
        {
            // Redirect to the home page if session is empty.
            Response.Redirect("~/Login.aspx");
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

                lbl_name.Text = student.StudentName;
                lbl_studentPhone.Text = student.Phone;
                lbl_studentEmail.Text = student.Email;
                lbl_studentAddress.Text = student.Address;
                lbl_studentCity.Text = student.City;
                lbl_studentProvince.Text = student.Province;

                if (student.ProfileImage != null)
                {
                    img_student.ImageUrl = "~/DisplayImage.aspx?Email=" + Session["Email"].ToString();
                }


            }
        }
    }
}