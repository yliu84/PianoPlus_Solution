using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{

    [Table("Instructor")]
    public partial class Instructor
    {
        public Instructor()
        {
            Announcements = new HashSet<Announcement>();
            Blogs = new HashSet<Blog>();
            Courses = new HashSet<Course>();
            Payments = new HashSet<Payment>();
        }

        public int InstructorID { get; set; }

        [Required]
        [StringLength(3)]
        public string RoleID { get; set; }

        [Required]
        [StringLength(25)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(25)]
        public string LastName { get; set; }

        [Required]
        [StringLength(60)]
        public string Email { get; set; }

        [Required]
        [StringLength(14)]
        public string Phone { get; set; }

        [Required]
        [StringLength(100)]
        public string Address { get; set; }

        [Required]
        [StringLength(15)]
        public string Province { get; set; }

        [Required]
        [StringLength(15)]
        public string City { get; set; }

        [Required]
        [StringLength(7)]
        public string PostalCode { get; set; }

        [Required]
        [StringLength(1)]
        public string Active { get; set; }

        [Required]
        [StringLength(128)]
        public string PassHash { get; set; }

        [Required]
        [StringLength(128)]
        public string PassSalt { get; set; }

        public DateTime CreateDate { get; set; }

        public virtual ICollection<Announcement> Announcements { get; set; }

        public virtual ICollection<Blog> Blogs { get; set; }

        public virtual ICollection<Course> Courses { get; set; }

        public virtual Role Role { get; set; }

        public virtual ICollection<Payment> Payments { get; set; }
    }
}
