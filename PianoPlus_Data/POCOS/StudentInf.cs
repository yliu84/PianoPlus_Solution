using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PianoPlus_Data.POCOS
{
    public class StudentInf
    {
        public int StudentID { get; set; }

        public string FullName { get; set; }

        public string Email { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }

        public string Province { get; set; }
        public string City { get; set; }

        public string PostalCode { get; set; }

        public string Active { get; set; }

        public DateTime CreateDate { get; set; }
    }
}
