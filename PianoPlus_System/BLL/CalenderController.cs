using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_Data.POCOS;
using System.ComponentModel;

namespace PianoPlus_System.BLL
{
    [DataObject]
    public class CalenderController
    {
        public List<CalendarEvents> GetEvents()
        {
            using(var context = new PianoPlusContext())
            {
                var results = from x in context.Events
                              select new CalendarEvents()
                              {
                                  EventID = x.EventID,
                                  Title = x.Title,
                                  Description = x.Description,
                                  StartAt = x.StartAt,
                                  EndAt = x.EndAt,
                                  IsFullDay = x.IsFullDay
                              };
                return results.ToList();
            }
        }
        
        public bool SaveEvent(Events evt)
        {
            bool status = false;

            using(var context = new PianoPlusContext())
            {
                if(evt.EndAt != null && evt.StartAt.TimeOfDay == new TimeSpan(0,0,0) && evt.EndAt.TimeOfDay == new TimeSpan(0,0,0))
                {
                    evt.IsFullDay = true;
                }
                else
                {
                    evt.IsFullDay = false;
                }

                if(evt.EventID > 0)
                {
                    var v = context.Events.Where(a => a.EventID.Equals(evt.EventID)).FirstOrDefault();
                    if(v != null)
                    {
                        v.Title = evt.Title;
                        v.Description = evt.Description;
                        v.StartAt = evt.StartAt;
                        v.EndAt = evt.EndAt;
                        v.IsFullDay = evt.IsFullDay;
                    }
                }
                else
                {
                    context.Events.Add(evt);
                }

                context.SaveChanges();
                status = true;
            }

            return status;
        }

        public bool DeleteEvent(int eventID)
        {
            bool status = false;

            using(var context = new PianoPlusContext())
            {
                var result = context.Events.Where(a => a.EventID.Equals(eventID)).FirstOrDefault();
                if(result != null)
                {
                    context.Events.Remove(result);
                    context.SaveChanges();
                    status = true;

                }
            }

            return status;
        }
        public List<StudentClass> GetInstructorScheduleForDay(int instructorID, DateTime day)
        {

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

    }
}
