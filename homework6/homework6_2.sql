	/* Урок #6. */

/* Задание # 2.
 * Подсчитать общее количество лайков на посты, которые получили пользователи младше 18 лет.
*/
-- не совсем понял решение, поэтому подсмотрел в разборе дз
SELECT COUNT(*)
FROM posts_likes
WHERE post_id IN (SELECT id	FROM posts WHERE user_id IN 
					(SELECT user_id	FROM profiles 
					WHERE YEAR(CURDATE()) - YEAR(birthday) < 18)
					);
	