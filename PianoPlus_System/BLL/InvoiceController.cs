using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_Data.POCOS;
using System.ComponentModel;

namespace PianoPlus_System.BLL
{
    [DataObject]
    class InvoiceController
    {
        public bool AddNewInvoice(CoursePayment coursepayment)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.CoursePayments.Add(coursepayment);
                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public CoursePayment GetCoursePaymentInfo(int paymentid)
        {
            CoursePayment CurrentCoursePayment = new CoursePayment();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.CoursePayments
                                   where info.PaymentID == paymentid
                                   select info
                                   ).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentCoursePayment;
            }
        }

        public Payment GetPaymentByStudentID(int studentID)
        {
            Payment CurrentPayment = new Payment();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Payments
                                   where info.StudentID == studentID
                                   select info
                                   ).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentPayment;
            }
        }

        public InvoiceInfo GetInvoiceInfoByStudent(int studentid)
        {
            InvoiceInfo CurrentInvoice = new InvoiceInfo();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Payments
                                   where info.StudentID == studentid
                                   select new InvoiceInfo()
                                   {
                                       PaymentID = info.PaymentID,
                                       InstructorName = info.Instructor.FirstName + " " + info.Instructor.LastName,
                                       StudentName = info.Student.FirstName + " " + info.Student.LastName,
                                       Total = info.Total
                                   }).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentInvoice;
            }
        }

        public List<InvoiceInfo> Invoice_List(string name)
        {

            using (var context = new PianoPlusContext())
            {
                var results = from invoices in context.Payments
                              orderby invoices.Student.LastName, invoices.Student.FirstName
                              select new InvoiceInfo()
                              {
                                  PaymentID = invoices.PaymentID,
                                  InstructorName = invoices.Instructor.FirstName + " " + invoices.Instructor.LastName,
                                  StudentName = invoices.Student.FirstName + " " + invoices.Student.LastName,
                                  Total = invoices.Total

                              };


                if (!string.IsNullOrEmpty(name))
                {
                    results = results.Where(x => x.StudentName.Contains(name));
                }


                return results.ToList();


            }
        }
        public List<InvoiceInfo> InvoiceInClass(DateTime startTime, string courseCode, int instructorID)
        {

            using (var context = new PianoPlusContext())
            {
                var results = from invoices in context.Payments
                              join studentClasses in context.StudentClasses on invoices.StudentID equals studentClasses.StudentID
                              where studentClasses.StartTime == startTime
                              && studentClasses.CourseCode == courseCode
                              && studentClasses.InstructorID == instructorID
                              orderby invoices.Student.LastName, invoices.Student.FirstName
                              select new InvoiceInfo()
                              {
                                  PaymentID = invoices.PaymentID,
                                  InstructorName = invoices.Instructor.FirstName + " " + invoices.Instructor.LastName,
                                  StudentName = invoices.Student.FirstName + " " + invoices.Student.LastName,
                                  Total = invoices.Total

                              };


                return results.ToList();


            }
        }


        }
}
