	/* Урок #9.1. */

/* Задание # 1.
 * В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
 * Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
*/

-- подготовка
CREATE DATABASE IF NOT EXISTS shop;
USE shop;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO users VALUES
(NULL, 'John');

CREATE DATABASE IF NOT EXISTS sample;
USE sample;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

-- сама транзакция
START TRANSACTION; 
INSERT INTO sample.users (
SELECT * FROM shop.users u WHERE id = 1);
COMMIT;

-- проверка
SELECT * FROM shop.users u
UNION ALL 
SELECT * FROM sample.users u;