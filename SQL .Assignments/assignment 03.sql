-- Scenario:
-- Imagine a database for a university with three tables: Students, Courses, and Enrollments. The tables have the following structures:

-- Students table:
-- StudentID (integer, primary key)
-- FirstName (varchar)
-- LastName (varchar)
-- BirthDate (date)

-- Courses table:
-- CourseID (integer, primary key)
-- CourseName (varchar)
-- Instructor (varchar)
-- Credits (integer)

-- Enrollments table:
-- EnrollmentID (integer, primary key)
-- StudentID (integer, foreign key referencing Students table)
-- CourseID (integer, foreign key referencing Courses table)
-- EnrollmentDate (date)

-- ==============================================================
create database university ;
create table students(
studentid int primary key,
firstname varchar(100),
lastname varchar(100),
birthdate date);
create table courses(
courseId int primary key,
Coursename varchar(100),
Instructor varchar(100),
Creditd int);
create table enrollments(
EnrollmentID int primary key,
studentid int,
courseId int,
EnrollmentDate date,
foreign key (studentid) references students(studentid),
foreign key (courseId) references courses(courseId));
-- ==============================================================
 -- TASKS
--  Q.1 Insert Data:
-- Insert a new student with the following details:
-- StudentID: 301
-- FirstName: 'Alice'
-- LastName: 'Johnson'
-- BirthDate: '1995-08-15'
-- ==============================================================
insert INTO STUDENTS VALUES(301,"alice","johnson","1995-08-15");
insert INTO STUDENTS VALUES(302,"tony","robert","1984-05-12");
insert INTO STUDENTS VALUES(303,"steve","roggers","1998-01-25");
insert INTO STUDENTS VALUES(304,"tom","holland","1989-07-02");
insert INTO STUDENTS VALUES(305,"bruce","banner","1999-12-29");

-- ==============================================================
insert into courses values(201,"Python","Prof.Sujeet",9);
insert into courses values(202,"Java","Prof.SUMIT",8);
insert into courses values(203,"DJango","Prof.Pankaj",9);
-- ==============================================================
insert into enrollments values(1101,301,201,"2025-04-28");
insert into enrollments values(1102,302,202,"2023-04-12");
insert into enrollments values(1103,303,203,"2022-04-25");
insert into enrollments values(1104,304,202,"2026-04-27");
-- ==============================================================
-- Q.2 Update Data:
-- Update the instructor of the course with CourseID 201 to 'Professor Smith'.
-- ==============================================================
update COURSES SET instructor='Professor Smith' WHERE courseId=201;

-- ==============================================================
-- Q.3 Delete all enrollments for the student with StudentID 301.
-- ==============================================================
delete enrollments from enrollments  where studentid =301;
-- ==============================================================
-- Q.4 Write a SELECT query to retrieve the names of students who have enrolled in the course with CourseID 201, including their course enrollment date.
-- ==============================================================
select s.firstname,
s.lastname,
e.EnrollmentDate
from students s left join enrollments e on s.studentid=e.studentid where e.courseId=201;
