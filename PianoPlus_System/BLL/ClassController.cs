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

    }
}
