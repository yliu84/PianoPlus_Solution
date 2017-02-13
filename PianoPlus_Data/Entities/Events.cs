using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{

    public partial class Events
    {
        [Key]
        public int EventID { get; set; }

        public int InstructorID { get; set; }

        [Required]
        [StringLength(25)]
        public string Title { get; set; }

        [StringLength(200)]
        public string Description { get; set; }

        public DateTime StartAt { get; set; }

        public DateTime EndAt { get; set; }

        public bool IsFullDay { get; set; }

        public virtual Instructor Instructor { get; set; }
    }
}
