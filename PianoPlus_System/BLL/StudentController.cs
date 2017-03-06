﻿using System;
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

        public void UpdateStudent(Student user)
        {

            using (var context = new PianoPlusContext())
            {
                //Find the entity
                Student currentStudent = context.Students.Find(user.StudentID);


                //Check if there is a change.
                if (currentStudent.FirstName != user.FirstName)
                {
                    currentStudent.FirstName = user.FirstName;
                }
                if (currentStudent.LastName != user.LastName)
                {
                    currentStudent.LastName = user.LastName;
                }
                if (currentStudent.Phone != user.Phone)
                {
                    currentStudent.Phone = user.Phone;
                }
                if (currentStudent.Email != user.Email)
                {
                    currentStudent.Email = user.Email;
                }
                if (currentStudent.Address != user.Address)
                {
                    currentStudent.Address = user.Address;
                }
                if (currentStudent.Province != user.Province)
                {
                    currentStudent.Province = user.Province;
                }
                if (currentStudent.City != user.City)
                {
                    currentStudent.City = user.City;
                }
                if (currentStudent.PostalCode != user.PostalCode)
                {
                    currentStudent.PostalCode = user.PostalCode;
                }
                if (currentStudent.Active != user.Active)
                {
                    currentStudent.Active = user.Active;
                }

                //DO the update
                var update = context.Entry(context.Students.Attach(currentStudent));
                update.Property(x => x.FirstName).IsModified = true;
                update.Property(x => x.LastName).IsModified = true;
                update.Property(x => x.Phone).IsModified = true;
                update.Property(x => x.Email).IsModified = true;
                update.Property(x => x.Address).IsModified = true;
                update.Property(x => x.Province).IsModified = true;
                update.Property(x => x.City).IsModified = true;
                update.Property(x => x.PostalCode).IsModified = true;
                update.Property(x => x.Active).IsModified = true;


                //context.Entry<Student>(context.Students.Attach(user)).State = System.Data.Entity.EntityState.Modified;

                //Save the changes in DB
                context.SaveChanges();

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
