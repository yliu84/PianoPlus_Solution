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
        public List<Instructor> Instuctor_List()
        {

            using (var context = new PianoPlusContext())
            {
                var results = from instructors in context.Instructors
                              select instructors;

                return results.ToList();


            }
        }

        public List<Role> Role_List()
        {
            using(var context = new PianoPlusContext())
            {
                var results = from roles in context.Roles
                              select roles;

                return results.ToList();
            }
        }

        public Instructor GetInstructorInfoByID(int instructorID)
        {
            Instructor instructor = new Instructor();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Instructors
                                   where info.InstructorID == instructorID
                                   select info
                                   ).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return instructor;
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
                                   select info).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentStudent;
            }
        }

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

        
    }
}
