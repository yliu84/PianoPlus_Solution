/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PianoPlus_System')
BEGIN
	ALTER DATABASE [PianoPlus_System] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [PianoPlus_System] SET ONLINE;
	DROP DATABASE [PianoPlus_System];
END

GO

/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE PianoPlus_System;
GO

USE PianoPlus_System;
GO

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE Student
(
	StudentID
	INT Identity(2000,1) 
	NOT NULL
	CONSTRAINT PK_Student_StudentID PRIMARY KEY CLUSTERED,

	FirstName
	NVARCHAR(25)
	NOT NULL,

	LastName
	NVARCHAR(25)
	NOT NULL,

	Email
	NVARCHAR(60)
	NOT NULL,

	Phone
	NVARCHAR(14)
	NOT NULL,

	Address
	NVARCHAR(100)
	NOT NULL,

	Province
	NVARCHAR(15)
	NOT NULL,

	City
	NVARCHAR(15)
	NOT NULL,

	PostalCode
	NVARCHAR(7)
	NOT NULL,

	Active
	CHAR(1) DEFAULT 'Y'
	NOT NULL
	CONSTRAINT CK_Student_Active CHECK(Active = 'Y' OR Active = 'N'),

	PassHash
	NVARCHAR(128)
	NOT NULL,

	PassSalt
	NVARCHAR(128)
	NOT NULL,

	CreateDate
	DATETIME DEFAULT GetDate()
	NOT NULL

)
GO

CREATE TABLE Role
(
	RoleID
	NVARCHAR(3)
	NOT NULL
	CONSTRAINT PK_Role_RoleID PRIMARY KEY CLUSTERED,

	Description
	NVARCHAR(25)
	NOT NULL

)
Go

CREATE TABLE Instructor
(
	InstructorID
	INT IDENTITY(2000,1)
	NOT NULL
	CONSTRAINT PK_Instrutor_InstructorID PRIMARY KEY CLUSTERED,

	RoleID
	NVARCHAR(3)
	NOT NULL
	CONSTRAINT FK_Instructor_RoleID REFERENCES Role(RoleID),

	FirstName
	NVARCHAR(25)
	NOT NULL,

	LastName
	NVARCHAR(25)
	NOT NULL,

	Email
	NVARCHAR(60)
	NOT NULL,

	Phone
	NVARCHAR(14)
	NOT NULL,

	Address
	NVARCHAR(100)
	NOT NULL,

	Province
	NVARCHAR(15)
	NOT NULL,

	City
	NVARCHAR(15)
	NOT NULL,

	PostalCode
	NVARCHAR(7)
	NOT NULL,

	Active
	CHAR(1) DEFAULT 'Y'
	NOT NULL
	CONSTRAINT CK_Instructor_Active CHECK(Active = 'Y' OR Active = 'N'),

	PassHash
	NVARCHAR(128)
	NOT NULL,

	PassSalt
	NVARCHAR(128)
	NOT NULL,

	CreateDate
	DATETIME DEFAULT GetDate()
	NOT NULL
)
GO

CREATE TABLE Course
(
	CourseCode
	NVARCHAR(6)
	NOT NULL
	CONSTRAINT PK_Course_CourseCode PRIMARY KEY CLUSTERED,

	InstructorID
	INT
	NOT NULL
	CONSTRAINT FK_Course_Instructor REFERENCES Instructor(InstructorID),

	LessonType
	NVARCHAR(15)
	NOT NULL,

	LessonName
	NVARCHAR(25)
	NOT NULL,

	Active
	CHAR(1) DEFAULT 'Y'
	NOT NULL
	CONSTRAINT CK_Course_Active CHECK(Active = 'Y' OR Active = 'N'),

	TotalSeats
	INT DEFAULT 1
	NOT NULL

)
GO

