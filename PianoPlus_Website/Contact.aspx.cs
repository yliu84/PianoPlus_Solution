using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Net;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void buttonContact_Click(object sender, EventArgs e)
    {
        try
        {


            string emailSender = ConfigurationManager.AppSettings["username"].ToString();
            string emailSenderPassword = ConfigurationManager.AppSettings["password"].ToString();
            string emailSenderHost = ConfigurationManager.AppSettings["smtpserver"].ToString();
            int emailSenderPort = Convert.ToInt16(ConfigurationManager.AppSettings["portnumber"]);
            Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);

            string subject = "Hymusic Contact Information";

            //Base class for sending email  
            MailMessage _mailmsg = new MailMessage();

            //Make TRUE because our body text is html  
            _mailmsg.IsBodyHtml = true;

            //Set From Email ID  
            _mailmsg.From = new MailAddress(InputEmail.Value);

            //Set To Email ID  
            _mailmsg.To.Add("info.hymedu@gmail.com");

            //Set Subject  
            _mailmsg.Subject = subject;

            //Set Body Text of Email   
            _mailmsg.Body = "<h3>Hymusic Web Contact Form Submission</h3> <br/>";
            _mailmsg.Body += "<b>Name:</b> " + InputName.Value + "<br/>";
            _mailmsg.Body += "<b>Sender Email:</b> " + InputEmail.Value + "<br/>";
            _mailmsg.Body += "<b>Message:</b> <br>" + InputMessage.Value + "<br/>";
            _mailmsg.BodyEncoding = System.Text.Encoding.UTF8;
            SmtpClient _smtp = new SmtpClient();

            //Set HOST server SMTP detail  
            _smtp.Host = emailSenderHost;

            //Set PORT number of SMTP  
            _smtp.Port = emailSenderPort;

            //Set SSL --> True / False  
            _smtp.EnableSsl = emailIsSSL;

            _smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

            //Set Sender UserEmailID, Password  
            NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
            _smtp.Credentials = _network;

            //Send Method will send your MailMessage create above.  
            _smtp.Send(_mailmsg);

            DisplayMessage.InnerText = "Your message was sent successfully!";
            DisplayMessage.Visible = true;
            InputName.Value = "";
            InputEmail.Value = "";
            InputMessage.Value = "";
        }
        catch (Exception ex)
        {
            DisplayMessage.InnerText = ex.Message;
            DisplayMessage.Visible = true;
        }
    }
}