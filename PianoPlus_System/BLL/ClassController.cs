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
                var results = from classes in context.StudentClasses
                              join course in context.Courses on classes.CourseCode equals course.CourseCode
                              select new ClassInfo()
                              {                                
                                  StudentName = classes.Student.FirstName + " " + classes.Student.LastName,
                                  InstructorName = classes.Instructor.FirstName + " " + classes.Instructor.LastName,
                                  InstructorID = classes.InstructorID,
                                  Course = classes.Course.CourseName,
                                  CourseCode = classes.CourseCode,
                                  StartTime = classes.StartTime,
                                  EndTime = classes.EndTime,
                                  DayOfWeek = classes.DayOfWeek,
                                  Hours = classes.Hours,
                                  Room = classes.Room
                              };

                if (startDay != null && endDay != null)
                {
                    results = results.Where(x => x.StartTime >= startDay && x.EndTime <= endDay);
                }

                return results.ToList();
            }
        }
        public bool IsHistorical(StudentClass studentClass)
        {
            if (studentClass.StartTime > DateTime.Now)
                return false;
            return true;
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
        public bool RemoveStudentClass(DateTime startDate, int instructorID, int studentID, string courseCode)
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

        public void UpdateClass(List<StudentClass> updatedClasses, string oldCourseCode, DateTime oldStartTime, int instructorID)
        {

            using (var context = new PianoPlusContext())
            {
                //Find the entity
                var allClasses = (from i in context.StudentClasses
                                    where i.InstructorID == instructorID
                                    &&      i.CourseCode == oldCourseCode
                                    &&      i.StartTime == oldStartTime
                                    select i).ToList();


                //Check if there is a change.
                foreach (StudentClass currentClass in allClasses)
                {
                    context.StudentClasses.Remove(currentClass);
                }
                foreach (StudentClass clas in updatedClasses)
                {
                    context.StudentClasses.Add(clas);
                }


                //DO the update
                context.SaveChanges();
                //var update = context.Entry(context.StudentClasses.Attach(currentClass));
                //update.Property(x => x.StudentID).IsModified = true;
                //update.Property(x => x.InstructorID).IsModified = true;
                //update.Property(x => x.CourseCode).IsModified = true;
                //update.Property(x => x.StartTime).IsModified = true;
                //update.Property(x => x.EndTime).IsModified = true;
                //update.Property(x => x.DayOfWeek).IsModified = true;
                //update.Property(x => x.Hours).IsModified = true;
                //update.Property(x => x.Room).IsModified = true;


                //Save the changes in DB

            }

        }
        public int UpdatedClassStudentCheck(StudentClass newClass)
        {
            int GoodCase = 0;
            int StudentExists = 1;
            int TimeConflict = 2;


            using (var context = new PianoPlusContext())
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
                else if (resutThree.Count() > 0)
                {
                    return TimeConflict;
                }
                else
                {
                    return GoodCase;
                }

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
        public StudentClass GetClassByStartDateStudentIDCourseCodeAndInstructorID(DateTime startDay, string courseCode, int studentID, int instructorID)
        {
            StudentClass currentClass = new StudentClass();           

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var foundClass = context.StudentClasses.Find(studentID, courseCode, instructorID, startDay);


                    return foundClass;

                }
            }
            catch
            {
                return currentClass;
            }

        }
        public List<StudentClass> GetClassesInfoByStartEndDateAndInstructorID(DateTime startDay, string courseCode, int instructorID)
        {
            List<StudentClass> currentClasses = new List<StudentClass>();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from studentClass in context.StudentClasses
                                   where    studentClass.StartTime == startDay
                                   &&       studentClass.CourseCode == courseCode
                                   &&       studentClass.InstructorID == instructorID
                                   select studentClass
                                   ).ToList();

                    return results;

                }
            }
            catch
            {
                return currentClasses;
            }

        }

        public List<ClassInfo> GetClassesByEndTimeAndStudentID(int studentID)
        {
            List<ClassInfo> currentClasses = new List<ClassInfo>();
            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from studentClass in context.StudentClasses
                                   where studentClass.EndTime >= System.DateTime.Now
                                   && studentClass.StudentID == studentID
                                   select new ClassInfo() { 
                                   StudentName = studentClass.Student.FirstName + " " + studentClass.Student.LastName,
                                   Course = studentClass.Course.CourseName,
                                   InstructorName = studentClass.Instructor.FirstName + " " + studentClass.Instructor.LastName,
                                   StartTime = studentClass.StartTime,
                                   EndTime = studentClass.EndTime,
                                   DayOfWeek = studentClass.DayOfWeek,
                                   Hours = studentClass.Hours,
                                   Room = studentClass.Room
                                   }).ToList();
                    return results;
                }
            }
            catch
            {
                return currentClasses;
            }
        }

        public List<ClassInfo> GetClassHistoryByStudentID(int studentID)
        {
            List<ClassInfo> pastClasses = new List<ClassInfo>();
            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from studentClassHistory in context.StudentClasses
                                   where studentClassHistory.StudentID == studentID && studentClassHistory.EndTime < System.DateTime.Now
                                   select new ClassInfo(){
                                       StudentName = studentClassHistory.Student.FirstName + " " + studentClassHistory.Student.LastName,
                                       Course = studentClassHistory.Course.CourseName,
                                       InstructorName = studentClassHistory.Instructor.FirstName + " " + studentClassHistory.Instructor.LastName,
                                       StartTime = studentClassHistory.StartTime,
                                       EndTime = studentClassHistory.EndTime,
                                       DayOfWeek = studentClassHistory.DayOfWeek,
                                       Hours = studentClassHistory.Hours,
                                       Room = studentClassHistory.Room
                                   }).ToList();
                    return results;
                }
            }
            catch
            {
                return pastClasses;
            }
        }

    }
}