CREATE TABLE StudentClass
(
	StudentID
	INT 
	NOT NULL
	CONSTRAINT FK_StudentClass_StudentID REFERENCES Student(StudentID),

	CourseCode
	NVARCHAR(6)
	NOT NULL
	CONSTRAINT FK_StudentClass_CourseCode REFERENCES Course(CourseCode),

	StartDate
	DATETIME
	NOT NULL,

	StartTime
	DATETIME
	NOT NULL,

	EndTime
	DATETIME
	NOT NULL,

	DayOfWeek
	NVARCHAR(15)
	NOT NULL,

	Hours
	FLOAT
	NOT NULL
	CONSTRAINT CK_StudentClass_Hours CHECK (Hours > 0),

	Room
	NVARCHAR(10)
	NULL,

	Complete
	CHAR(1) DEFAULT 'N'
	NOT NULL
	CONSTRAINT CK_StudentClass_Complete CHECK(Complete = 'Y' OR Complete = 'N'),

	CONSTRAINT PK_StudentClass_StudentID_CourseCode_StartDate PRIMARY KEY(StudentID,CourseCode,StartDate)
)

CREATE TABLE ClassHistory
(
	StudentID
	INT 
	NOT NULL
	CONSTRAINT FK_ClassHistory_StudentID REFERENCES Student(StudentID),

	CourseCode
	NVARCHAR(6)
	NOT NULL
	CONSTRAINT FK_ClassHistory_CourseCode REFERENCES Course(CourseCode),

	StartDate
	DATETIME
	NOT NULL,

	StartTime
	DATETIME
	NOT NULL,

	EndTime
	DATETIME
	NOT NULL,

	DayOfWeek
	NVARCHAR(15)
	NOT NULL,

	Hours
	FLOAT
	NOT NULL
	CONSTRAINT CK_ClassHistory_Hours CHECK (Hours > 0),

	Room
	NVARCHAR(10)
	NULL,

	CONSTRAINT PK_ClassHistory_StudentID_CourseCode_StartDate PRIMARY KEY(StudentID,CourseCode,StartDate)
)
GO

CREATE TABLE Blog
(
	BlogID
	INT IDENTITY(1,1)
	NOT NULL
	CONSTRAINT PK_Post_PostID PRIMARY KEY CLUSTERED,

	InstructorID
	INT
	NOT NULl
	CONSTRAINT FK_Post_InstructorID REFERENCES Instructor(InstructorID),

	PostDate
	DATETIME DEFAULT GetDate()
	NOT NULL,

	Content
	NVARCHAR(500)
	NOT NULL,

	Title
	NVARCHAR(50)
	NOT NULL

)

CREATE Table Announcement
(
	AnnouncementID
	INT IDENTITY(1,1)
	NOT NULL
	CONSTRAINT PK_Announcement_AnnouncementID PRIMARY KEY CLUSTERED,

	InstructorID
	INT
	NOT NULl
	CONSTRAINT FK_Announcement_InstructorID REFERENCES Instructor(InstructorID),

	PostDate
	DATETIME DEFAULT GetDate()
	NOT NULL,

	Message
	NVARCHAR(200)
	NOT NULL

)
GO

CREATE TABLE Payment
(
	PaymentID
	INT IDENTITY(1,1)
	NOT NULL
	CONSTRAINT PK_Payment_PaymentID PRIMARY KEY CLUSTERED,

	InstructorID
	INT
	NOT NULl
	CONSTRAINT FK_Payment_InstructorID REFERENCES Instructor(InstructorID),

	StudentID
	INT 
	NOT NULL
	CONSTRAINT FK_Payment_StudentID REFERENCES Student(StudentID),

	Total
	MONEY DEFAULT 0.00
	NOT NULL
	CONSTRAINT CK_Payment_Total CHECK(Total >= 0),

	PaidTime
	DATETIME
	NOT NULL

)

CREATE TABLE StudentPayment
(
	PaymentID
	INT
	NOT NULL
	CONSTRAINT FK_StudentPayment_PaymentID REFERENCES Payment(PaymentID),

	CourseCode
	NVARCHAR(6)
	NOT NULL
	CONSTRAINT FK_StudentPayment_CourseCode REFERENCES Course(CourseCode),

	Hours
	FLOAT DEFAULT 0.0
	NOT NULL
	CONSTRAINT CK_StudentPayment_Hours CHECK (Hours >= 0),

	LessionFee
	MONEY DEFAULT 0.00
	NOT NULL
	CONSTRAINT CK_StudentPayment_LessionFee CHECK (LessionFee >= 0.00),

	CONSTRAINT PK_StudentPayment_PaymentID_CourseCode PRIMARY KEY (PaymentID,CourseCode)

)

