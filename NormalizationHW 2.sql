drop table if exists actors;
create table if not exists actors
(
aid                                     serial   not null primary key,
actor                                   text     not null,
address                                 text     not null,
birthdate                               date     not null,
hair_color                              text     not null,
eye_color                               text     not null,
height_inches                           text     not null,
weight_lbs                              text     not null,
screen_actors_guild_anniversary_date    date     not null
);

drop table if exists directors;
create table if not exists directors
(
did                               serial  not null primary key,
director                          text    not null,
address                           text    not null,
film_school_attended              text    not null,
directors_guild_anniversary_date  date    not null
);

drop table if exists movies;
create table if not exists movies
(
mid                          serial  not null primary key,
movie_name                   text    not null,
year_released                text    not null,
domestic_box_office_salesUSD money   not null,
foreign_box_office_salesUSD  money   not null,
dvd_bluray_salesUSD          money   not null
);

drop table if exists actors_movies;
create table if not exists actors_movies
(
amid             serial not null primary key,
aid              int   not null references actors(aid),
did              int   not null references directors(did),
mid              int   not null references movies(mid),
movie_name       text   not null,
year_released    text   not null,
starring_actor   text   not null,
director         text   not null
);

drop table if exists directors_movies;
create table if not exists directors_movies
(
dmid             serial not null primary key,
mid              int   not null references movies(mid),
did              int   not null references directors(did),
movie_name       text   not null,
year_released    text   not null,
director         text   not null
);



--Actors Table
insert into actors(actor, address, birthdate, hair_color, eye_color, height_inches, weight_lbs, screen_actors_guild_anniversary_date)
	values ('Sir Thomas Sean Connery' , '123 Banter Lane' , 'August 25, 1930', 'Gray', 'Brown', '6-2', '200', '02-12-1994');
insert into actors(actor, address, birthdate, hair_color, eye_color, height_inches, weight_lbs, screen_actors_guild_anniversary_date)
	values ('Christian Bale' , '736 Gale Lane', 'January 30, 1974', 'Brown', 'Brown', '6-0', '190', '03-23-2010');
insert into actors(actor, address, birthdate, hair_color, eye_color, height_inches, weight_lbs, screen_actors_guild_anniversary_date)
	values ('Henry Cavill' , '6354 Sunset Drive', 'May 5, 1983', 'Hazel', 'Brown', '6-1', '202', '08-31-2011');
insert into actors(actor, address, birthdate, hair_color, eye_color, height_inches, weight_lbs, screen_actors_guild_anniversary_date)
	values ('Andrew Garfield' , '737 Heisenburg Lane', 'August 20, 1983', 'Brown', 'Brown', '5-10', '137', '12-02-2012');
insert into actors(actor, address, birthdate, hair_color, eye_color, height_inches, weight_lbs, screen_actors_guild_anniversary_date)
	values ('Ryan Rodney Reynolds' , '32 Cambridge Lane', 'October 23, 1976', 'Brown', 'Brown', '6-2', '200', '11-08-2013');

--Directors Table
insert into directors(director, address, film_school_attended, directors_guild_anniversary_date)
	values ('Shaun Terence Young' , '52 Agusta Drive', 'St Catharines College, Cambridge', '01-11-1982' );
insert into directors(director, address, film_school_attended, directors_guild_anniversary_date)
	values ('Guy Hamilton' , '904 Geneva Lane' , 'In the Military', '05-19-1988');
insert into directors(director, address, film_school_attended, directors_guild_anniversary_date)
	values ('Lewis Gilbert' , '676 Spider Drive', 'In The Military', '09-10-1992');
insert into directors(director, address, film_school_attended, directors_guild_anniversary_date)
	values ('Christopher Nolan' , '776 Oakfield Drive', 'In The Military', '09-10-1992');
insert into directors(director, address, film_school_attended, directors_guild_anniversary_date)
	values ('Marc Webb' , '848 Maple Drive', 'In The Military', '09-10-1992');
insert into directors(director, address, film_school_attended, directors_guild_anniversary_date)
	values ('Martin Campbell' , '987 Cherry Drive', 'In The Military', '09-10-1992');

