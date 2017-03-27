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
        string Email = Request.QueryString["Email"];
        if (!string.IsNullOrEmpty(Email))
        {
            StudentController controller = new StudentController();
            Student student = new Student();
            student = controller.FindProfileImage(Email);
            

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
    }
}