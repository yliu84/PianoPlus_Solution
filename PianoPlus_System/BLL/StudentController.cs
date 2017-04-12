using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_Data.POCOS;
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

        public void ChangePassword(int studentID, string newPass)
        {
            using (var context = new PianoPlusContext())
            {
                //Find the entity
                Student currentStudent = context.Students.Find(studentID);

                //Check if there is a change.
                if (currentStudent.PassHash != newPass)
                {
                    currentStudent.PassHash = newPass;
                }
                var update = context.Entry(context.Students.Attach(currentStudent));
                update.Property(x => x.PassHash).IsModified = true;

                //Save the changes in DB
                context.SaveChanges();

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
                if(currentStudent.BirthDay != user.BirthDay)
                {
                    currentStudent.BirthDay = user.BirthDay;
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
                update.Property(x => x.BirthDay).IsModified = true;
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

        public Student GetStudentByStudentID(int studentID)
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

        public StudentInf GetStudentInfoByStudentID(int studentID)
        {
            StudentInf CurrentStudent = new StudentInf();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Students
                                   where info.StudentID == studentID
                                   select new StudentInf(){
                                       FullName = info.FirstName + " " + info.LastName,
                                       StudentID = info.StudentID,
                                       Email = info.Email,
                                       Phone = info.Phone,
                                       Address = info.Address,
                                       Province = info.Province,
                                       City = info.City,
                                       PostalCode = info.PostalCode,
                                       Active = info.Active,
                                       CreateDate = info.CreateDate

                                   }).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentStudent;
            }
        }

        public List<StudentInf> Student_List(string name)
        {          

            using (var context = new PianoPlusContext())
            {
                var results = from students in context.Students
                              orderby students.LastName, students.FirstName
                              select new StudentInf(){
                                  FullName = students.FirstName + " " + students.LastName,
                                  StudentID = students.StudentID,
                                  Email = students.Email,
                                  Phone =students.Phone,
                                  Address = students.Address,
                                  Province =students.Province,
                                  City = students.City,
                                  PostalCode =students.PostalCode,
                                  Active =students.Active,
                                  CreateDate = students.CreateDate

                              };


                if (!string.IsNullOrEmpty(name))
                {
                    results = results.Where(x => x.FullName.Contains(name));
                }


                return results.ToList();

               
            }            
        }
        public List<StudentInf> StudentInClass(DateTime startTime, string courseCode, int instructorID)
        {

            using (var context = new PianoPlusContext())
            {
                var results = from students in context.Students
                              join studentClasses in context.StudentClasses on  students.StudentID equals studentClasses.StudentID
                              where studentClasses.StartTime == startTime
                              && studentClasses.CourseCode == courseCode
                              && studentClasses.InstructorID == instructorID
                              orderby students.LastName, students.FirstName
                              select new StudentInf()
                              {
                                  FullName = students.FirstName + " " + students.LastName,
                                  StudentID = students.StudentID,
                                  Email = students.Email,
                                  Phone = students.Phone,
                                  Address = students.Address,
                                  Province = students.Province,
                                  City = students.City,
                                  PostalCode = students.PostalCode,
                                  Active = students.Active,
                                  CreateDate = students.CreateDate

                              };

                
                return results.ToList();


            }


        }

        public bool UpdateProfileImage(int studentId, byte[] picture)
        {
            bool updated = false;

            using (var context = new PianoPlusContext())
            {
                Student find = context.Students.Find(studentId);

                if (find.ProfileImage != picture)
                {
                    find.ProfileImage = picture;
                }

                var update = context.Entry(context.Students.Attach(find));
                update.Property(x => x.ProfileImage).IsModified = true;

                context.SaveChanges();

                updated = true;

                return updated;
            }
        }
    }
}
