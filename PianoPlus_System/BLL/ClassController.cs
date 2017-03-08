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

    }
}
