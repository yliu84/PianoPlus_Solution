using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{

    [Table("Student")]
    public partial class Student
    {
        public Student()
        {
            InstructorClassHistories = new HashSet<InstructorClassHistory>();
            Payments = new HashSet<Payment>();
            StudentClasses = new HashSet<StudentClass>();
            StudentClassHistories = new HashSet<StudentClassHistory>();
            PasswordRequests = new HashSet<PasswordRequest>();
        }

        public int StudentID { get; set; }

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
        public DateTime BirthDay { get; set; }

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

        public byte[] ProfileImage { get; set; }

        public DateTime CreateDate { get; set; }

        [NotMapped]
        public string StudentName
        {
            get
            {
                return FirstName + " " + LastName;
            }
 
        }

        public virtual ICollection<InstructorClassHistory> InstructorClassHistories { get; set; }

        public virtual ICollection<Payment> Payments { get; set; }

        public virtual ICollection<StudentClass> StudentClasses { get; set; }

        public virtual ICollection<StudentClassHistory> StudentClassHistories { get; set; }
        public virtual ICollection<PasswordRequest> PasswordRequests { get; set; }
    }
}
