/* Урок #5.
 * Тема "Агрегация данных" */

/* Задание # 3.
 * Подсчитайте произведение чисел в столбце таблицы.
*/

DROP TABLE IF EXISTS multiply;

CREATE TABLE multiply (
  id INT);
 
INSERT INTO
  multiply (id)
VALUES (1), (2), (3), (4), (5);
SELECT exp(SUM(log(id))) res FROM multiply;
