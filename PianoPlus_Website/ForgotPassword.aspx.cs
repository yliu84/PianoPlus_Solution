﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_Data.POCOS;
using PianoPlus_System.BLL;
using System.Net;
using System.Web.Helpers;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    protected void btn_submit_Click(object sender, EventArgs e)
    {

        //if (Page.IsValid)
        //{
        //    StudentController studentController = new StudentController();
        //    InstructorController instructorController = new InstructorController();
        //    string email = txt_email.Text;
        //    if (!studentController.CheckIfEmailIsAvailable(email))
        //    {
        //        SendForgotPasswordEmail(email);
        //    }
        //    else if (!instructorController.CheckIfEmailIsAvailable(email))
        //    {
        //        Instructor instructor = GetInstructorInfo(email);
        //        // Gmail Address from where you send the mail
        //        var fromAddress = "milliamztest@gmail.com";
        //        // any address where the email will be sending
        //        //Password of your gmail address
        //        const string fromPassword = "sourgrapes";
        //        // Passing the values and make a email formate to display
        //        string subject = "Forgot Account Password";
        //        string body = "Hi" + "\n\n\n";
        //        body += "This email has been sent in response to your request for a new password. " + "\n\n";
        //        body += "Your Password is:  " + Crypto.+ "\n"; //I know this is stupid butill implement the link later
        //        body += "\nRegards, \n\nPiano Plus Studio";
        //        // smtp settings
        //        var smtp = new System.Net.Mail.SmtpClient();
        //        {
        //            smtp.Host = "smtp.gmail.com";
        //            smtp.Port = 587;
        //            smtp.EnableSsl = true;
        //            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
        //            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
        //            smtp.Timeout = 20000;
        //        }
        //        // Passing values to smtp object
        //        smtp.Send(fromAddress, email, subject, body);
        //    }
        //}

    }
    protected void SendForgotPasswordEmail(string email)
    {
        //Instructor instructor = GetInstructorInfo(email);
        //// Gmail Address from where you send the mail
        //var fromAddress = "milliamztest@gmail.com";
        //// any address where the email will be sending
        ////Password of your gmail address
        //const string fromPassword = "sourgrapes";
        //// Passing the values and make a email formate to display
        //string subject = "Forgot Account Password";
        //string body = "Hi" + "\n\n\n";
        //body += "This email has been sent in response to your request for a new password. " + "\n\n";
        //body += "Your Password is:  " + Crypto.+ "\n"; //I know this is stupid butill implement the link later
        //body += "\nRegards, \n\nPiano Plus Studio";
        //// smtp settings
        //var smtp = new System.Net.Mail.SmtpClient();
        //{
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.EnableSsl = true;
        //    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
        //    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
        //    smtp.Timeout = 20000;
        //}
        //// Passing values to smtp object
        //smtp.Send(fromAddress, email, subject, body);
    }

    protected void PasswordRecovery_SendingMail(object sender, MailMessageEventArgs e)
    {

    }
}