--Movies Table
insert into movies(movie_name, year_released, domestic_box_office_salesUSD, foreign_box_office_salesUSD, dvd_bluray_salesUSD)
	values ('From Russia With Love', '1963', 24800000, 54100000, 1000000000);
insert into movies(movie_name, year_released, domestic_box_office_salesUSD, foreign_box_office_salesUSD, dvd_bluray_salesUSD)
	values ('The Dark Knight', '2008', 533345358, 469546000, 262543772);
insert into movies(movie_name, year_released, domestic_box_office_salesUSD, foreign_box_office_salesUSD, dvd_bluray_salesUSD)
	values ('Man of Steel', '2013', 291045518, 367000000, 37837475);
insert into movies(movie_name, year_released, domestic_box_office_salesUSD, foreign_box_office_salesUSD, dvd_bluray_salesUSD)
	values ('The Amazing Spider Man', '2012', 262030663, 495859604, 34783640);
insert into movies(movie_name, year_released, domestic_box_office_salesUSD, foreign_box_office_salesUSD, dvd_bluray_salesUSD)
	values ('The Green Lantern', '2011', 116601172, 114600000, 19644793);
insert into movies(movie_name, year_released, domestic_box_office_salesUSD, foreign_box_office_salesUSD, dvd_bluray_salesUSD)
	values ('You Only Live Twice', '1967', 273263726, 9239482, 823718982);
insert into movies(movie_name, year_released, domestic_box_office_salesUSD, foreign_box_office_salesUSD, dvd_bluray_salesUSD)
	values ('Goldfinger', '1964', 93819282, 839849289, 123712388);

--Actors Movies Table
insert into actors_movies(aid, did, mid, movie_name, year_released, starring_actor, director)
	values('1','3','6','You Only Live Twice', '1967', 'Sir Thomas Sean Connery', 'Lewis Gilbert');
insert into actors_movies(aid, did, mid, movie_name, year_released, starring_actor, director)
	values('1','2','7','Goldfinger', '1964', 'Sir Thomas Sean Connery', 'Guy Hamilton');
insert into actors_movies(aid, did, mid, movie_name, year_released, starring_actor, director)
	values('1','1','1','From Russia With Love', '1963', 'Sir Thomas Sean Connery', 'Shaun Terence Young');
insert into actors_movies(aid, did, mid, movie_name, year_released, starring_actor, director)
	values('2','4','2','The Dark Knight', '2008', 'Christian Bale', 'Christopher Nolan');
insert into actors_movies(aid, did, mid, movie_name, year_released, starring_actor, director)
	values('3','4','3','Man of Steel', '2013', 'Henry Cavill', 'Christopher Nolan');
insert into actors_movies(aid, did, mid, movie_name, year_released, starring_actor, director)
	values('4','5','4','The Amazing Spider Man', '2012', 'Andrew Garfield', 'Marc Webb');
insert into actors_movies(aid, did, mid, movie_name, year_released, starring_actor, director)
	values('5','6','5','The Green Lantern', '2011', 'Ryan Reynolds', 'Martin Campbell');

--Directors Movies Table
insert into directors_movies(mid, did, movie_name, year_released, director)
	values('6','3','You Only Live Twice', '1967', 'Lewis Gilbert');
insert into directors_movies(mid, did, movie_name, year_released, director)
	values('7','2','Goldfinger', '1964', 'Guy Hamilton');
insert into directors_movies(mid, did, movie_name, year_released, director)
	values('1','1','From Russia With Love', '1963', 'Shaun Terence Young');
insert into directors_movies(mid, did, movie_name, year_released, director)
	values('2','4','The Dark Knight', '2008', 'Christopher Nolan');
insert into directors_movies(mid, did, movie_name, year_released, director)
	values('3','4','Man of Steel', '2013', 'Christopher Nolan');
insert into directors_movies(mid, did, movie_name, year_released, director)
	values('4','5','The Amazing Spider Man', '2012', 'Marc Webb');
insert into directors_movies(mid, did, movie_name, year_released, director)
	values('5','6','The Green Lantern', '2011', 'Martin Campbell');

select director
from actors_movies am
where am.starring_actor = 'Sir Thomas Sean Connery'