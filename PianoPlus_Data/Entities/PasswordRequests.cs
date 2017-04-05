using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{
    [Table("PasswordRequests")]
    public partial class PasswordRequest
    {

        [Key]
        [Required]
        [StringLength(128)]
        public string RequestToken { get; set; }
        public int? StudentID { get; set; }

        public int? InstructorID { get; set; }

        [Required]
        [StringLength(60)]
        public string Email { get; set; }

        public DateTime CreateDate { get; set; }

        [StringLength(1)]
        public string Active { get; set; }
        

        public virtual Instructor Instructor { get; set; }

        public virtual Student Student { get; set; }
    }
}
