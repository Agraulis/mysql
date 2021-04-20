	/* Урок #5. */

/* Задание # 2.
 * Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
 * и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля 
 * к типу DATETIME, сохранив введённые ранее значения.
*/

/*
 * добавим вспомогательные столбцы,
 * с помощью функции STR_TO_DATE преобразуем формат VARCHAR в DATETIME, заполним этими даными новые столбцы,
 * удалим столбцы created_at и updated_at,
 * переименуем created_at_dt и updated_at_dt в created_at и updated_at
 */	
ALTER TABLE users ADD (created_at_dt DATETIME, 
					  updated_at_dt DATETIME);

ALTER TABLE users DROP created_at_dt;
					 
UPDATE users
SET created_at_dt = STR_TO_DATE(created_at, '%Y-%m-%d %H:%i:%s'),
    updated_at_dt = STR_TO_DATE(updated_at, '%Y-%m-%d %H:%i:%s');
   
ALTER TABLE users 
    DROP created_at, DROP updated_at, 
    RENAME COLUMN created_at_dt TO created_at, RENAME COLUMN updated_at_dt TO updated_at;
   
