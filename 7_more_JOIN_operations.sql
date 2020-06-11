--1. List the films where the yr is 1962 [Show id, title--
SELECT id, title FROM movie WHERE yr=1962;

--2.Give year of 'Citizen Kane'. --
SELECT yr FROM movie WHERE title = 'Citizen Kane';

--3.Star Trek movies--
SELECT id, title, yr FROM movie WHERE title LIKE 'star trek%' ORDER BY yr;

--4. What id number does the actor 'Glenn Close' have? --
SELECT id FROM actor WHERE name = 'Glenn Close';

--5. What is the id of the film 'Casablanca' --
SELECT id FROM movie WHERE title = 'Casablanca';

--6. Cast list for Casablanca--
SELECT name FROM actor JOIN casting ON id=actorid WHERE movieid=11768; ;

--7. Obtain the cast list for the film 'Alien' --
SELECT name FROM actor JOIN casting ON id=actorid WHERE movieid = (SELECT id FROM movie WHERE title = 'alien');

--8. List the films in which 'Harrison Ford' has appeared --
SELECT title FROM movie JOIN casting ON id=movieid WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford');

--9. Harrison Ford as a supporting actor--
SELECT title FROM movie JOIN casting ON id=movieid WHERE ord!=1 AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford');

--10. List the films together with the leading star for all 1962 films. --
SELECT title, name FROM movie JOIN casting ON (movieid = id) JOIN actor ON (actor.id = actorid) WHERE yr = 1962 A D casting.ord = 1;