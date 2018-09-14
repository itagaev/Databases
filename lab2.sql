CREATE DATABASE lab2;

CREATE TABLE countries{
 country_id SERIAL,
  country_name VARCHAR(25),
  region_id INT,
  population INT,
  CONSTRAINT pKey PRIMARY KEY (country_id)
};

INSERT INTO countries VALUES(DEFAULT, 'KZ', 09,800000);

INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'KZ');

INSERT INTO countries VALUES (DEFAUl, 'China', 03, 200000000000);

INSERT INTO countries (country_id, country_name, region_id, population) VALUES (DEFAULT, 'KG', 30, 20000000),
                                                                               (DEFAULT, 'UZ', 20, 3500000);
                                                                               (DEFAULT, 'RU', 02, 120000000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'KZ';

INSERT INTO countries VALUES (DEFAULT, DEFAULT, 08, 1700000);

INSERT INTO countries VALUES (DEFAULT);

CREATE TABLE countries_new{
LIKE countries
};

 INSERT INTO countries_new SELECT * FROM countries RETURNING *;

 UPDATE countries SET region_id = 1 WHERE region_id is NULL;

 UPDATE countries SET population = population * 1.1 RETURNING country_name, population as 'New Population';

 DELETE FROM countries WHERE population < 100000;

 DELETE FROM countries AS c USING countries_new AS n WHERE c.country_id = n.country_id RETURNING *;

DELETE FROM countries;



