using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PianoPlus_Data.Entities;
using PianoPlus_Data;
using System.ComponentModel;

namespace PianoPlus_System.BLL
{
    [DataObject]
    public class StudentController
    {
        public bool AddNewStudent(Student user)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.Students.Add(user);
                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // Checks to see if an email is used on another account
        public bool CheckIfEmailIsAvailable(string email)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from lookup in context.Students
                                   where lookup.Email == email
                                   select new
                                   {
                                       Email = lookup.Email
                                   }).ToList();

                    //if there is no account with the email returns true
                    if (results.Count == 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
