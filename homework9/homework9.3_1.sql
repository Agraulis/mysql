	/* Урок #9.3.
	 * Практическое задание по теме “Хранимые процедуры и функции, триггеры" */

/* 
 * Задание # 1.
 * Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
 * в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу 
 * "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
 * с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/


DROP FUNCTION IF EXISTS hello;
delimiter //


CREATE FUNCTION hello ()
RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE greetings TEXT;
	DECLARE cur_hour INT;
	SET cur_hour = HOUR(CURTIME());
	CASE
	WHEN cur_hour BETWEEN 6 AND 12 THEN SET greetings = 'Доброе утро';
	WHEN cur_hour BETWEEN 12 AND 18 THEN SET greetings = 'Добрый день';
	WHEN cur_hour BETWEEN 18 AND 0 THEN SET greetings = 'Добрый вечер';
	WHEN cur_hour BETWEEN 0 AND 6 THEN SET greetings = 'Доброй ночи';
	
	END CASE; 
RETURN greetings;
END//

delimiter ;

SELECT hello();
