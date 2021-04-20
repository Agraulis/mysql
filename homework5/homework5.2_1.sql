/* Урок #5.
 * Тема "Агрегация данных" */

/* Задание # 1.
 * Подсчитайте средний возраст пользователей в таблице users.
*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) age FROM users; 