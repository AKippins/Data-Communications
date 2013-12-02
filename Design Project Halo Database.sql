--Dropping all of the tables in a specific order to avoid recommended CASCADE errors
drop table if exists game_location;
drop table if exists games_appeared;
drop table if exists species_planet;
drop table if exists character_species;
drop table if exists character_type;
drop table if exists characters;
drop table if exists games;
drop table if exists species;
drop table if exists planets;

--This is the creation of the Characters table
create table characters
(
character_id  serial  not null  primary key,
name          text    not null,
height_in     int     not null  default 0.0  check (height_in > 0),
weight_lbs    int     not null  default 0.0  check (weight_lbs > 0),
gender        text    not null  check (gender = 'Male' or gender = 'Female' or gender = 'Genderless' or gender = 'Players Choice'),
bio           text,
alliance      text    not null  check (alliance = 'UNSC' or alliance = 'Covenant' or alliance = 'Flood' or alliance = 'Forerunner')
); 

--This is the creation of the Games table
create table games
(
game_id            serial  not null  primary key,
name               text    not null,
developer          text    not null,
publisher          text    not null,
genre              text    not null,
platform_released  text    not null  check (platform_released = 'Xbox' or platform_released = 'Xbox 360' or platform_released = 'Windows Phone 8'),
release_date       date    not null
); 

--This is the creation of the Species table
create table species
(
species_id  serial  not null   primary key, 
name        text    not null,
summary     text    not null  
);

--This is the creation of the Planets table
create table planets
(
planet_id  serial  not null  primary key,
name       text    not null
);

--This is the creation of the Character Type table
create table character_type
(
name  text  not null  primary key
);

--This is the creation of the Game Location table
create table game_location
(
game_id    serial  not null  references games(game_id),
planet_id  serial  not null  references planets(planet_id)
);

--This is the creation of the Games Appeared table
create table games_appeared
(
character_id  serial  not null  references characters(character_id),
game_id       serial  not null  references games(game_id)
);

--This is the creation of the Species Planet table
create table species_planet
(
species_id  serial  not null  references species(species_id),
planet_id   serial  not null  references planets(planet_id)
);

--This is the creation of the Character Species table
create table character_species
(
character_id  serial  not null  references characters(character_id),
species_id    serial  not null  references species(species_id),
character_type  name  not null  references character_type(name)
);

--Inserting data into the Characters table
insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Master Chief John-117', '84', '1200', 'Male', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Cortana', '7', '1', 'Female', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Sergeant Major Avery Junior Johnson', '74', '185', 'Male', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Captain Jacob Keyes', '76', '212', 'Male', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Miranda Keyes', '68', '135', 'Female', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Doctor Catherine Elizabeth Halsey', '67', '120', 'Female', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Commander Carter-A259 (Noble One)', '82', '950', 'Male', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Lieutenant Commander Catherine-B320 (Noble Two)', '81', '850', 'Female', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Emile-A239 (Noble Three)', '82', '1000', 'Male', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Chief Warrent Officer Jorge-052 (Noble Four)', '96', '1500', 'Male', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Jun-A266 (Noble Five)', '83', '945', 'Male', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Spartan-B312 (Noble Six)', '81', '1200', 'Players Choice', 'A Short Bio About This Character', 'UNSC');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('High Prophet of Truth', '87', '560', 'Male', 'A Short Bio About This Character', 'Covenant');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('High Prophet of Mercy', '87', '560', 'Male', 'A Short Bio About This Character', 'Covenant');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('High Prophet of Regret', '86', '560', 'Male', 'A Short Bio About This Character', 'Covenant');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Arbiter (Thel Vadamee)', '94', '830', 'Male', 'A Short Bio About This Character', 'Covenant');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Tartarus', '108', '1100', 'Male', 'A Short Bio About This Character', 'Covenant');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('343 Guilty Spark (The Monitor of Installation 04)', '20', '25', 'Male', 'A Short Bio About This Character', 'Forerunner');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Didact (Ur-Didact or Shadow of Sundered Star)', '136', '795', 'Male', 'A Short Bio About This Character', 'Forerunner');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Librarian (First Light Weaves Living Song)', '114', '441', 'Female', 'A Short Bio About This Character', 'Forerunner');

