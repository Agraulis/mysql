	/* Урок #7. */

/* Задание # 3.
 * Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.
*/

/*
 * Создадим БД как в примере (сокращенную версию)
 */
CREATE DATABASE fly;

USE fly;

DROP TABLE IF EXISTS flights;

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_en VARCHAR(255),
  to_en VARCHAR(255)
);

INSERT INTO flights VALUES
  (NULL, 'moscow', 'omsk'),
  (NULL, 'novgorod', 'kazan');

 DROP TABLE IF EXISTS label;

CREATE TABLE label (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255),
  name VARCHAR(255)
);

INSERT INTO label VALUES
  (NULL, 'moscow', 'Москва'),
  (NULL, 'omsk', 'Омск'),
  (NULL, 'novgorod', 'Новгород'),
  (NULL, 'kazan', 'Казань');
 
/*
 * Сам запрос
 */
SELECT (SELECT name FROM label WHERE label.label = flights.from_en) AS from_ru,
	   (SELECT name FROM label WHERE label.label = flights.to_en) AS to_ru
FROM flights
	