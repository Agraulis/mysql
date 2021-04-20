	/* Урок #9.3. */

/* Задание # 2.
 * В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 * Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают 
 * неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей 
 * или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/

-- будем работать с БД example, таблицей users, колонки name и birthday_at
	
DROP TRIGGER IF EXISTS check_user;

DELIMITER //
-- аналогичный триггер будет и для AFTER UPDATE
CREATE TRIGGER check_user BEFORE INSERT ON users
FOR EACH ROW 
	BEGIN
		DECLARE user_name VARCHAR(255);
  		DECLARE b_day DATE;
		SELECT NEW.name, NEW.birthday_at
			INTO user_name, b_day FROM users ORDER BY users.created_at  DESC LIMIT 1;
		IF (ISNULL(user_name) AND ISNULL(b_day))
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Anonymous detected';
		END IF;
	END//

DELIMITER ;

-- разрешит
INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES ('qwqw', NULL, curtime(), curtime());

-- разрешит
INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES (NULL, '1999-01-01', curtime(), curtime());

-- запретит
INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES (NULL, NULL, curtime(), curtime());

SELECT * FROM users;
		