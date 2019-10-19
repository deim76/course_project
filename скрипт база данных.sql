CREATE DATABASE IF NOT EXISTS coursera;

USE coursera;

DROP TABLES IF EXISTS users, user_status, profiles,photo,target,sex,town,
work_education,career, department,employment,status_worker,level_education,experience,
confidesion,catalog, learning,language,level,language_learning,teachers,users_cours,likes_cours, Messages;

-- таблица пользователей users
CREATE TABLE users(id SERIAL,
login VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
`password` CHAR(255) NOT NULL,
user_status_id BIGINT(20) UNSIGNED DEFAULT 1, 
created_at datetime DEFAULT CURRENT_TIMESTAMP,
updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);



-- таблица статус users (студент,преподователь,корпоративное обучение)
CREATE TABLE user_status(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица photo содержит фото для каталогов пользователей
CREATE TABLE photo(id SERIAL,
target_id BIGINT(20) UNSIGNED  NOT NULL,
#type_target_id BIGINT(20) UNSIGNED NOT NULL,
filename VARCHAR(255) NOT NULL);

-- таблица городов town
CREATE TABLE town(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица профилей пользователей profiles
CREATE TABLE profiles(id SERIAL,
user_id BIGINT(20)  UNSIGNED UNIQUE NOT NULL,
first_name VARCHAR(255),
last_name VARCHAR(255),
photo_id BIGINT(20)  UNSIGNED,
sex_id BIGINT(20) UNSIGNED,
hometown_id BIGINT(20) UNSIGNED,
birthday DATE);
ALTER TABLE profiles
ADD CONSTRAINT profiles_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
ADD CONSTRAINT profiles_photo_id_fk 
FOREIGN KEY (photo_id) REFERENCES photo(id)
ON DELETE SET NULL,
ADD CONSTRAINT profiles_hometown_id_fk 
FOREIGN KEY (hometown_id) REFERENCES town(id)
ON DELETE SET NULL;




-- таблица target 
CREATE TABLE target(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);


-- таблица пол sex
CREATE TABLE sex(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);


-- таблица уровень сложности
CREATE TABLE level(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица образования опыт работы пользователей work_education
CREATE TABLE work_education(id SERIAL,
user_id BIGINT(20) UNSIGNED UNIQUE NOT NULL,
level_education_id BIGINT(20)  UNSIGNED,
university VARCHAR(255),
status_worker_id BIGINT(20)  UNSIGNED,
i_am_student BOOL,
employment_id BIGINT(20) UNSIGNED,
department VARCHAR(255),
employer VARCHAR(255),
profession VARCHAR(255),
work_experience_id  BIGINT(20) UNSIGNED,
is_now_employer BOOL,
confidesion_id BIGINT(20) UNSIGNED DEFAULT 1);


-- таблица карьера career
CREATE TABLE career(id SERIAL,
user_id BIGINT(20) UNSIGNED UNIQUE NOT NULL,
required_skills VARCHAR(255),
wish_professional VARCHAR(255),
#employment VARCHAR(255),
employment_id BIGINT(20) UNSIGNED,
#professional  VARCHAR(10),
#employer VARCHAR(255),
#profession VARCHAR(255),
wish_experience_id  BIGINT(20) UNSIGNED,
confidesion_id BIGINT(20) UNSIGNED DEFAULT 1);


-- таблица занятость employment
CREATE TABLE employment(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица Оперативный сотрудник или руководитель status_worker
CREATE TABLE status_worker(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица уровень образдвания level_education
CREATE TABLE level_education(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица уровень опыт experience
CREATE TABLE experience(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица уровень конфидициальности confidesion
CREATE TABLE confidesion(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица каталог обучения catalog
CREATE TABLE catalog(id SERIAL,
name VARCHAR(255),
catalog_id BIGINT(20) UNSIGNED DEFAULT NULL, -- обеспечение вложенности каталогов
photo_id BIGINT(20) UNSIGNED DEFAULT NULL);
ALTER TABLE catalog ADD CONSTRAINT catalog_photo_id_fk 
FOREIGN KEY (photo_id) REFERENCES photo(id)
ON DELETE SET NULL;

-- таблица курсов обучения learning
CREATE TABLE learning(id SERIAL,
name VARCHAR(255),
catalog_id BIGINT(20) UNSIGNED,
photo_id BIGINT(20) UNSIGNED,
title VARCHAR(255),
level_id BIGINT(20) UNSIGNED,
time_execute VARCHAR(255),
how_take VARCHAR(255),
len_course INT(10) NOT NULL,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);




-- таблица языков language
CREATE TABLE language(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица языков курсов language_learning
CREATE TABLE language_learning(id SERIAL,
learning_id BIGINT(20) UNSIGNED,
language_id BIGINT(20) UNSIGNED,
UNIQUE key(learning_id,language_id)
);


-- таблица преподователей курса Teachers
CREATE TABLE teachers(id SERIAL,
user_id BIGINT(20) UNSIGNED,
learning_id BIGINT(20) UNSIGNED,
UNIQUE key(learning_id,user_id)
);



-- таблица курсы user 
CREATE TABLE users_cours(id SERIAL,
user_id BIGINT(20) UNSIGNED NOT NULL,
learning_id BIGINT(20) UNSIGNED NOT NULL,
progress TINYINT DEFAULT 0,
date_began datetime DEFAULT CURRENT_TIMESTAMP,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
UNIQUE key(learning_id,user_id));



-- таблица likes курсы  
CREATE TABLE likes_cours(id SERIAL,
user_id BIGINT(20) UNSIGNED NOT NULL,
learning_id BIGINT(20) UNSIGNED NOT NULL,
rating TINYINT(1) NOT NULL,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
UNIQUE key(learning_id,user_id));

ALTER TABLE likes_cours ADD CONSTRAINT likes_cours_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE;
ALTER TABLE likes_cours ADD CONSTRAINT likes_cours_learning_id_fk 
FOREIGN KEY (learning_id) REFERENCES learning(id)
ON DELETE CASCADE;


-- таблица Messages сообщения по курсу  
CREATE TABLE Messages(id SERIAL,
user_id BIGINT(20) UNSIGNED NOT NULL,
learning_id BIGINT(20) UNSIGNED NOT NULL,
title VARCHAR(255) NOT NULL,
body TEXT,
created_at datetime DEFAULT CURRENT_TIMESTAMP);
ALTER TABLE Messages ADD CONSTRAINT Messages_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE;
ALTER TABLE Messages ADD CONSTRAINT Messages_learning_id_fk 
FOREIGN KEY (learning_id) REFERENCES learning(id)
ON DELETE CASCADE;


ALTER TABLE work_education
ADD CONSTRAINT work_education_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
 ADD CONSTRAINT work_education_level_education_id_fk 
FOREIGN KEY (level_education_id) REFERENCES level_education(id)
ON DELETE SET NULL,
 ADD CONSTRAINT work_education_status_worker_id_fk 
FOREIGN KEY (status_worker_id) REFERENCES status_worker(id)
ON DELETE SET NULL,
ADD CONSTRAINT work_education_employment_id_fk 
FOREIGN KEY (employment_id) REFERENCES employment(id)
ON DELETE SET NULL,
 ADD CONSTRAINT work_education_work_experience_id_fk 
FOREIGN KEY (work_experience_id) REFERENCES experience(id)
ON DELETE SET NULL,
ADD CONSTRAINT work_education_work_confidesion_id_fk 
FOREIGN KEY (confidesion_id) REFERENCES confidesion(id)
ON DELETE SET NULL;

ALTER TABLE career
ADD CONSTRAINT career_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
 ADD CONSTRAINT career_employment_id_fk 
FOREIGN KEY (employment_id) REFERENCES employment(id)
ON DELETE SET NULL,
ADD CONSTRAINT career_wish_experience_id_fk 
FOREIGN KEY (wish_experience_id) REFERENCES experience(id)
ON DELETE SET NULL,
ADD CONSTRAINT career_work_confidesion_id_fk 
FOREIGN KEY (confidesion_id) REFERENCES confidesion(id)
ON DELETE SET NULL;

ALTER TABLE learning ADD CONSTRAINT learning_catalog_id_fk 
FOREIGN KEY (catalog_id) REFERENCES catalog(id)
ON DELETE SET NULL,
 ADD CONSTRAINT learning_photo_id_fk 
FOREIGN KEY (photo_id) REFERENCES photo(id)
ON DELETE SET NULL,
ADD CONSTRAINT learning_level_id_fk 
FOREIGN KEY (level_id) REFERENCES level_education(id)
ON DELETE SET NULL;

ALTER TABLE language_learning ADD CONSTRAINT learning_learning_id_fk 
FOREIGN KEY (learning_id) REFERENCES learning(id)
ON DELETE CASCADE,
 ADD CONSTRAINT learning_language_id_fk 
FOREIGN KEY (language_id) REFERENCES language(id)
ON DELETE CASCADE;

ALTER TABLE teachers ADD CONSTRAINT teachers_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
 ADD CONSTRAINT teachers_learning_id_fk 
FOREIGN KEY (learning_id) REFERENCES learning(id)
ON DELETE CASCADE;

ALTER TABLE users_cours ADD CONSTRAINT users_cours_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
 ADD CONSTRAINT users_cours_learning_id_fk 
FOREIGN KEY (learning_id) REFERENCES learning(id)
ON DELETE CASCADE;


CREATE UNIQUE INDEX users_email_uq ON users(email);
CREATE UNIQUE INDEX users_login_uq ON users(login);
CREATE INDEX learning_catalog_uq ON learning(id,catalog_id);
CREATE INDEX learning_photo_uq ON learning(id,photo_id);
CREATE INDEX users_cours_learning_uq ON users_cours(user_id,learning_id);


--  тригер Таблицы users
/*CREATE DEFINER = CURRENT_USER TRIGGER `coursera`.`users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW
BEGIN
INSERT INTO profiles (user_id) VALUE (NEW.id);
INSERT INTO career (user_id) VALUE (NEW.id);
INSERT INTO work_education (user_id) VALUE (NEW.id);
END*/

-- Функция
/*CREATE DEFINER=`root`@`localhost` FUNCTION `date_end`(date_began DATETIME,len_course INT,progress INT) RETURNS varchar(255) CHARSET utf8mb4
   NOT DETERMINISTIC
BEGIN
SET @data_end=adddate(date_began,len_course);
IF @data_end>now() AND progress<100 THEN 
RETURN 'Время прохождения курса истекло';
END IF;
RETURN concat('осталось ',datediff(now(),@data_end),' дней');
END*/





