using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_Data.POCOS;
using System.ComponentModel;
using System.Data.Entity;
namespace PianoPlus_System.BLL
{
    class PasswordResetController
    {
        public bool AddPassswordResetRequest(int? studentID, int? instructorID)
        {
            //using (var context = new PianoPlusContext())
            //{
            //    PasswordRequest request = new PasswordRequest();
            //    if (instructor != null)
            //    {
            //        request.InstructorID = instructor.Value.InstructorID;
            //        request.Instructor = instructor.Value;
            //        request.Student = null;
            //        request.StudentID = null;
            //    }
            //    else if (student != null)
            //    {
            //        request.StudentID = student.Value.StudentID;
            //        request.Student = student.Value;
            //        request.Instructor = null;
            //        request.InstructorID = null;
            //    }
            //    else
            //    {
            //        return false;
            //    }
            //    context.PasswordRequests.Add(request);

            //    context.SaveChanges();

            //}
            return false;
        }
    }
}
