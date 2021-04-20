	/* Урок #9.1. */

/* Задание # 4.
 * Пусть имеется любая таблица с календарным полем created_at. 
 * Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
*/

-- возьмем готовую таблицу из vk и скопируем в msg
DROP TABLE IF EXISTS msg;
CREATE TABLE msg SELECT * FROM vk.messages;

-- решим задание с использованием представления
DROP VIEW IF EXISTS msg_view_fresh_5;
CREATE VIEW msg_view_fresh_5 
AS SELECT * FROM msg ORDER BY msg.created_at DESC LIMIT 5;

DELETE msg FROM msg
WHERE msg.id NOT IN (SELECT id FROM msg_view_fresh_5);

SELECT * FROM msg;
