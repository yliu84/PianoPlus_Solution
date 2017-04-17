using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using PianoPlus_Data.Entities;

namespace PianoPlus_Data
{
    
    public partial class PianoPlusContext : DbContext
    {
        public PianoPlusContext()
            : base("name=PianoPlusDB")
        {
        }
        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Announcement> Announcements { get; set; }
        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<CoursePayment> CoursePayments { get; set; }
        public virtual DbSet<Events> Events { get; set; }
        public virtual DbSet<Instructor> Instructors { get; set; }
        public virtual DbSet<InstructorClassHistory> InstructorClassHistories { get; set; }
        public virtual DbSet<PasswordRequest> PasswordRequests { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<StudentClass> StudentClasses { get; set; }
        public virtual DbSet<StudentClassHistory> StudentClassHistories { get; set; }
        public virtual DbSet<Transaction> Transactions { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
                .Property(e => e.Total)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Transactions)
                .WithRequired(e => e.Account)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Course>()
                .Property(e => e.Active)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Course>()
                .HasMany(e => e.CoursePayments)
                .WithRequired(e => e.Course)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Course>()
                .HasMany(e => e.StudentClasses)
                .WithRequired(e => e.Course)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CoursePayment>()
                .Property(e => e.LessonFee)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Instructor>()
                .Property(e => e.Active)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Instructor>()
                .HasMany(e => e.Announcements)
                .WithRequired(e => e.Instructor)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Instructor>()
                .HasMany(e => e.Blogs)
                .WithRequired(e => e.Instructor)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Instructor>()
                .HasMany(e => e.StudentClasses)
                .WithRequired(e => e.Instructor)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Instructor>()
                .HasMany(e => e.InstructorClassHistories)
                .WithRequired(e => e.Instructor)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Instructor>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.Instructor)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PasswordRequest>()
                .Property(e => e.RequestToken)
                .IsUnicode(false);

            modelBuilder.Entity<Payment>()
                .Property(e => e.Total)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Payment>()
                .HasMany(e => e.CoursePayments)
                .WithRequired(e => e.Payment)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Instructors)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Student>()
                .Property(e => e.Active)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Student>()
                .HasMany(e => e.InstructorClassHistories)
                .WithRequired(e => e.Student)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Student>()
                .HasMany(e => e.Payments)
                .WithRequired(e => e.Student)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Student>()
                .HasMany(e => e.Accounts)
                .WithRequired(e => e.Student)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Student>()
                .HasMany(e => e.StudentClasses)
                .WithRequired(e => e.Student)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Student>()
                .HasMany(e => e.StudentClassHistories)
                .WithRequired(e => e.Student)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Transaction>()
                .Property(e => e.LessonAmount)
                .HasPrecision(19, 4);
        }
    }
}
