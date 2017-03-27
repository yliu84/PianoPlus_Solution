using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;

public partial class CreatePost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            if (Session["email"] != null && Session["RoleID"].ToString().Equals("Adm"))
            {

                string title = txt_title.Text;
                string postText = txt_text.Text;
                string instructorID = Session["InstructorID"].ToString();
                BlogController controller = new BlogController();



                MessageUserControl.TryRun(() =>
            {
                Blog newPost = new Blog();

                newPost.Title = title;
                newPost.InstructorID = int.Parse(instructorID);
                newPost.Content = postText;
                newPost.PostDate = DateTime.Now;

                controller.AddPost(newPost);
            }, "Success", "New bolg post added.");


            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }

        }
    }
}