	/* Урок #6. */

/* Задание # 3.
 * Определить, кто больше поставил лайков (всего) - мужчины или женщины?
*/

SELECT
	(SELECT gender FROM profiles WHERE user_id = posts_likes.user_id) AS gender,
	COUNT(*) AS total
FROM posts_likes
WHERE like_type = 1
GROUP BY gender
ORDER BY total DESC
LIMIT 1;
	