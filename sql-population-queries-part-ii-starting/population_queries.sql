-- How many entries in the database are from Africa?
SELECT COUNT(*) AS 'countries_in_africa'
FROM countries
WHERE continent = 'Africa';


-- What was the total population of Oceania in 2005?
SELECT year, continent, SUM(population) AS 'total population'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.continent = 'Oceania' AND year = 2005;


-- What is the average population of countries in South America in 2003?
SELECT year, continent, AVG(population) AS 'average population'
FROM countries
JOIN population_years
  ON countries.id = population_years.country_id
WHERE countries.continent = 'South America' AND year = 2003;


-- What country had the smallest population in 2007?
SELECT year, name, population
FROM population_years
JOIN countries
    ON countries.id = population_years.country_id
WHERE year = 2007 AND population IS NOT NULL
ORDER BY population ASC
LIMIT 1;

-- Or you can use 'MIN':
SELECT year, name, MIN(population)
FROM population_years
JOIN countries
    ON countries.id = population_years.country_id
WHERE year = 2007 AND population IS NOT NULL;


-- What is the average population of Poland during the time period covered by this dataset?
SELECT name, AVG(population)
FROM countries 
JOIN population_years
  ON countries.id = population_years.country_id
WHERE name = 'Poland';


-- How many countries have the word "The" in their name?
SELECT COUNT(*)
FROM countries
WHERE name LIKE '%The%';


-- What was the total population of each continent in 2010?

SELECT year, continent, SUM(population) AS 'total population of each continent in 2010'
FROM population_years
JOIN countries
    ON countries.id = population_years.country_id
WHERE year = 2010
GROUP BY continent;
