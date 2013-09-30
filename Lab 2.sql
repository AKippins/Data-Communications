--Creation of table departments
--Creation of table departments
drop table if exists departments cascade;
create table if not exists departments
(
   did        text   not null   primary key,
   name       text   not null,
   datefound  date   not null
);


--Creation of table fy
drop table if exists fy cascade;
create table if not exists fy 
(
   year       int    not null   primary key,
   startdate  date   not null,
   enddate    date   not null
);

--Creation of table people
drop table if exists people cascade;
create table if not exists people
(
   pid        serial  primary key,
   firstname  text    not null,
   lastname   text    not null,
   hiredate   date    not null,
   did        text    not null  references departments(did)
);

--Inserting data for departments
insert into departments(did, name, datefound)
	values ('A','CS','2010-06-30');

insert into departments(did, name, datefound)
	values ('B','IT','2013-01-01');

insert into departments(did, name, datefound)
	values ('C','IS','2014-07-04');
	
--Inserting data for fy 
insert into fy(year, startdate, enddate)
	values ('2012','2011-07-01','2012-06-30');
	
insert into fy(year, startdate, enddate)
	values ('2013','2012-07-01','2013-06-30');
	
insert into fy(year, startdate, enddate)
	values ('2014','2013-07-01','2014-06-30');

insert into fy(year, startdate, enddate)
	values ('2015','2014-07-01','2015-06-30');
	
--Inserting data for people
insert into people(firstname, lastname, hiredate, did)
	values ('Mary','Miller','2008-01-23','A');
	
insert into people(firstname, lastname, hiredate, did)
	values ('Zach','Meath','2006-09-28','A');
	
insert into people(firstname, lastname, hiredate, did)
	values ('Corvo','Atono','2012-04-04','B');
	
insert into people(firstname, lastname, hiredate, did)
	values ('Rob','Rizzacasa','2013-11-11','B');
	
insert into people(firstname, lastname, hiredate, did)
	values ('Aaron','Kippins','2014-11-11','B');
	
	
--select * from departments;

--select * from fy;

--select * from people;

--Question 1 
--select * from people p, departments d
--where p.hiredate >= d.datefound and p.did = d.did

--Question 2
--select * from people p, fy f, departments d
--where p.hiredate >= f.startdate and p.hiredate <= f.enddate and p.did = d.did

--Question 3
select * from departments d, people p
