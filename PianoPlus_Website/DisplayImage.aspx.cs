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
public partial class DisplayImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString["studentId"] != null)
        {
            int studentId = int.Parse(Request.QueryString["studentId"]);
            StudentController controller = new StudentController();
            Student student = new Student();
            student = controller.GetStudentByStudentID(studentId);           

            if (student.ProfileImage != null)
            {
                //byte[] bytes = (byte[])PictureSet.Rows[0]["ProfileImage"];
                Response.Buffer = true;
                //Response.Charset = "";
                //Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //Response.ContentType = PictureSet.Rows[0]["ContentType"].ToString();
                // Response.AddHeader("content-disposition", "attachment;filename=" + PictureSet.Rows[0]["ImageName"].ToString());
                Response.BinaryWrite(student.ProfileImage);
                Response.Flush();
                Response.End();

            }
        }

        if (Request.QueryString["instructorId"] != null)
        {
            int instructorId = int.Parse(Request.QueryString["instructorId"]);
            InstructorController instructorController = new InstructorController();
            Instructor instructor = new Instructor();
            instructor = instructorController.GetInstructorInfoByID(instructorId);

            if(instructor.ProfileImage != null)
            {
                Response.Buffer = true;
                Response.BinaryWrite(instructor.ProfileImage);
                Response.Flush();
                Response.End();
            }
        }
    }
}