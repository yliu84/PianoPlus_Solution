using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace PianoPlus_Data.Entities
{

    [Table("Role")]
    public partial class Role
    {
        public Role()
        {
            Instructors = new HashSet<Instructor>();
        }

        [StringLength(3)]
        public string RoleID { get; set; }

        [Required]
        [StringLength(25)]
        public string Description { get; set; }
        public virtual ICollection<Instructor> Instructors { get; set; }
    }
}
