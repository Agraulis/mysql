/* Урок #5.
 * Тема "Агрегация данных" */

/* Задание # 2.
 * Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

SELECT * FROM users;

SELECT
WEEKDAY(DATE_FORMAT(DATE_ADD(birthday_at, INTERVAL (YEAR(CURRENT_DATE()) - 
	YEAR(birthday_at)) YEAR), '%Y-%m-%d')) week_day,
COUNT(*) 
FROM users
GROUP BY week_day;
