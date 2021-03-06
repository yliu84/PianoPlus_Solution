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
	UNIQUE
	NOT NULL,

	Phone
	NVARCHAR(14)
	NOT NULL,

	BirthDay
	DATE
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

	ProfileImage
	varbinary(MAX)
	NULL,

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
	UNIQUE
	NOT NULL,

	Phone
	NVARCHAR(14)
	NOT NULL,

	BirthDay
	DATE
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

	ProfileImage
	varbinary(MAX)
	NULL,

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

	CourseType
	NVARCHAR(15)
	NOT NULL,

	CourseName
	NVARCHAR(50)
	NOT NULL,

	Active
	CHAR(1) DEFAULT 'Y'
	NOT NULL
	CONSTRAINT CK_Course_Active CHECK(Active = 'Y' OR Active = 'N'),

	TotalSeats
	INT DEFAULT 1
	NOT NULL
	CONSTRAINT CK_Course_TotalSeats CHECK(TotalSeats > 0)
)
GO


CREATE TABLE StudentClass
(
	StudentID
	INT 
	NOT NULL
	CONSTRAINT FK_StudentClass_StudentID REFERENCES Student(StudentID),

	InstructorID
	INT
	NOT NULL
	CONSTRAINT FK_StudentClass_Instructor REFERENCES Instructor(InstructorID),

	CourseCode
	NVARCHAR(6)
	NOT NULL
	CONSTRAINT FK_StudentClass_CourseCode REFERENCES Course(CourseCode),

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
	CONSTRAINT CK_StudentClass_Hours CHECK (Hours > 0 and Hours <= 5),

	Room
	NVARCHAR(10)
	NOT NULL,

	CONSTRAINT CK_StudentClass_EndTime CHECK(EndTime > StartTime),
	CONSTRAINT PK_StudentClass_StudentID_CourseCode_StartDate PRIMARY KEY(StudentID,CourseCode,StartTime,InstructorID)
)

CREATE TABLE StudentClassHistory
(
	StartTime
	DATETIME
	NOT NULL,

	StudentID
	INT 
	NOT NULL
	CONSTRAINT FK_StudentClassHistory_StudentID REFERENCES Student(StudentID),

	CourseName
	NVARCHAR(25)
	NOT NULL,

	InstructorName
	NVARCHAR(51)
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
	CONSTRAINT CK_StudentClassHistory_Hours CHECK (Hours > 0 and Hours <= 5),

	Room
	NVARCHAR(10)
	NOT NULL,

	CONSTRAINT CK_StudentClassHistory_EndTime CHECK(EndTime > StartTime),
	CONSTRAINT PK_StudentClassHistory_StartTime_StudentID PRIMARY KEY(StartTime, StudentID)
)
GO

CREATE TABLE InstructorClassHistory
(
	InstructorID
	INT
	NOT NULL
	CONSTRAINT FK_InstructorClassHistory_InstructorID REFERENCES Instructor(InstructorID),

	StudentID
	INT
	NOT NULL
	CONSTRAINT FK_InstructorClassHistory_StudentID REFERENCES Student(StudentID),

	CourseName
	NVARCHAR(25)
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
	CONSTRAINT CK_InstructorClassHistory_Hours CHECK(Hours > 0 and Hours <= 5),

	Room
	NVARCHAR(10)
	NOT NULL,
	
	CONSTRAINT CK_InstructorClassHistory_EndTime CHECK(EndTime > StartTime),
	CONSTRAINT PK_InstructorClassHistory_StudentID_StartTime PRIMARY KEY(StartTime,InstructorID, StudentID)
)

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
	NVARCHAR(MAX)
	NOT NULL,

	Title
	NVARCHAR(200)
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

CREATE TABLE Account
(
	AccountID
	INT IDENTITY(1,1)
	NOT NULL
	CONSTRAINT PK_Account_AccountID PRIMARY KEY CLUSTERED,
	
	StudentID
	INT UNIQUE
	NOT NULL
	CONSTRAINT FK_Account_StudentID REFERENCES Student(StudentID),

	Total
	MONEY DEFAULT 0.00
	NOT NULL
	CONSTRAINT CK_Account_Total CHECK(Total >= 0)
	
)
GO

CREATE TABLE Transactions
(
	TransactionID
	INT IDENTITY(500000, 1)
	NOT NULL
	CONSTRAINT PK_Transaction_TransactionID PRIMARY KEY CLUSTERED,

	AccountID
	INT
	NOT NULL
	CONSTRAINT FK_Transactions_PaymentID REFERENCES Account(AccountID),

	CourseCode
	NVARCHAR(6)
	NOT NULL
	CONSTRAINT FK_Transactions_CourseCode REFERENCES Course(CourseCode),

	InstructorID
	INT
	NOT NULL
	CONSTRAINT FK_Transactions_InstructorID REFERENCES Instructor(InstructorID),

	Hours
	FLOAT DEFAULT 0.0
	NOT NULL
	CONSTRAINT CK_Transactions_Hours CHECK (Hours >= 0),

	LessonAmount
	MONEY DEFAULT 0.00
	NOT NULL
	CONSTRAINT CK_Transactions_LessonAmount CHECK (LessonAmount >= 0.00),

	TransactionDate
	DATETIME
	NOT NULL

	
)

CREATE TABLE Events
(
	EventID
	INT IDENTITY(1,1)
	NOT NULL
	CONSTRAINT PK_Events_EventID PRIMARY KEY CLUSTERED,

	InstructorID
	INT
	NOT NULL
	CONSTRAINT FK_Events_InstructorID REFERENCES Instructor(InstructorID),

	Title
	NVARCHAR(25)
	NOT NULL,

	Description
	NVARCHAR(200)
	NULL,

	StartAt
	DATETIME
	NOT NULL,

	EndAt
	DATETIME
	NOT NULL,

	IsFullDay
	BIT
	NOT NULL,

	CONSTRAINT CK_Events_EndTime CHECK(EndAt >= StartAt)

)

CREATE TABLE PasswordRequests
(
	RequestToken
	VARCHAR(128)
	NOT NULL
	CONSTRAINT PK_PasswordRequests_RequestID PRIMARY KEY CLUSTERED,

	StudentID
	INT
	NULL
	CONSTRAINT FK_PasswordRequests_StudentID REFERENCES Student(StudentID),

	InstructorID
	INT
	NULL
	CONSTRAINT FK_PasswordRequests_InstructorID REFERENCES Instructor(InstructorID),

	Email
	VARCHAR(60)
	NOT NULL,
		
	CreateDate
	DATETIME DEFAULT GetDate()
	NOT NULL,

	Active
	CHAR(1) DEFAULT 'Y'
	CONSTRAINT CK_PasswordRequest_Active CHECK(Active = 'Y' OR Active = 'N')
	NOT NULL
)