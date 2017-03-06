using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{
   
    [Table("StudentClass")]
    public partial class StudentClass
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int StudentID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(6)]
        public string CourseCode { get; set; }

        [Key]
        [Column(Order = 2)]
        public int InstructorID { get; set; }

        [Key]
        [Column(Order = 3)]
        public DateTime StartTime { get; set; }

        public DateTime EndTime { get; set; }

        [Required]
        [StringLength(15)]
        public string DayOfWeek { get; set; }

        public double Hours { get; set; }

        [StringLength(10)]
        public string Room { get; set; }

        public virtual Course Course { get; set; }

        public virtual Instructor Instructor { get; set; }

        public virtual Student Student { get; set; }
    }
}

