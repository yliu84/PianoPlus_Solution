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

        public Student GetStudentInfo(string email)
        {
            Student CurrentStudent = new Student();

            try
            {
                using(var context = new PianoPlusContext())
                {
                    var results = (from info in context.Students
                                   where info.Email == email
                                   select info
                                   ).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentStudent;
            }
        }

        public Student GetStudentInfoByStudentID(int studentID)
        {
            Student CurrentStudent = new Student();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Students
                                   where info.StudentID == studentID
                                   select info
                                   ).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentStudent;
            }
        }

        public List<Student> Student_List()
        {
            List<Student> studentList = new List<Student>();

            using (var context = new PianoPlusContext())
            {
                var results = from students in context.Students
                              select students;

                return results.ToList();

               
            }
        }
    }
}
