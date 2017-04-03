using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AccountSetting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_saveBasic_Click(object sender, EventArgs e)
    {

    }
    protected void btn_saveContact_Click(object sender, EventArgs e)
    {

    }
    protected void btn_browse_Click(object sender, EventArgs e)
    {
        HttpPostedFile postedFile = FileUpload1.PostedFile;
        string fileName = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(fileName);
        int fileSize = postedFile.ContentLength;

        if(fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" ||
            fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            lbl_message.Visible = true;
            
        }
        else
        {
            lbl_message.Visible = true;
            lbl_message.Text = "Only images (.jpg, .png, .gif, and .bmp) can be uploaded";
            lbl_message.ForeColor = System.Drawing.Color.Red;

        }
    }

    protected void btn_savePhoto_Click(object sender, EventArgs e)
    {

    }
}