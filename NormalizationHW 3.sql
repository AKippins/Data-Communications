--Creates the players table
drop table if exists players;
create table players
(
pid            serial
pfirst_name     text 
plast_name      text
address        text
phone_number   text
teams          text
--Not sure if I should be using date of birth and finding someway to have the code calculate the age and determine the age group based on that or if i should just put the age group of each child requiring the age to be looked at everytime the child regesters.
date_of_birth  text
age_group      int
);

drop table if exists coaches;
create table coaches
(
cid              serial
cfirst_name       text
clast_name        text
address          text
phone_number     text
years_coached    int
coaching_status  text
);

drop table if exists teams;
create table teams
(
tid	
team_name
age_group
);
--Thinking that I wanna set the tables up to have a teams coached table to solve the problem i couldn't solve of showing the coaches since there doesnt have to be a set number of assistant coaches

drop table if exists teams_coached;
create table teams_coached
(
tcid
cid 
tid
team_name
coaching_status

);