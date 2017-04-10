using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus_Data.POCOS;
using System.Text.RegularExpressions;
using System.Text;
using System.Xml;

public partial class BlogView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BlogController controller = new BlogController();
        List<BlogInfo> blogInfo = null;
        InstructorController instructorController = new InstructorController();

        if(controller.Post_List().Count() != 0)
        {
            blogInfo = new List<BlogInfo>();
            blogInfo = controller.Post_List();
            rpt_posts.DataSource = blogInfo;

            rpt_posts.DataBind();

            
        }

        if (Session["email"] != null && Session["Name"] != null)
        {
            if (instructorController.GetInstructorInfo(Session["email"].ToString()) != null)
            {
                btn_addNewPost.Visible = true;
            }
            else
            {
                btn_addNewPost.Visible = false;
            }
            
        }
        else
        {
            btn_addNewPost.Visible = false;
        }
        
    }

    protected void rpt_posts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = int.Parse(e.CommandArgument.ToString());
        string link = "~/Article.aspx" + "?pos=" + id;
        Response.Redirect(link);
    }

    protected void rpt_posts_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var cleaned = string.Empty;
        Literal lblStatus = e.Item.FindControl("lbl_content") as Literal;
        string description = lblStatus.Text;

        try
        {
            StringBuilder textOnly = new StringBuilder();
            using (var reader = XmlNodeReader.Create(new System.IO.StringReader("<xml>" + description + "</xml>")))
            {
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Text)
                        textOnly.Append(reader.ReadContentAsString());
                }
            }
            cleaned = textOnly.ToString();
        }
        catch
        {
            //A tag is probably not closed. fallback to regex string clean.
            string textOnly = string.Empty;
            Regex tagRemove = new Regex(@"<[^>]*(>|$)");
            Regex compressSpaces = new Regex(@"[\s\r\n]+");
            textOnly = tagRemove.Replace(description, string.Empty);
            textOnly = compressSpaces.Replace(textOnly, " ");
            cleaned = textOnly;
        }

        lblStatus.Text = cleaned;

    }


    protected void btn_addNewPost_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CreatePost.aspx");
    }
}