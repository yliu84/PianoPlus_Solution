using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_Data.POCOS;
using System.ComponentModel;
using System.Data.Entity;


namespace PianoPlus_System.BLL
{
    [DataObject]
    public class ClassController
    {
        public List<StudentClass> DailyClasses_List(DateTime date,int instructorID)
        {
            using (var context = new PianoPlusContext())
            {
                var resutls = from i in context.StudentClasses
                              where DbFunctions.TruncateTime(i.StartTime) == DbFunctions.TruncateTime(date) && i.InstructorID == instructorID
                              select i;

                return resutls.ToList();
                              

            }
        }

        public List<ClassInfo> Class_List(DateTime? startDay, DateTime? endDay, int? instructorID)
        {
            using (var context = new PianoPlusContext())
            {
                var results = from i in context.StudentClasses
                              select new ClassInfo()
                              {                                
                                  StudentName = i.Student.FirstName + " " + i.Student.LastName,
                                  InstructorName = i.Instructor.FirstName + " " + i.Instructor.LastName,
                                  InstructorID = i.InstructorID,
                                  Course = i.Course.CourseName,
                                  StartTime = i.StartTime,
                                  EndTime = i.EndTime,
                                  DayOfWeek = i.DayOfWeek,
                                  Hours = i.Hours,
                                  Room = i.Room
                              };

                if (startDay != null && endDay != null)
                {
                    results = results.Where(x => x.StartTime >= startDay && x.EndTime <= endDay);
                }

                return results.ToList();
            }
        }

        public bool AddClass(StudentClass newClass)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.StudentClasses.Add(newClass);
                    context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
            
        }
        public bool RemoveClass(DateTime startDate, int instructorID, int studentID, string courseCode)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {

                    StudentClass currentClass = context.StudentClasses.Find(studentID, courseCode, instructorID, startDate);

                    context.StudentClasses.Remove(currentClass);
                    context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }

        }

        public void UpdateClass(StudentClass updatedClass, int oldStudentID, string oldCourseCode, DateTime oldStartTime)
        {

            using (var context = new PianoPlusContext())
            {
                //Find the entity
                StudentClass currentClass = context.StudentClasses.Find(oldStudentID, oldCourseCode, updatedClass.InstructorID, oldStartTime);


                //Check if there is a change.
                if (currentClass.StudentID != updatedClass.StudentID)
                {
                    currentClass.StudentID = updatedClass.StudentID;
                }
                if (currentClass.InstructorID != updatedClass.InstructorID)
                {
                    currentClass.InstructorID = updatedClass.InstructorID;
                }
                if (currentClass.CourseCode != updatedClass.CourseCode)
                {
                    currentClass.CourseCode = updatedClass.CourseCode;
                }
                if (currentClass.StartTime != updatedClass.StartTime)
                {
                    currentClass.StartTime = updatedClass.StartTime;
                }
                if (currentClass.EndTime != updatedClass.EndTime)
                {
                    currentClass.EndTime = updatedClass.EndTime;
                }
                if (currentClass.DayOfWeek != updatedClass.DayOfWeek)
                {
                    currentClass.DayOfWeek = updatedClass.DayOfWeek;
                }
                if (currentClass.Hours != updatedClass.Hours)
                {
                    currentClass.Hours = updatedClass.Hours;
                }
                if (currentClass.Room != updatedClass.Room)
                {
                    currentClass.Room = updatedClass.Room;
                }


                //DO the update
                var update = context.Entry(context.StudentClasses.Attach(currentClass));
                update.Property(x => x.StudentID).IsModified = true;
                update.Property(x => x.InstructorID).IsModified = true;
                update.Property(x => x.CourseCode).IsModified = true;
                update.Property(x => x.StartTime).IsModified = true;
                update.Property(x => x.EndTime).IsModified = true;
                update.Property(x => x.DayOfWeek).IsModified = true;
                update.Property(x => x.Hours).IsModified = true;
                update.Property(x => x.Room).IsModified = true;


                //Save the changes in DB
                context.SaveChanges();

            }

        }

        public int ClassStudentCheck(StudentClass newClass)
        {
            int GoodCase = 0;
            int StudentExists = 1;
            int TimeConflict =2;
            

            using(var context = new PianoPlusContext())
            {
                var oldClass = (from i in context.StudentClasses
                                where i.InstructorID == newClass.InstructorID
                                select i).ToList();

                var resultOne = oldClass.Where(x => x.StudentID == newClass.StudentID && x.StartTime == newClass.StartTime && newClass.EndTime == x.EndTime && x.CourseCode == newClass.CourseCode);

                var resultTwo = oldClass.Where(x => x.StartTime > newClass.StartTime && newClass.EndTime > x.StartTime);

                var resutThree = oldClass.Where(x => newClass.StartTime > x.StartTime && newClass.StartTime < x.EndTime);

                if (resultOne.Count() > 0)
                {
                    return StudentExists;
                }
                else if (resultTwo.Count() > 0)
                {
                    return TimeConflict;
                }
                else if(resutThree.Count() > 0)
                {
                    return TimeConflict;
                }
                else
                {
                    return GoodCase;
                }



            }
        }

        public StudentClass GetClassInfoByStartEndDateAndInstructorID(DateTime startDay, DateTime endDay, int instructorID)
        {
            StudentClass currentClass = new StudentClass();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from studentClass in context.StudentClasses
                                   where    studentClass.StartTime == startDay
                                   &&       studentClass.EndTime == endDay
                                   &&       studentClass.InstructorID == instructorID
                                   select studentClass
                                   ).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return currentClass;
            }

        }

    }
}
