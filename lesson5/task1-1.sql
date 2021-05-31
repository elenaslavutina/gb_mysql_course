# Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
#Заполните их текущими датой и временем.
DROP DATABASE IF EXISTS testDB5_1_1;
CREATE DATABASE testDB5_1_1 CHARACTER SET utf8;

USE testDB5_1_1;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT NULL,
  updated_at DATETIME DEFAULT NULL
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
 
 
UPDATE
  users 
SET
  created_at = NOW(),
  updated_at = NOW();

 
SELECT * FROM users;