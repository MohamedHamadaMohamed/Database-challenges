CREATE DATABASE Movie;

USE Movie;

CREATE TABLE actor
(
act_id int primary key,
actor_fname varchar(20) ,
actor_lname varchar(20) ,
act_gender varchar(1) ,
);

CREATE TABLE director
(
dir_id int primary key,
dir_fname varchar(20) ,
dir_lname varchar(20) ,
);

CREATE TABLE movie
(
movie_id int primary key,
movie_title varchar(50) not null,
movie_year int ,
movie_time int ,
movie_lang varchar(50),
movie_dt_rel date,
movie_rel_country varchar(5)
);

CREATE TABLE reviewer
(
rev_id int primary key,
rev_name varchar(30)
);
CREATE TABLE genres
(
gen_id int primary key,
gen_title varchar(20)
);

CREATE TABLE movie_direction
(
dir_id int  ,
movie_id int  ,
PRIMARY KEY(dir_id,movie_id),
CONSTRAINT Dir_ID_FK FOREIGN KEY (dir_id)
references director(dir_id),
CONSTRAINT Movie_ID_FK FOREIGN KEY (movie_id)
references movie(movie_id)
);
CREATE TABLE movie_Cast
(
movie_Cast_id int primary key,
act_id int ,
movie_id int ,
role varchar(30),

CONSTRAINT Act_ID_FK FOREIGN KEY(act_id)
REFERENCES actor(act_id),

CONSTRAINT Mov_ID_FK FOREIGN KEY(movie_id)
REFERENCES movie(movie_id),
);

CREATE TABLE movie_genres
(
movie_id int ,
gen_id int ,

primary key(movie_id,gen_id),
CONSTRAINT Movie_FK FOREIGN KEY (movie_id)
REFERENCES movie(movie_id),
CONSTRAINT Gen_FK FOREIGN KEY (gen_id)
REFERENCES genres(gen_id),
);
CREATE TABLE rating
(
movie_id int,
rev_id int,
rev_stars int,
num_o_ratings int,

primary key(movie_id,rev_id),
CONSTRAINT mov_FK FOREIGN KEY (movie_id)
REFERENCES movie(movie_id),
CONSTRAINT rev_FK FOREIGN KEY (rev_id)
REFERENCES reviewer(rev_id),

);