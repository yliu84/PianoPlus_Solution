INSERT INTO Role (RoleID,Description)
VALUES ('INS','Instructor')

INSERT INTO Role (RoleID,Description)
VALUES ('Adm','Administrator')

INSERT INTO Instructor (RoleID,FirstName,LastName,Email,Phone,Address,Province,City,PostalCode,Active,PassHash,PassSalt,CreateDate)
VALUES ('Adm','Yang','Liu','admin@gmail.com','707080127','10047 108 St','AB','Edmonton','T5J 0B6','Y','1662743549E1C363A30E21FD624DBB8E','ZHpjNOJchhFUHgRuqDTTBA==','2017-01-29')

INSERT INTO Student(FirstName,LastName,Email,Phone,Address,Province,City,PostalCode,Active,PassHash,PassSalt,CreateDate)
VALUES ('Test1','Student','test1@gmail.com','707080127','10047 108 St','AB','Edmonton','T5J 0B6','Y','1662743549E1C363A30E21FD624DBB8E','ZHpjNOJchhFUHgRuqDTTBA==','2017-01-29')

INSERT INTO Student(FirstName,LastName,Email,Phone,Address,Province,City,PostalCode,Active,PassHash,PassSalt,CreateDate)
VALUES ('Test2','Student','test2@gmail.com','707080127','10047 108 St','AB','Edmonton','T5J 0B6','Y','1662743549E1C363A30E21FD624DBB8E','ZHpjNOJchhFUHgRuqDTTBA==','2017-01-29')

INSERT INTO Student(FirstName,LastName,Email,Phone,Address,Province,City,PostalCode,Active,PassHash,PassSalt,CreateDate)
VALUES ('Test3','Student','test3@gmail.com','707080127','10047 108 St','AB','Edmonton','T5J 0B6','Y','1662743549E1C363A30E21FD624DBB8E','ZHpjNOJchhFUHgRuqDTTBA==','2017-01-29')

INSERT INTO Student(FirstName,LastName,Email,Phone,Address,Province,City,PostalCode,Active,PassHash,PassSalt,CreateDate)
VALUES ('Test4','Student','test4@gmail.com','707080127','10047 108 St','AB','Edmonton','T5J 0B6','Y','1662743549E1C363A30E21FD624DBB8E','ZHpjNOJchhFUHgRuqDTTBA==','2017-01-29')

INSERT INTO Events (InstructorID, Title, Description, StartAt, EndAt, IsFullDay)
VALUES (2000,'Appointment','I have a appointment with Tom','2017/02/20 13:00:00','2017/02/20 14:00:00', 0)

INSERT INTO Events (InstructorID, Title, Description, StartAt, EndAt, IsFullDay)
VALUES (2000,'Birth Day','Today is my birth day','2017/02/22','2017/02/22', 1)
