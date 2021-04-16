using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_Data.POCOS;
using PianoPlus_System.BLL;

public partial class EditPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var postid = Request.QueryString["pos"];

        BlogController controller = new BlogController();
        BlogInfo post = null;

        if (postid != null && !IsPostBack)
        {
            int value = 0;

            if (int.TryParse(postid, out value))
            {
                post = new BlogInfo();
                post = controller.Get_PostInfo(value);

                txt_title.Text = post.Title;
                txt_text.Text = post.Content;
                text_id.Text = post.BlogID.ToString();
            }

        }
    }
    protected void btn_update_Click(object sender, EventArgs e)
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
                Blog post = new Blog();
                post.BlogID = int.Parse(text_id.Text);
                post.Title = title;
                post.InstructorID = int.Parse(instructorID);
                post.Content = postText;
                post.PostDate = DateTime.Now;

                controller.UpdatePost(post);
            }, "Success", "Blog post updated.");


            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }

        }
    }
}