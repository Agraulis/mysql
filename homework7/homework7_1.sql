	/* Урок #7. */

/* Задание # 1.
 * Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

SELECT name 
FROM users
WHERE id IN (
	SELECT user_id FROM orders GROUP BY user_id
			);
	
