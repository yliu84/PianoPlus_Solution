using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{   

    [Table("Course")]
    public partial class Course
    {
        public Course()
        {
            CoursePayments = new HashSet<CoursePayment>();
            StudentClasses = new HashSet<StudentClass>();
        }

        [Key]
        [StringLength(6)]
        public string CourseCode { get; set; }

        public int InstructorID { get; set; }

        [Required]
        [StringLength(15)]
        public string CourseType { get; set; }

        [Required]
        [StringLength(25)]
        public string CourseName { get; set; }

        [Required]
        [StringLength(1)]
        public string Active { get; set; }

        public int TotalSeats { get; set; }

        public virtual Instructor Instructor { get; set; }

        public virtual ICollection<StudentClass> StudentClasses { get; set; }

        public virtual ICollection<CoursePayment> CoursePayments { get; set; }
    }
}
