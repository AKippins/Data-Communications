--Students Table
drop table if exists students cascade;
create table if not exists students
(
studentid serial not null,
studentname text not null,
primary key(studentid)
);

-- Teachers Table 
drop table if exists teachers cascade;
create table if not exists teachers
(
teacherid serial not null,
teachername text not null,
primary key(teacherid)
);

--Subjects Table
drop table if exists subjects cascade;
create table if not exists subjects
(
subjectid serial not null,
subjectname text not null,
primary key(subjectid)
);

--Grades Table
drop table if exists grades;
create table if not exists grades
(
studentid int  not null references students (studentid),
teacherid int  not null references teachers (teacherid),
subjectid int  not null references subjects (subjectid),
grade     text not null
);

--Student Data being inserted here 
insert into students(studentname)
	values('Simon');
	
insert into students(studentname)
	values('Alvin');
	
insert into students(studentname)
	values('Theo');
	
insert into students(studentname)
	values('Brittany');
	
insert into students(studentname)
	values('Janette');
	
insert into students(studentname)
	values('Elanor');
	
insert into students(studentname)
	values('Stu');
	

--Teacher Data being inserted here
insert into teachers(teachername)
	values('Washington');
	
insert into teachers(teachername)
	values('Adams');
	
insert into teachers(teachername)
	values('Jefferson');
	
insert into teachers(teachername)
	values('Lincoln');
	
	
--Subjects Data being inserted here 
insert into subjects(subjectname)
	values('History');
	
insert into subjects(subjectname)
	values('Biology');
	
insert into subjects(subjectname)
	values('SF');
	

--Grades Data being inserted here
insert into grades(studentid, subjectid, teacherid, grade)
	values('1','1','2','A');
	
insert into grades(studentid, subjectid, teacherid, grade)
	values('1','2','2','B');
	
insert into grades(studentid, subjectid, teacherid, grade)
	values('7','3','4','C++');
	
insert into grades(studentid, subjectid, teacherid, grade)
	values('7','2','3','F');
	
insert into grades(studentid, subjectid, teacherid, grade)
	values('6','1','2','B+');
	
insert into grades(studentid, subjectid, teacherid, grade)
	values('2','3','4','C');
	
insert into grades(studentid, subjectid, teacherid, grade)
	values('3','3','4','B');
	
	
--select * from students; 

--select * from teachers;

--select * from subjects;

--select * from grades;


--Question 1
--select studentname from students
--order by studentname;

--Question 2
--select studentname from students
--where studentid in (select studentid from grades 
--	where teacherid = 2)

--Question 3
--select teachername from teachers
--where teacherid in (select teacherid from grades
--	where subjectid = 2)

--Question 4
--select teachername from teachers
--where teacherid not in (select teacherid from grades)

--Question 5 
--select studentname from students
--where studentid not in (select studentid from grades)