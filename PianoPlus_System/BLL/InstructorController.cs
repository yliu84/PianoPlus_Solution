using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

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



            using (var context = new PianoPlusContext())
            {
                var results = (from info in context.Instructors
                               where info.Email == email
                               select info).SingleOrDefault();

                return results;

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

        public void UpdateInstructor(Instructor user)
        {

            using (var context = new PianoPlusContext())
            {
                //Find the entity
                Instructor currentInstructor = context.Instructors.Find(user.InstructorID);
                user.PassHash = currentInstructor.PassHash;

                //Check if there is a change.
                if (currentInstructor.FirstName != user.FirstName)
                {
                    currentInstructor.FirstName = user.FirstName;
                }
                if (currentInstructor.LastName != user.LastName)
                {
                    currentInstructor.LastName = user.LastName;
                }
                if(currentInstructor.RoleID != user.RoleID)
                {
                    currentInstructor.RoleID = user.RoleID;
                }
                if (currentInstructor.Phone != user.Phone)
                {
                    currentInstructor.Phone = user.Phone;
                }
                if (currentInstructor.Email != user.Email)
                {
                    currentInstructor.Email = user.Email;
                }
                if(currentInstructor.BirthDay != user.BirthDay)
                {
                    currentInstructor.BirthDay = user.BirthDay;
                }
                if (currentInstructor.Address != user.Address)
                {
                    currentInstructor.Address = user.Address;
                }
                if (currentInstructor.Province != user.Province)
                {
                    currentInstructor.Province = user.Province;
                }
                if (currentInstructor.City != user.City)
                {
                    currentInstructor.City = user.City;
                }
                if (currentInstructor.PostalCode != user.PostalCode)
                {
                    currentInstructor.PostalCode = user.PostalCode;
                }
                if (currentInstructor.PassHash != user.PassHash)
                {
                    currentInstructor.PassHash = user.PassHash;
                }
                if (currentInstructor.Active != user.Active)
                {
                    currentInstructor.Active = user.Active;
                }

                //DO the update
                var update = context.Entry(context.Instructors.Attach(currentInstructor));
                update.Property(x => x.FirstName).IsModified = true;
                update.Property(x => x.LastName).IsModified = true;
                update.Property(x => x.RoleID).IsModified = true;
                update.Property(x => x.Phone).IsModified = true;
                update.Property(x => x.Email).IsModified = true;
                update.Property(x => x.BirthDay).IsModified = true;
                update.Property(x => x.Address).IsModified = true;
                update.Property(x => x.Province).IsModified = true;
                update.Property(x => x.City).IsModified = true;
                update.Property(x => x.PassHash).IsModified = true;
                update.Property(x => x.PostalCode).IsModified = true;
                update.Property(x => x.Active).IsModified = true;


                //context.Entry<Student>(context.Students.Attach(user)).State = System.Data.Entity.EntityState.Modified;

                //Save the changes in DB
                context.SaveChanges();

            }

        }

        public List<StudentClass> GetInstructorScheduleForDay(int instructorID, DateTime day)
        {
            Instructor instructor = GetInstructorInfoByID(instructorID);
            using (var context = new PianoPlusContext())
            {
                var results = (from lesson in context.StudentClasses
                               where DbFunctions.TruncateTime(lesson.StartTime) == DbFunctions.TruncateTime(day)
                               && lesson.InstructorID == instructorID
                               select lesson
                               ).ToList();
                return results;

            }
        }
        public bool AddStudentClass(StudentClass newLesson)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.StudentClasses.Add(newLesson);
                    context.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool IsConflictingTime(DateTime startTime, DateTime endTime)
        {
            bool conflict = false;
            using (var context = new PianoPlusContext())
            {
                var resultCount = (from lesson in context.StudentClasses
                                   where (lesson.StartTime > startTime && startTime > lesson.EndTime)
                                   && (lesson.StartTime > endTime && endTime > lesson.EndTime)
                                   select new
                                   {
                                       StudentClasses = lesson
                                   }).Count();
                if (resultCount > 0)
                    conflict = true;
            }
            return conflict;
        }

        public bool UpdateProfileImage(int instructorId, byte[] picture)
        {
            bool updated = false;

            using (var context = new PianoPlusContext())
            {
                Instructor find = context.Instructors.Find(instructorId);

                if(find.ProfileImage != picture)
                {
                    find.ProfileImage = picture;
                }

                var update = context.Entry(context.Instructors.Attach(find));
                update.Property(x => x.ProfileImage).IsModified = true;

                context.SaveChanges();

                updated = true;

                return updated;
            }
        }
        
    }
}
