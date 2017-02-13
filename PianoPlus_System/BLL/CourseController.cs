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
    }
}
