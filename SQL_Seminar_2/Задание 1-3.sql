USE vk;

/*2. Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)*/

DROP TABLE IF EXISTS comment;
CREATE TABLE comment (
    id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), -- можно будет даже не упоминать это поле при вставке

    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'комментарий к медиа файлу';

DROP TABLE IF EXISTS comment_to_media;
CREATE TABLE comment_to_media (
    id SERIAL,
    media_id BIGINT UNSIGNED NOT NULL,
    comment_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (comment_id) REFERENCES comment(id)
) COMMENT 'связь media и comment';

/*3. Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)*/

INSERT INTO `users` 
VALUES ('1','Иванов','Иван','ivan.ivan@yandex.ru','1','89222222222'),
    ('2','Петров','Петр','petrov.petr@yandex.ru','2','89111111111'),
    ('3','Вилкова','Вера','vilkova.vera@yandex.ru','3','89000000000'),
    ('4','Сидорова','Ксения','sidorova.ksenya@yandex.ru','4','89333333333'),
    ('5','Сталин','Иосив','stalin.iosiv@yandex.ru','5','89444444444'),
    ('6','Ленин','Владимир','lenin.vladimir@yandex.ru','6','89555555555'),
    ('7','Пунин','Владимир','putin.vladimir@yandex.ru','7','89666666666'),
    ('8','Великая','Елизавета','velikay.elizaveta@yandex.ru','8','89777777777'),
    ('9','Королева','Наташа','koroleva.natasha@yandex.ru','9','89888888888'),
    ('10','Княжна','Александра','knazna.alexandra@yandex.ru','10','89999999999');

INSERT INTO `profiles` 
VALUES ('1','М','2000-01-11',NULL,NOW(),'Москва'),
    ('2','М','2002-02-12',NULL,NOW(),'Сочи'),
    ('3','Ж','2001-03-13',NULL,NOW(),'Калининград'),
    ('4','Ж','2021-04-14',NULL,NOW(),'Киров'),
    ('5','М','2014-05-15',NULL,NOW(),'Киев'),
    ('6','М','2007-06-16',NULL,NOW(),'Архангельск'),
    ('7','М','2005-07-27',NULL,NOW(),'Санкт-Петербург'),
    ('8','Ж','2010-08-01',NULL,NOW(),'Владивосток'),
    ('9','Ж','2015-09-05',NULL,NOW(),'Воркута'),
    ('10','Ж','2020-10-07',NULL,NOW(),'Севастополь');
