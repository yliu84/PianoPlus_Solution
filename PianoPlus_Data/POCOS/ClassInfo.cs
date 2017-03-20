using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PianoPlus_Data.POCOS
{
    public class ClassInfo
    {
        public string StudentName { get; set; }
        public string Course { get; set; }
        public string InstructorName { get; set; }
        public int InstructorID { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string DayOfWeek { get; set; }
        public double Hours { get; set; }
        public string Room { get; set; }

    }
}
