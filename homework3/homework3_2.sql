/* Урок #3. */

/* Задание # 2.
 * Придумать 2-3 таблицы для БД vk, которую мы создали на занятии (с перечнем полей, 
 * указанием индексов и внешних ключей). Прислать результат в виде скрипта *.sql.
*/

-- предполагаем, что БД существует, т.к. скрипт подразумевает модернизацию
USE vk;

-- создадим таблицу для постов
CREATE TABLE posts (
  post_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  txt TEXT NOT NULL,  
  author_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  edited_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_post_author FOREIGN KEY (author_id) REFERENCES users (id)
);

-- таблица связи постов и медиафайлов
CREATE TABLE post_media (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  post_id BIGINT UNSIGNED NOT NULL,
  media_id BIGINT UNSIGNED NOT NULL,
  INDEX fk_post_idx (post_id),
  INDEX fk_media_idx (media_id),
  CONSTRAINT fk_post_with_file FOREIGN KEY (post_id) REFERENCES posts (post_id),
  CONSTRAINT fk_media_in_post FOREIGN KEY (media_id) REFERENCES media (id)
);

-- лайки на посты пользователей
CREATE TABLE likes_posts (
  post_id BIGINT UNSIGNED NOT NULL,
  was_liked BOOL DEFAULT NULL,
  was_liked_by BIGINT UNSIGNED NOT NULL,
  CONSTRAINT fk_post_liked FOREIGN KEY (post_id) REFERENCES posts (post_id),
  CONSTRAINT fk_user_liked_post FOREIGN KEY (was_liked_by) REFERENCES users (id)
);

--  лайки на медиафайлы
CREATE TABLE likes_media (
  media_id BIGINT UNSIGNED NOT NULL,
  was_liked BOOL DEFAULT NULL,
  was_liked_by BIGINT UNSIGNED NOT NULL,
  CONSTRAINT fk_media_liked FOREIGN KEY (media_id) REFERENCES media (id),
  CONSTRAINT fk_user_liked_media FOREIGN KEY (was_liked_by) REFERENCES users (id)
);

--  черный список
CREATE TABLE black_list (
  ignoring_user BIGINT UNSIGNED NOT NULL,
  ignored_user BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (ignoring_user, ignored_user),
  is_ignoring BOOL DEFAULT NULL,
  CONSTRAINT fk_black_list_ignoring FOREIGN KEY (ignoring_user) REFERENCES users (id),
  CONSTRAINT fk_black_list_ignored FOREIGN KEY (ignored_user) REFERENCES users (id)
);

-- список чатов
CREATE TABLE chats (
  chat_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  chat_participant BIGINT UNSIGNED NOT NULL, 
  CONSTRAINT fk_chat_participant FOREIGN KEY (chat_participant) REFERENCES users (id)
);

-- список сообщений в чатах
CREATE TABLE chat_messages (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 1
  from_user_id BIGINT UNSIGNED NOT NULL, -- id = 1, Вася
  to_chat_id BIGINT UNSIGNED NOT NULL, -- id = 2, Петя
  txt TEXT NOT NULL,
  is_delivered BOOLEAN DEFAULT FALSE,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_message_to_chat FOREIGN KEY (to_chat_id) REFERENCES chats (chat_id),
  CONSTRAINT fk_message_author FOREIGN KEY (from_user_id) REFERENCES users (id)
  
);


