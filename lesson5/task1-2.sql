#Таблица users была неудачно спроектирована. 
#Записи created_at и updated_at были заданы типом VARCHAR и в них 
#долгое время помещались значения в формате 20.10.2017 8:10. 
#Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

DROP DATABASE IF EXISTS testDB5_1_2;
CREATE DATABASE testDB5_1_2 CHARACTER SET utf8;

USE testDB5_1_2;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255) DEFAULT '2021-05-28 10:57',
  updated_at VARCHAR(255) DEFAULT '2021-05-30 12:42'
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

ALTER TABLE users CHANGE COLUMN created_at created_at DATETIME;
ALTER TABLE users CHANGE COLUMN updated_at updated_at DATETIME;

SELECT * FROM users;

SELECT column_name,data_type FROM information_schema.columns where table_schema = 'testDB5_1_2' and table_name = 'users'

