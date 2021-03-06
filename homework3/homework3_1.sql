/* Урок #3. */

/* Задание # 1.
 * Проанализировать структуру БД vk с помощью скрипта, 
 * который мы создали на занятии (vk-lesson.sql), и внести предложения 
 * по усовершенствованию (если такие идеи есть). Создайте у себя БД vk с помощью скрипта 
 * из материалов урока. Напишите пожалуйста, всё ли понятно по структуре. 
 * Примечание: vk-lesson.sql - скрипт, который мы писали на уроке, vk.sql - дамп таблицы vk.
*/

/*
 * БД создал. По структуре все понятно. Были небольшие проблемы с DBeaver 
 * (не получается подключится к localhost через root, подключаюсь через пользователя с правами root'а)
 * Есть небольшие вопроы насчет дампа. Например, часть кода:
 */
 
-- * LOCK TABLES `communities` WRITE;
-- /*!40000 ALTER TABLE `communities` DISABLE KEYS */;
-- /*!40000 ALTER TABLE `communities` ENABLE KEYS */;
-- UNLOCK TABLES;
/*
 * 1. Что значит "!40000"?
 * 2. Эта структура представляет собой некий шаблон, ктр может быть наполнен командами
 * по редактированию таблицы communities? ";" после коментария будут игнорироваться?
 */
