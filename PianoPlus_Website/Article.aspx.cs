using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
public partial class Article : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    public void Get_Post(int postID)
    {
        BlogController cpntroller = new BlogController();
        Blog newPost = null;

        
    }
}