insert into characters(name, height_in, weight_lbs, gender, bio, alliance)
	values ('Gravemind (Inferi Sententia)', '3360', '52000', 'Genderless', 'A Short Bio About This Character', 'Flood');

--Inserting data into the Games table
insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo: Combat Evolved', 'Bungie Studios', 'Microsoft Game Studios', 'First Person Shooter', 'Xbox', '2001-11-15');

insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo 2', 'Bungie Studios', 'Microsoft Game Studios', 'First Person Shooter', 'Xbox', '2004-11-09' );

insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo 3', 'Bungie Studios', 'Microsoft Game Studios', 'First Person Shooter', 'Xbox 360', '2007-09-25');

insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo Wars', 'Ensemble Studios', 'Microsoft Game Studios', 'Real Time Strategy', 'Xbox 360', '2009-03-03');

insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo 3: ODST', 'Bungie Studios', 'Microsoft Game Studios', 'First Person Shooter', 'Xbox 360', '2009-09-22');

insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo: Reach', 'Bungie Studios', 'Microsoft Game Studios', 'First Person Shooter', 'Xbox 360', '2010-09-14');

insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo: Combat Evolved Anniversary', '343 Industries', 'Microsoft Game Studios', 'First Person Shooter', 'Xbox 360', '2011-11-15');

insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo 4', '343 Industries', 'Microsoft Game Studios', 'First Person Shooter', 'Xbox 360', '2012-11-06');

insert into games(name, developer, publisher, genre, platform_released, release_date)
	values ('Halo: Spartan Assault', '343 Industries', 'Microsoft Game Studios', 'Top Down Shooter', 'Windows Phone 8', '2013-07-18');

