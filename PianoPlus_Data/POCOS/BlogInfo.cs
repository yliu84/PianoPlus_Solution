using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PianoPlus_Data.POCOS
{
    public class BlogInfo
    {
        public int BlogID { get; set; }

        public string InstructorName { get; set; }

        public DateTime PostDate { get; set; }

        public string Content { get; set; }

        public string Title { get; set; }
    }
}
