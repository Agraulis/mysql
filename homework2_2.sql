/* Практическое задание #1. */

/* Задание # 2.
 * Создайте базу данных example, разместите в ней таблицу 
 * users, состоящую из двух столбцов, числового id и 
 * строкового name.
*/
-- создание БД 
CREATE DATABASE IF NOT EXISTS example;
-- выбор БД
use example;
-- создание таблицы и предварительное удаление
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя пользователя');
 -- добавление 3 строк в БД
INSERT INTO users VALUES
  (DEFAULT, 'user1'),
  (DEFAULT, 'user2'),
  (DEFAULT, 'user3');