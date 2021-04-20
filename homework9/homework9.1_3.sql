	/* Урок #9.1. */

/* Задание # 3.
 * Пусть имеется таблица с календарным полем created_at. 
 * В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', 
 * '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, 
 * выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.
*/

-- создадим основную таблицу
DROP DATABASE IF EXISTS task7_3;
CREATE DATABASE task7_3;
USE task7_3;
DROP TABLE IF EXISTS august;
CREATE TABLE august (
created_at date);

-- заполним ее
INSERT INTO august VALUES 
('2018-08-01'), ('2016-08-04'), 
('2018-08-16'), ('2018-08-17');

-- создадим вспомогательную таблицу и заполним ее с помощью процедуры
DROP TABLE IF EXISTS august_2018;
CREATE TABLE august_2018 (
day_of_aug date);

DROP PROCEDURE IF EXISTS filldates;
DELIMITER //
CREATE PROCEDURE filldates(dateStart DATE, dateEnd DATE)
BEGIN

      WHILE dateStart <= dateEnd DO
        INSERT INTO august_2018 (day_of_aug) VALUES (dateStart);
        SET dateStart = date_add(dateStart, INTERVAL 1 DAY);
      END WHILE;
    END;//

DELIMITER ;
 
-- непосредственно вызов процедуры для заполнения вспомогательной таблицы
CALL filldates('2018-08-01','2018-08-31');

-- искомый запрос
SELECT full_aug.day_of_aug, 
(IF(aug.created_at = full_aug.day_of_aug, 1, 0)) AS is_contains 
FROM august AS aug
RIGHT JOIN 
august_2018 AS full_aug
ON aug.created_at = full_aug.day_of_aug
