# В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
# если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
# чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.

DROP DATABASE IF EXISTS testDB5_1_3;
CREATE DATABASE testDB5_1_3 CHARACTER SET utf8;

USE testDB5_1_3;


DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO storehouses_products
  (product_id, value)
VALUES
  (1, 100),
  (2, 3),
  (3, 0),
  (4, 35),
  (5, 0),
  (6, 11),
  (7, 400);

SELECT * FROM storehouses_products ORDER BY value = 0, value;



