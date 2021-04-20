	/* Урок #5. */

/* Задание # 5.
 * Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM
 * catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
*/

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY field(id, 5, 1, 2);
	