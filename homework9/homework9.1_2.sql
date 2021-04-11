	/* Урок #9.1. */

/* Задание # 2.
 * Создайте представление, которое выводит название name товарной позиции из таблицы products
 *  и соответствующее название каталога name из таблицы catalogs.
*/

/*
 * сделаем то же самое, только для БД vk:
 * Создайте представление, которое выводит название name товарной позиции из таблицы media_types
 * и соответствующее название  file_name из таблицы media.
 */	
DROP VIEW IF EXISTS media_and_types;
CREATE VIEW media_and_types AS
(SELECT m.file_name, mt.name FROM media AS m
JOIN 
media_types AS mt
ON m.id = mt.id);

-- проверка
SELECT * FROM media_and_types;
	