using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{

    [Table("Transactions")]
    public partial class Transaction
    {
        public int TransactionID { get; set; }

        public int AccountID { get; set; }

        [Required]
        [StringLength(6)]
        public string CourseCode { get; set; }

        public int InstructorID { get; set; }

        public double Hours { get; set; }

        [Column(TypeName = "money")]
        public decimal LessonAmount { get; set; }

        public DateTime TransactionDate { get; set; }

        public virtual Account Account { get; set; }

        public virtual Course Course { get; set; }

        public virtual Instructor Instructor { get; set; }
    }
}
