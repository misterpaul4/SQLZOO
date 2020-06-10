--List each country name where the population is larger than that of 'Russia'--
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name ='Russia')

--Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.--
SELECT name FROM world WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'united kingdom');

--List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.--
SELECT name, continent FROM  world WHERE continent = (SELECT continent FROM world WHERE name = 'argentina') OR continent = (SELECT continent FROM world WHERE name = 'australia') ORDER BY name;

--Which country has a population that is more than Canada but less than Poland? Show the name and the population.--
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name = 'canada') AND population < (SELECT population FROM world WHERE name = 'poland');

--Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.--
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'germany') * 100, 0), '%') FROM world WHERE continent = 'europe';

--Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values) --
SELECT name FROM world WHERE continent != 'europe' AND gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'europe');

--Find the largest country (by area) in each continent, show the continent, the name and the area:--
SELECT continent, name, area FROM world x WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND area>0)
