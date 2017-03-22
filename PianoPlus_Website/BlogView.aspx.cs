using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus_Data.POCOS;

public partial class BlogView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BlogController controller = new BlogController();
        List<BlogInfo> blogInfo = null;

        if(controller.Post_List().Count() != 0)
        {
            blogInfo = new List<BlogInfo>();
            blogInfo = controller.Post_List();
            rpt_posts.DataSource = blogInfo;

            rpt_posts.DataBind();
        }
        
    }

    protected void rpt_posts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = int.Parse(e.CommandArgument.ToString());
        string link = "~/Article.aspx" + "?pos=" + id;
        Response.Redirect(link);
    }
}