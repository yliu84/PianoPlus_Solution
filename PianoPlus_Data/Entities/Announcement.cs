using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{ 

    [Table("Announcement")]
    public partial class Announcement
    {
        public int AnnouncementID { get; set; }

        public int InstructorID { get; set; }

        public DateTime PostDate { get; set; }

        [Required]
        [StringLength(200)]
        public string Message { get; set; }

        public virtual Instructor Instructor { get; set; }
    }
}
