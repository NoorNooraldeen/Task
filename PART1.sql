--create table student
create table Students
(
StudentId int primary key not null identity(1,1),
StudentName nvarchar(100) not null,
StudentAge int not null,
StudentEmail nvarchar(100)
)

--create table course 
create table Courses
(
CourseId int primary key not null identity(1,1),
CourseName nvarchar(50) not null,
StudId int foreign key references Students(StudentId)
)
--2

INSERT INTO Students
VALUES
('Ahmad Damra', 21, 'ahmad.damra@outlook.com'),
('Maryam Ramy', 23, 'maryam@gmail.com'),
('Mesaad Eyad', 20, 'mesaad@hotmail.com')

--3
INSERT INTO Courses  
VALUES
('Mathematics', 1),
('Physics', 1),
('Chemistry', 2),
('Arabic', 3),
('Engenerring', 3);
---------------------------------------------------------------------
--4
Select * 
from Students;
Select * 
from Courses;
--SELECT
--s.Name, c.CourseName
--FROM Student s
--join Courses c ON s.StudentID = c.StudentID;
---------------------------------------------------------------------
--5

update Students
set StudentEmail = 'TheOneandOnly@gmail.com'
where StudentId = 1
----------------------------------------------------------------------
--6
delete Courses
where StudId = 3
-------------------------------------------------------
--7 
ALTER TABLE Students
ADD Gender nvarchar(30)
----------------------------------------------------------------
--8
update Students
SET Gender =  'MALE'

--9

select stu.StudentName as 'Student Name', count(stu.StudentId) as 'The Number of Courses'
From Students as stu join Courses as cou
on stu.StudentId = cou.StudId
group by stu.StudentName

--10
SELECT *
FROM Students
WHERE StudentName like 'M%'

--11

SELECT 
 UPPER(StudentName) as Uppear
FROM Students


--12
select
 LOWER(CourseName) AS lower
FROM Courses

--15
Insert into Students
values
('Mohammad Arab', 35, 'mohammad@outlook.com','Male')
---------------------------------------------------------------------
 --16

 INSERT INTO Students  VALUES ('Sarah Adam', 22, 'sarah@outlook.com', 'Female');

INSERT INTO Courses  VALUES
('PE', 1),
('History', 2 )
-------------------------------------------------------------------------
--17
SELECT *
FROM Students
ORDER BY StudentAge ASC

--------------------------------------------------------------------
--18
DELETE FROM Students
WHERE StudentId = 2

delete from Students
where StudentId= 2;
delete from dbo.Courses
where StudId = 2;
-----------------------------------------------------------------------
SELECT 
CourseName
FROM Courses
ORDER BY CourseName ASC

---------------------------------------------

Select *
from Courses
order by CourseName
------------------------------------------------------------------------

create proc sp_DisplayAll
as
begin
Select st.StudentName as 'Student Name', cr.CourseName 'Course Name'
From Students as st 
join Courses as cr
on st.StudentId = cr.StudId
end;

exec sp_DisplayAll

create proc sp_DisplayAllId
@id int
as
begin
Select st.StudentName as 'Student Name', cr.CourseName 'Course Name'
From Students as st 
join Courses as cr
on st.StudentId = cr.StudId
where st.StudentId = @id
end

exec sp_DisplayAllId @id = 1

create table StudentB(
StudentId int primary key not null identity(1,1),
StudentName nvarchar(100) not null,
StudentAge int not null,
StudentEmail nvarchar(80)
)


create table CoursesB(
CorsId int primary key not null identity(1,1),
CorsName nvarchar(50) not null
)


create table EnrollmentB(
EnrolllId int primary key not null identity(1,1),
StudId int foreign key references StudentB(studentId),
CorId int foreign key references Coursesb(CorsId)
)








