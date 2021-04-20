	/* Урок #11.1. */

/* Задание # 2.
 *  Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/



INSERT INTO users (name)
SELECT u2.name 
FROM users u2 
    JOIN users u3
    JOIN users u ;	-- и так 6 раз, чтобы получить 10^6 новых записей:)