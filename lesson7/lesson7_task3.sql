
DROP DATABASE IF EXISTS testDB7_3;
CREATE DATABASE testDB7_3 CHARACTER SET utf8;

USE testDB7_3;

DROP TABLE IF EXISTS fligths;
CREATE TABLE fligths (
  id SERIAL PRIMARY KEY,
  city_from VARCHAR(255),
  city_to VARCHAR(255)

) COMMENT = 'Направления';


DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city_eng VARCHAR(255),
  city_ru VARCHAR(255)

) COMMENT = 'Города';


INSERT fligths (city_from, city_to) VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');

 INSERT cities (city_eng, city_ru) VALUES
  ('moscow', 'москва'),
  ('novgorod', 'новгород'),
  ('irkutsk', 'иркутск'),
  ('kazan', 'казань'),
  ('omsk', 'омск');
 
 
SELECT
  (SELECT city_ru FROM cities WHERE city_from = city_eng) AS 'ru_name_from',
  (SELECT city_ru FROM cities WHERE city_to = city_eng) AS 'ru_name_to'
FROM
  fligths;





