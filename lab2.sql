-- 1
CREATE DATABASE lab2;
-- 2
CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(30),
    region_id SMALLINT,
    population INTEGER
);
-- 3
INSERT INTO countries(country_name, region_id, population) VALUES ('Kazakhstan', 2, 3000000);
-- 4
INSERT INTO countries(country_id ,country_name) VALUES(default, 'USA');

select * from countries;
-- 5
INSERT INTO countries(region_id) VALUES (null);
-- 6
INSERT INTO countries DEFAULT VALUES;
-- 7
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
-- 8
INSERT INTO countries(country_name) VALUES(DEFAULT);
-- 9
INSERT INTO countries DEFAULT VALUES;

-- 10
CREATE TABLE countries_new(
    LIKE countries INCLUDING ALL
);

-- 11
INSERT INTO countries_new SELECT * FROM countries;

SELECT * FROM countries_new;
-- 12
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

-- 13
UPDATE countries
SET population = population * 1.1
WHERE population is not null
RETURNING country_name, population as new_population;
-- 14
DELETE FROM countries
where population < 100000
RETURNING *;

INSERT INTO countries(population) values(99998);

-- 15
DELETE FROM countries_new USING countries
where countries.country_id = countries_new.country_id
returning *;
-- 16
DELETE FROM countries returning *;