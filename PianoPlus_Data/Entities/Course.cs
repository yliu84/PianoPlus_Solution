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
            ClassHistories = new HashSet<ClassHistory>();
            StudentClasses = new HashSet<StudentClass>();
            StudentPayments = new HashSet<StudentPayment>();
        }

        [Key]
        [StringLength(6)]
        public string CourseCode { get; set; }

        public int InstructorID { get; set; }

        [Required]
        [StringLength(15)]
        public string LessonType { get; set; }

        [Required]
        [StringLength(25)]
        public string LessonName { get; set; }

        [Required]
        [StringLength(1)]
        public string Active { get; set; }

        public int TotalSeats { get; set; }

        public virtual ICollection<ClassHistory> ClassHistories { get; set; }

        public virtual Instructor Instructor { get; set; }

        public virtual ICollection<StudentClass> StudentClasses { get; set; }

        public virtual ICollection<StudentPayment> StudentPayments { get; set; }
    }
}
