	/* Урок #11.1. */

/* Задание # 1.
 * Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
 * catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
 * идентификатор первичного ключа и содержимое поля name.
*/

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  table_name VARCHAR(255) COMMENT 'имя бд',
  pr_key_from_tbl INT UNSIGNED COMMENT 'первичный ключ таблицы [table_name]',
  table_field_name VARCHAR(255) COMMENT 'содержимое поля [name]'
) COMMENT = 'logs' ENGINE=Archive;

DROP TRIGGER IF EXISTS archivist_on_users;
DROP TRIGGER IF EXISTS archivist_on_catalogs;
DROP TRIGGER IF EXISTS archivist_on_products;

DELIMITER //
CREATE TRIGGER archivist_on_users AFTER INSERT ON users
FOR EACH ROW 
	BEGIN
		INSERT INTO logs (created_at, table_name, pr_key_from_tbl, table_field_name)
		VALUES (CURTIME(), 'users', NEW.id, NEW.name);
	END//

CREATE TRIGGER archivist_on_catalogs AFTER INSERT ON catalogs
FOR EACH ROW 
	BEGIN
		INSERT INTO logs (created_at, table_name, pr_key_from_tbl, table_field_name)
		VALUES (CURTIME(), 'catalogs', NEW.id, NEW.name);
	END//
	
CREATE TRIGGER archivist_on_products AFTER INSERT ON products
FOR EACH ROW 
	BEGIN
		INSERT INTO logs (created_at, table_name, pr_key_from_tbl, table_field_name)
		VALUES (CURTIME(), 'products', NEW.id, NEW.name);
	END//
DELIMITER ;

INSERT INTO users (name, birthday_at) VALUES
  ('userrr', '1990-10-05');
 
 INSERT INTO products
  (name, desсription, price, catalog_id)
VALUES
  ('Intelllll', 'Процессор.', 7890.00, 1);
 
 INSERT INTO catalogs VALUES
  (NULL, 'swords');
 
 SELECT *FROM logs;

