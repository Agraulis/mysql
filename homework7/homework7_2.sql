	/* Урок #7. */

/* Задание # 2.
 * Выведите список товаров products и разделов catalogs, который соответствует товару.
*/
	
	
SELECT name,
(SELECT name FROM catalogs WHERE id = products.catalog_id) AS category
FROM products;
	