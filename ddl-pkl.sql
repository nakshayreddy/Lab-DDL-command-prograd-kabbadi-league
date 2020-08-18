-- PROGRESSION - 1


-- 1. **Create table city**
CREATE TABLE city(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
Constraint city_pk PRIMARY KEY(id)
);
drop table city;


-- 2. **Create table referee**
create table referee(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT referee_pk PRIMARY KEY(id)
);
drop table referee;

-- 3. **Create table innings**
create table innings(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT innings_pk PRIMARY KEY(id)
);
drop table innings;



-- 4. **Create table extra_type**
create table extra_type(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT extra_type_pk PRIMARY KEY(id)
);
drop table extra_type;

-- 5. **Create table skill**
create table skill(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT skill_pk PRIMARY KEY(id)
);
drop table skill;


-- 6. **Create table team**
create table team(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
coach VARCHAR(50) NOT NULL,
homecity NUMBER(11) NOT NULL,
captain VARCHAR(50) NOT NULL,
CONSTRAINT team_pk PRIMARY KEY(id),
CONSTRAINT team_fk FOREIGN KEY(homecity)
 REFERENCES city (id));
 drop table team;


-- 7. **Create table player**
create table player(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
skill_id NUMBER(11),
team_id NUMBER(11),
CONSTRAINT player_pk PRIMARY KEY(id),
CONSTRAINT player_fk FOREIGN KEY(skill_id)REFERENCES skill(id),
CONSTRAINT player_fk1 FOREIGN KEY(team_id)REFERENCES team(id)
);
drop table player;



-- 8. **Create table venue**
create table venue(
id NUMBER(11),
stadium_name VARCHAR(50) NOT NULL,
city_id NUMBER(11) NOT NULL,
CONSTRAINT venue_pk PRIMARY KEY(id),
CONSTRAINT venue_fk1 FOREIGN KEY(city_id) REFERENCES city(id)
);
drop table venue;



-- 9. **Create table event**
create table event(
id NUMBER(11),
innings_id NUMBER(11) NOT NULL,
event_no NUMBER(11) NOT NULL,
raider_id NUMBER(11) NOT NULL,
raid_points NUMBER(11) NOT NULL,
defending_points NUMBER(11) NOT NULL,
clock_in_seconds  NUMBER(11) NOT NULL,
team_one_score NUMBER(11) NOT NULL,
team_two_score NUMBER(11) NOT NULL,

CONSTRAINT event_pk PRIMARY KEY(id),
CONSTRAINT event_fk FOREIGN KEY(innings_id) REFERENCES innings(id),
CONSTRAINT event_fk1 FOREIGN KEY(raider_id) REFERENCES event(id));
drop table event; 


-- 10. **Create table extra_event**
create table extra_event(
id NUMBER(11),
event_id NUMBER(11) NOT NULL,
extra_type_id NUMBER(11) NOT NULL,
points NUMBER(11) NOT NULL,
scoring_team_id NUMBER(11) NOT NULL,
CONSTRAINT extra_event_pk PRIMARY KEY(id),
CONSTRAINT extra_event_fk1 FOREIGN KEY(event_id) REFERENCES event(id),
CONSTRAINT extra_event_fk2 FOREIGN KEY(extra_type_id) REFERENCES extra_type(id),
CONSTRAINT extra_event_fk3 FOREIGN KEY(scoring_team_id) REFERENCES team(id)
);
drop table extra_event;


-- 11. **Create table outcome**
create table outcome(
id NUMBER(11),
status VARCHAR(50) NOT NULL,
winner_team_id Number(11),
score Number(11),
player_of_match Number(11),
CONSTRAINT outcome_pk PRIMARY KEY(id)

);
drop table outcome;


-- 12. **Create table game**
create table game(
id NUMBER(11),
game_date DATE,
team_id_1 NUMBER(11),
team_id_2 NUMBER(11),
venue_id NUMBER(11),
outcome_id NUMBER(11),
referee_id_1 NUMBER(11),
referee_id_2 NUMBER(11),
first_innings_id NUMBER(11),
second_innings_id NUMBER(11),
CONSTRAINT game_pk PRIMARY KEY(id),
CONSTRAINT game_fk1 FOREIGN KEY(team_id_1,team_id_2)REFERENCES team(id),
CONSTRAINT game_fk2 FOREIGN KEY(venue_id)REFERENCES venue(id),
CONSTRAINT game_fk3 FOREIGN KEY(outcome_id)REFERENCES outcome(id),
CONSTRAINT game_fk4 FOREIGN KEY(referee_id_1,referee_id_2)REFERENCES referee(id),
CONSTRAINT game_fk5 FOREIGN KEY(first_innings_id,second_innings_id)REFERENCES innings(id)




);
drop table game;


-- 13. **Drop table city**
Drop TABLE city;

-- 14. **Drop table innings**
Drop table innings;

-- 15. **Drop table skill**
Drop table skill;

-- 16. **Drop table extra_type**
Drop table extra_type;













