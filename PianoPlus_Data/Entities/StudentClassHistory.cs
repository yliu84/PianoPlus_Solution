using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{    

    [Table("StudentClassHistory")]
    public partial class StudentClassHistory
    {
        public int StudentID { get; set; }

        [Required]
        [StringLength(25)]
        public string CourseName { get; set; }

        [Key]
        public DateTime StartTime { get; set; }

        [Required]
        [StringLength(51)]
        public string InstructorName { get; set; }

        public DateTime EndTime { get; set; }

        [Required]
        [StringLength(15)]
        public string DayOfWeek { get; set; }

        public double Hours { get; set; }

        [StringLength(10)]
        public string Room { get; set; }

        public virtual Student Student { get; set; }
    }
}
