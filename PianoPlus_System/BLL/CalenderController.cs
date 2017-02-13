﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
using System.ComponentModel;

namespace PianoPlus_System.BLL
{
    [DataObject]
    public class CalenderController
    {
        public List<Events> GetEvents()
        {
            using(var context = new PianoPlusContext())
            {
                var results = context.Events.OrderBy(a => a.StartAt).ToList();
                return results;
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
    }
}
