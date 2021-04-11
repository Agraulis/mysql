/* Урок #6. */

/* Задание # 1.
 * Пусть задан некоторый пользователь.
 * Найдите человека, который больше всех общался с нашим пользователем, 
 * иначе, кто написал пользователю наибольшее число сообщений. (можете взять пользователя с любым id).
*/

/*
 * будем анализировать случайного пользователя, который получил хотя бы 1 сообщение
 */
-- SELECT to_user_id FROM messages ORDER BY RAND() LIMIT 1;


SELECT COUNT(*) AS total, from_user_id
FROM messages 
WHERE to_user_id = (SELECT to_user_id FROM messages ORDER BY RAND() LIMIT 1) 
GROUP BY from_user_id
ORDER BY total DESC LIMIT 1;



