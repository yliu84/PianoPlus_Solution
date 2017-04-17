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
        public bool AddNewTransaction(Transaction transaction)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.Transactions.Add(transaction);
                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        //public Transaction GetTransactionInfoByID(int paymentid)
        //{
        //    Transaction CurrentTransactionPayment = new Transaction();

        //    try
        //    {
        //        using (var context = new PianoPlusContext())
        //        {
        //            var results = (from info in context.Transactions
        //                           where info.PaymentID == paymentid
        //                           select info
        //                           ).SingleOrDefault();

        //            return results;

        //        }
        //    }
        //    catch
        //    {
        //        return CurrentTransactionPayment;
        //    }
        //}

        public Account GetPaymentByStudentID(int studentID)
        {
            Account StudentAccount = new Account();

            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Accounts
                                   where info.StudentID == studentID
                                   select info
                                   ).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return StudentAccount;
            }
        }

        public InvoiceInfo GetInvoiceInfoByStudent(int studentid)
        {
            InvoiceInfo CurrentInvoice = new InvoiceInfo();


            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from account in context.Accounts
                                   join tran in context.Transactions on account.AccountID equals tran.AccountID
                                   join instr in context.Instructors on tran.InstructorID equals instr.InstructorID
                                   join stud in context.Students on account.StudentID equals stud.StudentID
                                   where account.StudentID == studentid
                                   select new InvoiceInfo()
                                   {
                                       PaymentID = account.AccountID,
                                       InstructorName = tran.Instructor.FirstName + " " + tran.Instructor.LastName,
                                       StudentName = account.Student.FirstName + " " + account.Student.LastName,
                                       Total = account.Total
                                   }).SingleOrDefault();

                    return results;

                }
            }
            catch
            {
                return CurrentInvoice;
            }
        }

        //public List<InvoiceInfo> InvoiceListByStudentID(int studentID)
        //{

        //    using (var context = new PianoPlusContext())
        //    {
        //        var results = (from account in context.Accounts
        //                       join tran in context.Transactions on account.AccountID equals tran.AccountID
        //                       //join instr in context.Instructors on tran.InstructorID equals instr.InstructorID
        //                       //join stud in context.Students on account.StudentID equals stud.StudentID
        //                       where account.StudentID == studentID
        //                       select new List<InvoiceInfo>()
        //                       {
        //                           account.Transactions
        //                       }).SingleOrDefault();


        //        //if (!string.IsNullOrEmpty(name))
        //        //{
        //        //    results = results.Where(x => x.StudentName.Contains(name));
        //        //}


        //        return results.ToList();


        //    }
        //}
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
