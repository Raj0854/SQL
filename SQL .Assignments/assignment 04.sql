-- Scenario:
-- Consider a database for a music store with two tables: Albums and Artists. The tables have the following structures:
-- =============================================================
-- Artists table:
-- ArtistID (integer, primary key)
-- ArtistName (varchar)
-- Genre (varchar)
-- Country (varchar)
-- =============================================================
-- Albums table:
-- AlbumID (integer, primary key)
-- AlbumTitle (varchar)
-- ReleaseYear (integer)
-- ArtistID (integer, foreign key referencing Artists table)
-- Price (numeric)
-- =============================================================
create database music;
use music;
create table Artists(
artistID int primary key,
artistname varchar(100),
genre varchar(100),
country varchar(100));
create table Albums(
AlbumId int primary key,
albumtitle varchar(100),
ReleaseYear year,
artistID int,
price numeric,
foreign key (artistID) references Artists(artistID));
-- =============================================================
-- Tasks:
-- =============================================================
-- Q.1 Insert Data:
-- =============================================================
-- Insert a new artist with the following details:
-- ArtistID: 101
-- ArtistName: 'Michael Jackson'
-- Genre: 'Pop'
-- Country: 'USA'
-- =============================================================
insert into Artists values(101,'Michael Jackson','pop','USA');
insert into Artists values(102,'Justin biber','Rock','England');
insert into Artists values(103,'Taylor swift','melody','USA');
insert into Artists values(104,'Arjit singh','Blockbuster','India');
insert into Artists values(105,'Hansraj Raghuvansi ','devote','india');
-- =============================================================
-- Insert a new album with the following details:
-- AlbumID: 201
-- AlbumTitle: 'Thriller'
-- ReleaseYear: 1982
-- ArtistID: (Use the ArtistID of Michael Jackson)
-- Price: 19.99
-- =============================================================
insert into Albums values(201,'Thirller','1982',101,19.99);
insert into Albums values(202,'Senorita','1999',102,28.99);
insert into Albums values(203,'Animals','1981',103,45);
insert into Albums values(204,'Aashiqui 2','2007',104,99.99);
insert into Albums values(205,'Mahadeva','2002',105,109.99);
select*from albums;
-- =============================================================
-- Q.2 Update the release year of the album with AlbumID 201 to 1984.
-- =============================================================
UPDATE ALBUMS set ReleaseYear=1984 where AlbumID=201;
-- =============================================================
-- Q.3 Delete the artist with ArtistID 101 and all albums associated with that artist.
-- =============================================================
 DELETE FROM ALBUMS WHERE ARTISTID =101;
 DELETE FROM ARTISTS WHERE ARTISTID =101;
-- =============================================================
-- Q.4 Add a constraint to the Price column in the Albums table to ensure that the price is greater than or equal to 0.
-- =============================================================
ALTER TABLE ALBUMS
ADD CONSTRAINT PRICE CHECK (PRICE >=0);
-- =============================================================
-- =============================================================
