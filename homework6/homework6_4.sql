	/* Урок #6. */

/* Задание # 4.
 * Найти пользователя, который проявляет наименьшую активность в использовании социальной сети.
*/

SELECT 
  CONCAT(first_name, ' ', last_name) AS user, 
  (SELECT COUNT(*) FROM posts_likes WHERE posts_likes.user_id = users.id) + 
  (SELECT COUNT(*) FROM media WHERE media.user_id = users.id) + 
  (SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS overall_activity 
FROM users
ORDER BY overall_activity
LIMIT 1;
