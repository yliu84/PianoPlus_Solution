using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
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

    }
}
