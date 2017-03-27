using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PianoPlus_Data.POCOS
{
    public class InvoiceInfo
    {
        public int PaymentID { get; set; }

        public string InstructorName { get; set; }

        public string StudentName { get; set; }

        public decimal Total { get; set; }
    }
}