--Inserting data into the Species table
insert into species(name, summary)
	values ('Human', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Sangheili', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Jiralhanae', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Kig-Yar', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Unggoy', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Mgalekgolo', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('San Shyuum', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Yanmee', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Forerunner', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Flood', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Precursor', 'A Short Summary About The Species');

insert into species(name, summary)
	values ('Huragok', 'A Short Summary About The Species');

--Inserting data into the Planets Table
insert into planets(name)
	values ('Installation 00');

insert into planets(name)
	values ('Installation 03');

insert into planets(name)
	values ('Installation 04');

insert into planets(name)
	values ('Installation 05');

insert into planets(name)
	values ('Requiem');

insert into planets(name)
	values ('Earth');

insert into planets(name)
	values ('Reach');

insert into planets(name)
	values ('Chuot');

insert into planets(name)
	values ('Decided Heart');

insert into planets(name)
	values ('Joyous Exultation');

insert into planets(name)
	values ('Metisette');

insert into planets(name)
	values ('UNSC Infinity');

--Inserting data into the Character Types table
insert into character_type(name)
	values ('Spartan');

insert into character_type(name)
	values ('Elite');

insert into character_type(name)
	values ('Brute');

insert into character_type(name)
	values ('Marine');

insert into character_type(name)
	values ('Promethian');
	
insert into character_type(name)
	values ('Flood');
	
insert into character_type(name)
	values ('A.I.');
	
insert into character_type(name)
	values ('High Prophet');
	
--Inserting gata into the game Locations Table
insert into game_location(game_id, planet_id)
	values ('1', '3');

insert into game_location(game_id, planet_id)
	values ('2', '4');

insert into game_location(game_id, planet_id)
	values ('3', '1');

insert into game_location(game_id, planet_id)
	values ('4', '6');

insert into game_location(game_id, planet_id)
	values ('5', '6');

insert into game_location(game_id, planet_id)
	values ('6', '7');

insert into game_location(game_id, planet_id)
	values ('7', '3');

insert into game_location(game_id, planet_id)
	values ('8', '5');

insert into game_location(game_id, planet_id)
	values ('9', '12');
	
--Inserting data into the Games Appeared Table
insert into games_appeared(character_id, game_id)
	values ('1','1');

insert into games_appeared(character_id, game_id)
	values ('1','2');

insert into games_appeared(character_id, game_id)
	values ('1','3');

insert into games_appeared(character_id, game_id)
	values ('1','6');

insert into games_appeared(character_id, game_id)
	values ('1','7');

insert into games_appeared(character_id, game_id)
	values ('1','8');

insert into games_appeared(character_id, game_id)
	values ('2','1');

insert into games_appeared(character_id, game_id)
	values ('2','2');

insert into games_appeared(character_id, game_id)
	values ('2','3');

insert into games_appeared(character_id, game_id)
	values ('2','4');

insert into games_appeared(character_id, game_id)
	values ('2','7');

insert into games_appeared(character_id, game_id)
	values ('3','1');

insert into games_appeared(character_id, game_id)
	values ('3','2');

insert into games_appeared(character_id, game_id)
	values ('3','3');

insert into games_appeared(character_id, game_id)
	values ('3','7');

insert into games_appeared(character_id, game_id)
	values ('4','1');

insert into games_appeared(character_id, game_id)
	values ('4','6');

insert into games_appeared(character_id, game_id)
	values ('4','7');

insert into games_appeared(character_id, game_id)
	values ('5','2');

insert into games_appeared(character_id, game_id)
	values ('5','3');

insert into games_appeared(character_id, game_id)
	values ('6','6');

insert into games_appeared(character_id, game_id)
	values ('7','6');

insert into games_appeared(character_id, game_id)
	values ('8','6');

insert into games_appeared(character_id, game_id)
	values ('9','6');

insert into games_appeared(character_id, game_id)
	values ('10','6');

insert into games_appeared(character_id, game_id)
	values ('11','6');

insert into games_appeared(character_id, game_id)
	values ('12','6');

insert into games_appeared(character_id, game_id)
	values ('13','2');

insert into games_appeared(character_id, game_id)
	values ('14','2');

insert into games_appeared(character_id, game_id)
	values ('15','2');

insert into games_appeared(character_id, game_id)
	values ('16','2');

insert into games_appeared(character_id, game_id)
	values ('16','3');

insert into games_appeared(character_id, game_id)
	values ('17','2');

insert into games_appeared(character_id, game_id)
	values ('18','1');

insert into games_appeared(character_id, game_id)
	values ('18','7');

insert into games_appeared(character_id, game_id)
	values ('19','8');

insert into games_appeared(character_id, game_id)
	values ('20','8');

insert into games_appeared(character_id, game_id)
	values ('21','3');

--Inserting data into species planet Table
insert into species_planet(species_id,planet_id)
	values ('1', '6');

insert into species_planet(species_id,planet_id)
	values ('2', '9');

insert into species_planet(species_id,planet_id)
	values ('3', '10');

insert into species_planet(species_id,planet_id)
	values ('4', '8');

insert into species_planet(species_id,planet_id)
	values ('5', '11');

insert into species_planet(species_id,planet_id)
	values ('6', '10');

insert into species_planet(species_id,planet_id)
	values ('7', '10');

insert into species_planet(species_id,planet_id)
	values ('8', '10');

insert into species_planet(species_id,planet_id)
	values ('9', '5');

insert into species_planet(species_id,planet_id)
	values ('10', '3');

insert into species_planet(species_id,planet_id)
	values ('12', '10');

--Inserting data into the Character Species Table
insert into character_species(character_id, species_id, character_type)
	values ('1', '1', 'Spartan');

insert into character_species(character_id, species_id, character_type)
	values ('2', '1', 'A.I.');

insert into character_species(character_id, species_id, character_type)
	values ('3', '1', 'Marine');

insert into character_species(character_id, species_id, character_type)
	values ('4', '1', 'Marine');

insert into character_species(character_id, species_id, character_type)
	values ('5', '1', 'Marine');

insert into character_species(character_id, species_id, character_type)
	values ('6', '1', 'Marine');

insert into character_species(character_id, species_id, character_type)
	values ('7', '1', 'Spartan');

insert into character_species(character_id, species_id, character_type)
	values ('8', '1', 'Spartan');

insert into character_species(character_id, species_id, character_type)
	values ('9', '1', 'Spartan');

insert into character_species(character_id, species_id, character_type)
	values ('10', '1', 'Spartan');

insert into character_species(character_id, species_id, character_type)
	values ('11', '1', 'Spartan');

insert into character_species(character_id, species_id, character_type)
	values ('12', '1', 'Spartan');

insert into character_species(character_id, species_id, character_type)
	values ('13', '7', 'High Prophet');

insert into character_species(character_id, species_id, character_type)
	values ('14', '7', 'High Prophet');

insert into character_species(character_id, species_id, character_type)
	values ('15', '7', 'High Prophet');

insert into character_species(character_id, species_id, character_type)
	values ('16', '2', 'Elite');

insert into character_species(character_id, species_id, character_type)
	values ('17', '3', 'Brute');

insert into character_species(character_id, species_id, character_type)
	values ('18', '9', 'A.I.');

insert into character_species(character_id, species_id, character_type)
	values ('19', '9', 'Promethian');

insert into character_species(character_id, species_id, character_type)
	values ('20', '9', 'Promethian');

insert into character_species(character_id, species_id, character_type)
	values ('21', '10', 'Flood');







Select *
From Characters

Select * 
From Games

Select * 
From Species

Select * 
From Planets

Select *
From Character_type

Select * 
From Game_Location

Select *
From games_appeared

Select * 
From species_planet

Select * 
From Character_species

create view spartans as 
select games.name as game_title,
characters.name as character_name,
characters.Height_in as "height(in)",
characters.Weight_lbs as "weight(lbs)",
characters.gender as gender, 
characters.Bio as Bio,
characters.alliance as Alliance
from games, games_appeared, Characters, character_species
where games.game_id = games_appeared.game_id and
games_appeared.character_id = characters.character_id and
characters.character_id = character_species.character_id and
character_species.character_type = 'Spartan'

create view elites as 
select games.name as game_title,
characters.name as character_name,
characters.Height_in as "height(in)",
characters.Weight_lbs as "weight(lbs)",
characters.gender as gender, 
characters.Bio as Bio,
characters.alliance as Alliance
from games, games_appeared, Characters, character_species
where games.game_id = games_appeared.game_id and
games_appeared.character_id = characters.character_id and
characters.character_id = character_species.character_id and
character_species.character_type = 'Elite'

create view marines as 
select games.name as game_title,
characters.name as character_name,
characters.Height_in as "height(in)",
characters.Weight_lbs as "weight(lbs)",
characters.gender as gender, 
characters.Bio as Bio,
characters.alliance as Alliance
from games, games_appeared, Characters, character_species
where games.game_id = games_appeared.game_id and
games_appeared.character_id = characters.character_id and
characters.character_id = character_species.character_id and
character_species.character_type = 'Marine'

create view promethian as 
select games.name as game_title,
characters.name as character_name,
characters.Height_in as "height(in)",
characters.Weight_lbs as "weight(lbs)",
characters.gender as gender, 
characters.Bio as Bio,
characters.alliance as Alliance
from games, games_appeared, Characters, character_species
where games.game_id = games_appeared.game_id and
games_appeared.character_id = characters.character_id and
characters.character_id = character_species.character_id and
character_species.character_type = 'Promethian'

create view AI as 
select games.name as game_title,
characters.name as character_name,
characters.Height_in as "height(in)",
characters.Weight_lbs as "weight(lbs)",
characters.gender as gender, 
characters.Bio as Bio,
characters.alliance as Alliance
from games, games_appeared, Characters, character_species
where games.game_id = games_appeared.game_id and
games_appeared.character_id = characters.character_id and
characters.character_id = character_species.character_id and
character_species.character_type = 'A.I.'

create function listgames(Halo_Character text)
returns table (Name text, publisher text) as $$
begin
	return query select games.name, game.publisher
		     from games, game_appeared, characters 
		     where games.game_id = games_appeared.game_id and 
		     games_appeared.character_id = characters.cid and 
      		     characters.name = Halo_Character;
end;
$$ language plpgsql


create function listnames(Race_name text)
returns table (Name text, publisher text) as $$
begin
	return query select characters.name,  character.alliance
		     From characters, character_species, species
		     where characters.character_id = character_species.character_id and
		     character_species.species_id = species.species_id and 
		     species.name = Race_name;
end;
$$ language plpgsql





