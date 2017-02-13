using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PianoPlus_Data.POCOS
{
    public class CalendarEvents
    {
        public int EventID { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public DateTime StartAt { get; set; }

        public DateTime EndAt { get; set; }

        public bool IsFullDay { get; set; }
    }
}
