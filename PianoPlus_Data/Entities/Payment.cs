using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{
   
    [Table("Payment")]
    public partial class Payment
    {
        public Payment()
        {
            CoursePayments = new HashSet<CoursePayment>();
        }

        public int PaymentID { get; set; }

        public int InstructorID { get; set; }

        public int StudentID { get; set; }

        [Column(TypeName = "money")]
        public decimal Total { get; set; }

        public DateTime PaidTime { get; set; }

        public virtual Instructor Instructor { get; set; }

        public virtual Student Student { get; set; }

        public virtual ICollection<CoursePayment> CoursePayments { get; set; }
    }
}
