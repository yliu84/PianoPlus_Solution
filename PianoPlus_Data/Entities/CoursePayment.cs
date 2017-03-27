using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{
    
    [Table("CoursePayment")]
    public partial class CoursePayment
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PaymentID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(6)]
        public string CourseCode { get; set; }

        public double Hours { get; set; }

        [Column(TypeName = "money")]
        public decimal LessonFee { get; set; }

        public DateTime PaidTime { get; set; }

        public virtual Course Course { get; set; }

        public virtual Payment Payment { get; set; }
    }
}
