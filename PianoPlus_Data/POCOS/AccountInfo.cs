using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PianoPlus_Data.POCOS
{
    public class AccountInfo
    {
        public int AccountID { get; set; }
        public int StudentID { get; set; }
        public string StudentFullName { get; set; }
        public List<TransactionInfo> TransactionList { get; set; }
        //public decimal AccountTotal { get { return TransactionList.Sum(x => x.LessonTotal); } }
        public decimal AccountTotal { get; set; }
    }
}
