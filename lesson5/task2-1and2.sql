DROP DATABASE IF EXISTS testDB5_2_1;
CREATE DATABASE testDB5_2_1 CHARACTER SET utf8;

USE testDB5_2_1;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения'
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
 

#Подсчитайте средний возраст пользователей в таблице users.
SELECT
  'Средний возраст',
  FLOOR( AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)) AS age
FROM
  users;

#Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
#Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT
  COUNT(*) AS total,
  DAYOFWEEK(DATE_FORMAT(birthday_at,'2021-%m-%d')) AS day_of_week
FROM
  users
GROUP BY
  day_of_week;

