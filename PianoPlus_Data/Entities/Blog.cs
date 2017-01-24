using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{    

    [Table("Blog")]
    public partial class Blog
    {
        public int BlogID { get; set; }

        public int InstructorID { get; set; }

        public DateTime PostDate { get; set; }

        [Required]
        [StringLength(500)]
        public string Content { get; set; }

        [Required]
        [StringLength(50)]
        public string Title { get; set; }

        public virtual Instructor Instructor { get; set; }
    }
}
