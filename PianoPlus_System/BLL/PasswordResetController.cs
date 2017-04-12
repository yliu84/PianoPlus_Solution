using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Net;
using System.Web;
using System.Web.Helpers;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_Data.POCOS;
using System.ComponentModel;
using System.Data.Entity;
namespace PianoPlus_System.BLL
{
    [DataObject]
    public class PasswordResetController
    {
        public bool AddPassswordResetRequest(int? studentID, int? instructorID)
        {
            using (var context = new PianoPlusContext())
            {
                string newEmail = "";
                //string salt = "";
                PasswordRequest request = new PasswordRequest();
                if (instructorID.HasValue)
                {
                    Instructor instructor = new Instructor();
                    InstructorController instructorController = new InstructorController();
                    instructor = instructorController.GetInstructorInfoByID(instructorID.Value);
                    request.InstructorID = instructorID.Value;

                    request.Student = null;
                    request.StudentID = null;

                    var emailQuery = context.Instructors.Where(id => id.InstructorID == instructorID.Value)
                        .Select(e => new { Email = e.Email, PassSalt = e.PassSalt});
                    var email = emailQuery.SingleOrDefault();

                    newEmail = email.Email;
                    request.Email = email.Email;
                    //salt = email.PassSalt;
                }
                else if (studentID.HasValue)
                {
                    Student student = new Student();
                    StudentController studentController = new StudentController();
                    student = studentController.GetStudentByStudentID(studentID.Value);
                    request.StudentID = studentID.Value;

                    request.Instructor = null;
                    request.InstructorID = null;

                    var emailQuery = context.Students.Where(id => id.StudentID == studentID.Value)
                        .Select(e => new { Email = e.Email, PassSalt = e.PassSalt });
                    var email = emailQuery.SingleOrDefault();
                    
                    newEmail = email.Email;
                    request.Email = email.Email;
                    //salt = email.PassSalt;
                }
                else
                {
                    return false;
                }
                DateTime createDate = DateTime.Now;
                request.CreateDate = createDate;

                string token = GenerateResetToken();
                SendForgotPasswordEmail(newEmail, token);
                //string hashed = Crypto.Hash(token + salt, "MD5");

                //request.RequestToken = hashed;
                request.RequestToken = token;
                request.Active = "Y";
                context.PasswordRequests.Add(request);

                context.SaveChanges();
            }
            return true;
        }
        public bool IsTokenValid(string token)
        {
            using (var context = new PianoPlusContext())
            {
                var getTokenQuery = context.PasswordRequests.Where(c => c.RequestToken == token && c.Active == "Y")
                    .Select(e => new { Token = e.RequestToken, CreateDate  = e.CreateDate });
                var requestToken = getTokenQuery.SingleOrDefault();
                if (requestToken == null)
                {
                    return false;
                }
                if ((requestToken.CreateDate - DateTime.Now).TotalDays >= 1)
                {
                    return false;
                }
                return true;
            }

        }
        public void UseToken(string token, string newPassword)
        {

            using (var context = new PianoPlusContext())
            {
                Instructor instructorInfo = new Instructor();
                Student studentInfo = new Student();
                var tokenInformation = context.PasswordRequests.Where(e => e.RequestToken == token).SingleOrDefault();
                instructorInfo = context.Instructors.Where(instMail => instMail.Email == tokenInformation.Email).SingleOrDefault();

                if (instructorInfo != null)
                {
                    string newPassHash = Crypto.Hash(newPassword + instructorInfo.PassSalt, "MD5");
                    InstructorController instructorController = new InstructorController();
                    instructorController.ChangePassword(instructorInfo.InstructorID, newPassHash);
                }
                else
                {
                    studentInfo = context.Students.Where(studmail => studmail.Email == tokenInformation.Email).SingleOrDefault();
                    string newPassHash = Crypto.Hash(newPassword + instructorInfo.PassSalt, "MD5");
                    StudentController studentController = new StudentController();
                    studentController.ChangePassword(studentInfo.StudentID, newPassHash);
                }
                
                tokenInformation.Active = "N";

                //DO the update
                var update = context.Entry(context.PasswordRequests.Attach(tokenInformation));
                update.Property(x => x.Active).IsModified = true;
                                
                //Save the changes in DB
                context.SaveChanges();

            }

        }
        private string GenerateResetToken()
        {
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();

            Byte[] bytes = new Byte[16];
            rng.GetBytes(bytes);

            return Convert.ToBase64String(bytes);            
        }
        private void SendForgotPasswordEmail(string email, string token)
        {
            // Gmail Address from where you send the mail
            var fromAddress = "milliamztest@gmail.com";
            // any address where the email will be sending
            //Password of your gmail address
            const string fromPassword = "sourgrapes";
            // Passing the values and make a email format to display
            string subject = "Forgot Account Password";
            string body = "Hi" + "\n\n\n";
            body += "This email has been sent in response to your request for a new password. " + "\n\n";
            //what is our domain name?!?!   put somthing temp here
            body += "Click on this link (" + "/ResetPassword.aspx?id=" + token + ") to reset your password.\n";
            body += "This link will only be valid for a day.\n\n";
            body += "\nRegards, \n\nPiano Plus Studio";
            // smtp settings
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(fromAddress, email, subject, body);
        }
    }
}


