using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //protected void SendMailBASIC()
    //{
    //    // Gmail Address from where you send the mail
    //    var fromAddress = "no.reply.company@gmail.com";
    //    // any address where the email will be sending
    //    var toAddress = Email.Text.ToString();
    //    //Password of your gmail address
    //    const string fromPassword = "password";
    //    // Passing the values and make a email formate to display
    //    string subject = "Customer Account Confirmation";
    //    string body = "Hi " + Name.Text.ToString() + "\n\n";
    //    body += "Welcome to blah\nI Wanted to let you know that your account for blah.com is now active. " + "\n\n";
    //    body += "The next time you log in we will ask you to add more details to your account.  " + "\n";
    //    body += "\nCheers, \n\nThe ugoproperty team";
    //    // smtp settings
    //    var smtp = new System.Net.Mail.SmtpClient();
    //    {
    //        smtp.Host = "smtp.gmail.com";
    //        smtp.Port = 587;
    //        smtp.EnableSsl = true;
    //        smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
    //        smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
    //        smtp.Timeout = 20000;
    //    }
    //    // Passing values to smtp object
    //    smtp.Send(fromAddress, toAddress, subject, body);
    //}
}