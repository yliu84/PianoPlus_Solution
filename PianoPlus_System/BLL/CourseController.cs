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
    public class CourseController
    {
        public bool AddNewCourse(Course lesson)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.Courses.Add(lesson);
                    context.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public List<Course> Course_List()
        {
            List<Course> courseList = new List<Course>();

            using (var context = new PianoPlusContext())
            {
                var results = from courses in context.Courses
                              select courses;



                return results.ToList();


            }
        }

        public Course GetCourseInfoByCourseCode(string courseCode)
        {
            Course currentCourse = new Course();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Courses
                                   where info.CourseCode == courseCode
                                   select info
                                   ).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return currentCourse;
            }
        }

        public void UpdateCourse(Course course)
        {

            using (var context = new PianoPlusContext())
            {
                //Find the entity
                Course currentCourse = context.Courses.Find(course.CourseCode);


                //Check if there is a change.
                if (currentCourse.CourseType != course.CourseType)
                {
                    currentCourse.CourseType = course.CourseType;
                }
                if (currentCourse.CourseName != course.CourseName)
                {
                    currentCourse.CourseName = course.CourseName;
                }
                if (currentCourse.TotalSeats != course.TotalSeats)
                {
                    currentCourse.TotalSeats = course.TotalSeats;
                }
                if (currentCourse.Active != course.Active)
                {
                    currentCourse.Active = course.Active;
                }

                //DO the update
                var update = context.Entry(context.Courses.Attach(currentCourse));
                update.Property(x => x.CourseType).IsModified = true;
                update.Property(x => x.CourseName).IsModified = true;
                update.Property(x => x.TotalSeats).IsModified = true;
                update.Property(x => x.Active).IsModified = true;

                //Save the changes in DB
                context.SaveChanges();

            }

        }
    }
}
