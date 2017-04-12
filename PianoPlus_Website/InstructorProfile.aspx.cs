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

public partial class InstructorProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null && Session["InstructorID"] != null)
        {
            if (!IsPostBack)
            {
                RetrieveInstructorProfile();
            }
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
        int id = int.Parse(Session["InstructorID"].ToString());


        InstructorController instructorManager = new InstructorController();

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
                if (instructorManager.UpdateProfileImage(id, bytes) == true)
                {
                    lbl_message.Text = "Image upload successfully.";
                    lbl_message.ForeColor = System.Drawing.Color.Green;
                    img_instructor.DataBind();
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
    protected void btn_update_Click(object sender, EventArgs e)
    {
        
        Instructor currentInstructor = null;
        if(Page.IsValid)
        {
            InstructorController instructorController = new InstructorController();

            MessageUserControl.TryRun(() =>
            {

                currentInstructor = new Instructor();
                currentInstructor.InstructorID = int.Parse(txt_instructorID.Text);
                currentInstructor.FirstName = txt_firstName.Text;
                currentInstructor.LastName = txt_lastName.Text;
                currentInstructor.RoleID = lbl_role.Text;
                currentInstructor.Phone = txt_phone.Text;
                currentInstructor.Email = txt_email.Text;
                currentInstructor.Address = txt_address.Text;
                currentInstructor.Province = ddl_province.SelectedValue;
                currentInstructor.City = txt_city.Text;
                currentInstructor.PostalCode = txt_postalCode.Text;
                currentInstructor.Active = lbl_active.Text;
                currentInstructor.BirthDay = DateTime.Parse(txt_birth.Text).Date;

                instructorController.UpdateInstructor(currentInstructor);
                edit_panel.Visible = false;
                display_panel.Visible = true;

            }, "Success", "Instructor Updated");
        }
    }

    public void RetrieveInstructorProfile()
    {
        Instructor instructor = new Instructor();
        InstructorController instructorController = new InstructorController();

        int instructorId = int.Parse(Session["InstructorID"].ToString());

        instructor = instructorController.GetInstructorInfoByID(instructorId);

        txt_instructorID.Text = instructor.InstructorID.ToString();
        txt_firstName.Text = instructor.FirstName;
        txt_lastName.Text = instructor.LastName;
        txt_email.Text = instructor.Email;
        txt_phone.Text = instructor.Phone;
        txt_address.Text = instructor.Address;
        ddl_province.SelectedValue = instructor.Province;
        txt_city.Text = instructor.City;
        txt_postalCode.Text = instructor.PostalCode;
        txt_birth.Text = instructor.BirthDay.ToString("yyyy-MM-dd");

        lbl_id.Text = instructor.InstructorID.ToString();
        lbl_firstName.Text = instructor.FirstName;
        lbl_LastName.Text = instructor.LastName;
        lbl_instructorEmail.Text = instructor.Email;
        lbl_instructorPhone.Text = instructor.Phone;
        lbl_address.Text = instructor.Address;
        lbl_province.Text = instructor.Province;
        lbl_city.Text = instructor.City;
        lbl_postalCode.Text = instructor.PostalCode;
        lbl_birthDay.Text = instructor.BirthDay.ToString("MM/dd/yyyy");
        lbl_role.Text = instructor.RoleID;
        lbl_active.Text = instructor.Active;


        lbl_name.Text = instructor.FirstName + " " + instructor.LastName;
        lbl_Phone.Text = instructor.Phone;
        lbl_Email.Text = instructor.Email;

        if (instructor.ProfileImage != null)
        {
            img_instructor.ImageUrl = "~/DisplayImage.aspx?instructorId=" + Session["InstructorID"].ToString();
        }

    }
    protected void btn_edit_Click(object sender, EventArgs e)
    {
        edit_panel.Visible = true;
        display_panel.Visible = false;
    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        edit_panel.Visible = false;
        display_panel.Visible = true;
    }
}