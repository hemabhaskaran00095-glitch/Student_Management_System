-- Create database called "student_management_system"--
create database student_management_system;
use student_management_system;
-- Create the 'grade' table-- 
create table grade
(
gradeID int primary key auto_increment, grade varchar (20)
);

-- Create the 'students' table-- 
create table student
(
studentID int primary key auto_increment, first_name varchar (20), last_name varchar(20),
gender varchar (5) not null, age int, check (age>=18), location varchar (20) default "TN",
gradeID int,
foreign key (gradeID)
references grade (gradeID)
);

-- Create the 'instructors' table-- 
create table instructors
 (
 instructorsID int primary key auto_increment, instructors_name varchar (20)
 );
 
 -- Create the 'course' table-- 
create table course
(
courseID int primary key auto_increment, course_name varchar (20) not null, instructorsID int,
foreign key (instructorsID)
references instructors (instructorsID)
);

-- Create the 'enrollments' table-- 
create table enrollments
(
enrollmentsID int primary key auto_increment, enrollments int unique, studentID int,
foreign key (studentID)
references student (studentID)
);

-- Value insertion in grade table-- 
insert into grade (grade) values
 ("A++"),
 ("A+"),
 ("A"),
 ("B++"),
 ("B+"),
 ("B"),
 ("C++"),
 ("C+"),
 ("C");
 
 -- Value insertion in student table-- 
 insert into student (first_name, last_name, gender, age, location, gradeID) values
 ("Hema", "Bhasekaran", "F", 19, "Pattukottai", "2"),
 ("Ajith", "Kumar", "M", 18, "Chennai", "6"),
 ("Kavin", "Rosan", "F", 19, "Velur", "3"),
 ("Divya", "Sri", "F", 18, "Velur", "5"),
 ("Selvi", "Subbu", "F", 19, "Thirunelveli", "4"),
 ("Pavitha", "Rraj", "F", 19, "Erode", "7"),
 ("Hari", "Haran", "M", 19, "Pattukkottai", "1"),
 ("Veda", "Valli", "F", 18, "Nellai", "8"),
 ("Hari", "Haran", "M", 19, "Nagur", "2"),
 ("Sari", "Kumar", "M", 18, "Kadalur", "9");
 
 -- Value insertion in instructors table-- 
 insert into instructors (instructors_name) values
 ("Sabari"),
 ("Babu"),
 ("Gowtham"),
 ("Gukan"),
 ("Karthi");
 
 -- Value insertion in course table-- 
 insert into course (course_name, instructorsID) values
 ("Python", 1),
 ("SQL", 2),
 ("PowerBI", 3),
 ("Java", 5),
 ("Data Science", 1),
 ("loud Computing", 4),
("UI/UX Design", 2);

-- Value insertion in enrollments table-- 
 insert into enrollments (studentID, enrollments) values
 (1, 20241214),
 (2, 20241124),
 (3, 20241001),
 (4, 20241229),
 (5, 20241107),
(6, 20241111),
(7, 20241112),
(8, 20241230),
(9, 20241222), 
 (10, 20241220);
  -- To retrieve all the tables-- 
 select*from grade;
 select*from student;
 select*from instructors;
 select*from course;
 select*from enrollments;
 
 -- For query purpose -- 
 insert into enrollments (enrollments) values
(20240910),
(20241215),
(20241212);

 insert into grade (grade) values
 ("D++"),
 ("D+"),
 ("D");
 
# Query 1: Retrieve female gender in student table 
 select first_name, gender from student where gender="F";
 
#Query 2: Retrieve the student and the along with the grade
select s.studentID, s.first_name, s.last_name, g.grade
from grade as g
inner join student as s on s.gradeID=g.gradeID;

#Query 3: Retrieve the course and the along with the instructors
select c.course_name, i.instructors_name, i.instructorsID
from instructors as i
right join course as c on c.instructorsID=i.instructorsID;

#Query 4: Retrieve the enrollments and the along with the student
select s.first_name, s.studentID, e.enrollments
from student as s
left join enrollments as e on e.studentID=s.studentID;

#Query 5: List the student names and their respective gradeID in descending order of grade
select studentID, first_name, gender from student order by gradeID desc;

#Query 6: Display the total count of course in each instructors
select instructorsID, count(courseID) from course
group by instructorsID;

#Query 7: Retrieves all columns for students whose age matches the minimum age
select * from student where age=(select min(age) from student);

-- Altering--
alter table student change first_name given_name varchar (20);
alter table student change last_name family_name varchar (20);
alter table student rename student_table;

-- Updateing--
update student set location="chennai" where studentID=1;
update course set course_name="Java" where courseID=5;

-- Change "M" as "Mele" and "F" as "Female"--
select gender,case
when gender="M" then "Male"
else "Female"
end as gerder
from student;
