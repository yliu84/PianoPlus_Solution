using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PianoPlus_Data.POCOS
{
    public class InvoiceInfo
    {
        public int TransactionID { get; set; }

        public string CourseCode { get; set; }
        public string CourseDescription { get; set; }

        public int InstructorID { get; set; }

        public int Hours { get; set; }

        public decimal LessonTotal { get; set; }
        public DateTime TransactionDate { get; set; }

    }
}
