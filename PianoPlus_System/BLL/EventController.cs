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
    public class EventController
    {
        public List<Events> Event_list(int instructorId)
        {
            using (var context = new PianoPlusContext())
            {
                var results = (from i in context.Events
                               where i.InstructorID == instructorId 
                              orderby i.StartAt descending
                              select i).Take(5);

                return results.ToList();

            }
        }

        public int EventCounter(int instructorId)
        {
            using (var context = new PianoPlusContext())
            {
                var results = from i in context.Events
                               where i.InstructorID == instructorId
                               orderby i.StartAt descending
                               select i;

                return results.ToList().Count();

            }
        }

    }
}
