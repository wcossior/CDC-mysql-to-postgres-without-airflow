CREATE DATABASE db_movies_netflix_transact;
USE db_movies_netflix_transact;

/* Crear la tabla Movie */
CREATE TABLE movie (
  movieID  VARCHAR(8) PRIMARY KEY  NOT NULL,
  movieTitle VARCHAR(100) NOT NULL,
  releaseDate  DATE NOT NULL,
  originalLanguage  VARCHAR(100) DEFAULT NULL,
  link VARCHAR(50) DEFAULT NULL
);

INSERT INTO movie VALUES 
  ("80192187", "Triple Frontier", "2019-04-12", "English", "https://www.netflix.com/pe-en/title/80192187"),
  ("81157374", "Run", "2021-05-21", "English", "https://www.netflix.com/pe-en/title/81157374"),
  ("80210920", "The Mother", "2023-01-05", "English", "https://www.netflix.com/pe-en/title/80210920");

/* Crear la tabla Person */
CREATE TABLE person (
  personID  VARCHAR(8) PRIMARY KEY  NOT NULL,
  name VARCHAR(100) NOT NULL,
  birthday  DATE NOT NULL
);

INSERT INTO person VALUES 
  ("72129839", "Joseph Chavez Pineda", "1997-04-12"),
  ("73235434", "Aria Lopez Gutierrez", "1987-05-21"),
  ("20432364", "Maria Alejandra Navarro", "1967-01-05");

/* Crear la tabla Participant */
CREATE TABLE participant (
  movieId VARCHAR(8) NOT NULL,
  personId VARCHAR(8),
  participantRole VARCHAR(30),
  PRIMARY KEY (movieId, personId),
  CONSTRAINT fk_movie_participant FOREIGN KEY (movieId) REFERENCES movie (movieID),
  CONSTRAINT fk_movie_person FOREIGN KEY (personId) REFERENCES person (personID)
);

INSERT INTO participant VALUES 
  ("80192187", "72129839", "Actor"),
  ("81157374", "73235434", "Director"),
  ("80210920", "20432364", "Actor");

/* Crear la tabla Gender */
CREATE TABLE gender (
  genderId INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(100) NOT NULL
);

INSERT INTO gender VALUES 
  (1, "Action"),
  (2, "Adventure"),
  (3, "Drama");

/* Crear la tabla Movie_Gender */
CREATE TABLE movie_gender (
  movieId VARCHAR(8) NOT NULL,
  genderId INTEGER,
  PRIMARY KEY (movieId, genderId),
  CONSTRAINT fk_Movie_Gender_Movie FOREIGN KEY (movieId) REFERENCES movie (movieID),
  CONSTRAINT fk_Movie_Gender_Gender FOREIGN KEY (genderId) REFERENCES gender (genderId)
);

INSERT INTO movie_gender VALUES 
  ("80192187", 1),
  ("81157374", 2),
  ("80210920", 3);
