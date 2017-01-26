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
    public class InstructorController
    {
        public bool AddNewInstructor(Instructor user)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.Instructors.Add(user);
                    context.SaveChanges();

                    return true;
                }
            }
            catch
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
                    var results = (from lookup in context.Instructors
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

        public Instructor GetInstructorInfo(string email)
        {
            Instructor CurrentStudent = new Instructor();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Instructors
                                   where info.Email == email
                                   select new Instructor
                                   {
                                       FirstName = info.FirstName,
                                       LastName = info.LastName,
                                       Email = info.Email,
                                       Phone = info.Phone,
                                       Address = info.Address,
                                       Province = info.Province,
                                       City = info.City,
                                       PostalCode = info.PostalCode,
                                       Active = info.Active,
                                       PassHash = info.PassHash,
                                       PassSalt = info.PassSalt,
                                       CreateDate = info.CreateDate,
                                       RoleID = info.RoleID
                                   }).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentStudent;
            }
        }
    }
}
