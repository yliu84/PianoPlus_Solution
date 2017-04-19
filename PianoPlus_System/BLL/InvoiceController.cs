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
    public class InvoiceController
    {
        public bool AddNewTransaction(Transaction transaction)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    Account account = context.Accounts.Find(transaction.AccountID);

                    account.Total += transaction.LessonAmount;

                    var update = context.Entry(context.Accounts.Attach(account));
                    update.Property(x => x.Total).IsModified = true;

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

        public int GetAccountIDByStudentID(int studentID)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from info in context.Accounts
                                   where info.StudentID == studentID
                                   select new
                                   {
                                        AccountID = info.AccountID
                                   }).SingleOrDefault();

                    return results.AccountID;

                }
            }
            catch
            {
                return -1;
            }

        }
        public AccountInfo GetAccountInfoByStudentID(int studentID)
        {
            AccountInfo studentAccount = null;
            using (var context = new PianoPlusContext())
            {
                var results = (from info in context.Accounts
                                where info.StudentID == studentID
                                join stud in context.Students on info.StudentID equals stud.StudentID
                                select new AccountInfo()
                                {
                                    AccountID = info.AccountID,
                                    StudentID = info.StudentID,
                                    StudentFullName = stud.FirstName + " " + stud.LastName,
                                    AccountTotal = info.Total
                                }).SingleOrDefault();
                studentAccount = results;

            }
            studentAccount.TransactionList = GetInvoiceInfoByStudentID(studentID);
            
            return studentAccount;
        }

        public List<TransactionInfo> GetInvoiceInfoByStudentID(int studentid)
        {
            List<TransactionInfo> CurrentInvoice = null;


            try
            {
                using (var context = new PianoPlusContext())
                {
                    var results = (from account in context.Accounts
                                   join tran in context.Transactions on account.AccountID equals tran.AccountID
                                   join instr in context.Instructors on tran.InstructorID equals instr.InstructorID
                                   join stud in context.Students on account.StudentID equals stud.StudentID
                                   join course in context.Courses on tran.CourseCode equals course.CourseCode
                                   where account.StudentID == studentid
                                   select new TransactionInfo()
                                   {
                                       TransactionID = tran.TransactionID,
                                       CourseCode = tran.CourseCode,
                                       CourseDescription = course.CourseName,
                                       InstructorID = instr.InstructorID,
                                       LessonTotal = tran.LessonAmount,
                                       TransactionDate = tran.TransactionDate,
                                       Hours = tran.Hours,
                                       InstructFullName = instr.FirstName + " " + instr.LastName                                       

                                   });

                    return results.ToList();

                }
            }
            catch
            {
                return CurrentInvoice;
            }
        }

        public List<TransactionInfo> Transaction_List(int accountId)
        {
            using(var context = new PianoPlusContext())
            {
                var result = from t in context.Transactions
                             where t.AccountID == accountId
                             select new TransactionInfo()
                             {
                                 TransactionID = t.TransactionID,
                                 CourseDescription = t.Course.CourseName,
                                 InstructFullName = t.Instructor.FirstName + " " + t.Instructor.LastName,
                                 Hours = t.Hours,
                                 LessonTotal = t.LessonAmount,
                                 TransactionDate = t.TransactionDate,
                             };

                return result.ToList();
            }
        }


        public List<AccountInfo> Account_List(string name)
        {
            using(var context = new PianoPlusContext())
            {
                var results = from a in context.Accounts
                             orderby a.StudentID
                             select new AccountInfo()
                             {
                                 AccountID = a.AccountID,
                                 StudentID = a.StudentID,
                                 StudentFullName = a.Student.FirstName +" "+ a.Student.LastName,
                                 AccountTotal = a.Total
                             };

                if (!string.IsNullOrEmpty(name))
                {
                    results = results.Where(x => x.StudentFullName.Contains(name));
                }

                return results.ToList();
            }
        }
    }
}
