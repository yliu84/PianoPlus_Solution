using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus_Data.POCOS;
public partial class Article : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var postid = Request.QueryString["pos"];

        BlogController controller = new BlogController();
        BlogInfo post = null;

        if(postid != null)
        {
            int value = 0;

            if (int.TryParse(postid, out value))
            {
                post = new BlogInfo();
                post = controller.Get_PostInfo(value);

                title.InnerText = post.Title;
                author.InnerText = post.InstructorName;
                content.Text = post.Content;
            }
            
        }

    }

 
}