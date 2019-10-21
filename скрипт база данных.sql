
DROP DATABASE IF EXISTS coursera;
CREATE DATABASE IF NOT EXISTS coursera;
USE coursera;

-- таблица статус users (студент,преподователь,корпоративное обучение)
CREATE TABLE users_status(id SERIAL,
name VARCHAR(255)  UNIQUE NOT NULL);


-- таблица пользователей users
CREATE TABLE users(id SERIAL,
login VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
`password` CHAR(255) NOT NULL,
user_status_id BIGINT(20) UNSIGNED DEFAULT 1, 
photo_id BIGINT(20) DEFAULT NULL, 
created_at datetime DEFAULT CURRENT_TIMESTAMP,
updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
ALTER TABLE users
ADD CONSTRAINT users_users_status_id_fk 
FOREIGN KEY (user_status_id) REFERENCES users_status(id);


-- таблица photo содержит фото для каталогов пользователей
CREATE TABLE photo(id SERIAL,
filename VARCHAR(255) NOT NULL);

-- таблица городов towns
CREATE TABLE towns(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица пол sex
CREATE TABLE sex(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);


-- таблица профилей пользователей profiles
CREATE TABLE profiles(id SERIAL,
user_id BIGINT(20)  UNSIGNED UNIQUE NOT NULL,
first_name VARCHAR(255),
last_name VARCHAR(255),
photo_id BIGINT(20) UNSIGNED,
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
FOREIGN KEY (hometown_id) REFERENCES towns(id)
ON DELETE SET NULL,
ADD CONSTRAINT profiles_sex_id_fk 
FOREIGN KEY (sex_id) REFERENCES sex(id)
ON DELETE SET NULL;



-- таблица уровень сложности
CREATE TABLE levels(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица образования опыт работы пользователей work_experience
CREATE TABLE work_experience(id SERIAL,
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
confidentiality_id BIGINT(20) UNSIGNED DEFAULT 1);


-- таблица карьера career
CREATE TABLE career(id SERIAL,
user_id BIGINT(20) UNSIGNED UNIQUE NOT NULL,
required_skills VARCHAR(255),
wish_professional VARCHAR(255),
employment_id BIGINT(20) UNSIGNED,
wish_experience_id  BIGINT(20) UNSIGNED,
confidentiality_id BIGINT(20) UNSIGNED DEFAULT 1);


-- таблица занятость employments
CREATE TABLE employments(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица Оперативный сотрудник или руководитель statuses_worker
CREATE TABLE statuses_worker(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица уровень образдвания levels_education
CREATE TABLE levels_education(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица уровень опыт experience
CREATE TABLE experience(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица уровень конфидициальности confidentiality
CREATE TABLE confidentiality(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица каталог обучения catalog
CREATE TABLE catalogs(id SERIAL,
name VARCHAR(255),
catalog_id BIGINT(20) UNSIGNED DEFAULT NULL, -- обеспечение вложенности каталогов
photo_id BIGINT(20) UNSIGNED DEFAULT NULL);
ALTER TABLE catalogs ADD CONSTRAINT catalogs_photo_id_fk 
FOREIGN KEY (photo_id) REFERENCES photo(id)
ON DELETE SET NULL;

-- таблица курсов обучения courses
CREATE TABLE courses(id SERIAL,
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
CREATE TABLE languages(id SERIAL,
name VARCHAR(255) UNIQUE NOT NULL);

-- таблица языков курсов language_courses
CREATE TABLE languages_courses(id SERIAL,
courses_id BIGINT(20) UNSIGNED,
language_id BIGINT(20) UNSIGNED,
UNIQUE key(courses_id,language_id)
);

-- таблица преподователей курса Teachers
CREATE TABLE teachers(id SERIAL,
user_id BIGINT(20) UNSIGNED,
courses_id BIGINT(20) UNSIGNED,
UNIQUE key(courses_id,user_id)
);


-- таблица курсы user 
CREATE TABLE users_courses(id SERIAL,
user_id BIGINT(20) UNSIGNED NOT NULL,
courses_id BIGINT(20) UNSIGNED NOT NULL,
progress TINYINT DEFAULT 0,
date_began datetime DEFAULT CURRENT_TIMESTAMP,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
UNIQUE key(courses_id,user_id));



-- таблица likes курсы  
CREATE TABLE likes_courses(id SERIAL,
user_id BIGINT(20) UNSIGNED NOT NULL,
courses_id BIGINT(20) UNSIGNED NOT NULL,
rating TINYINT(1) NOT NULL,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
UNIQUE key(courses_id,user_id));

ALTER TABLE likes_courses ADD CONSTRAINT likes_courses_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE;
ALTER TABLE likes_courses ADD CONSTRAINT likes_courses_courses_id_fk 
FOREIGN KEY (courses_id) REFERENCES courses(id)
ON DELETE CASCADE;


-- таблица messages сообщения по курсу  
CREATE TABLE messages(id SERIAL,
user_id BIGINT(20) UNSIGNED NOT NULL,
courses_id BIGINT(20) UNSIGNED NOT NULL,
title VARCHAR(255) NOT NULL,
body TEXT,
created_at datetime DEFAULT CURRENT_TIMESTAMP);
ALTER TABLE messages ADD CONSTRAINT messages_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE;
ALTER TABLE messages ADD CONSTRAINT messages_courses_id_fk 
FOREIGN KEY (courses_id) REFERENCES courses(id)
ON DELETE CASCADE;


ALTER TABLE work_experience
ADD CONSTRAINT work_experience_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
 ADD CONSTRAINT work_experience_level_education_id_fk 
FOREIGN KEY (level_education_id) REFERENCES levels_education(id)
ON DELETE SET NULL,
 ADD CONSTRAINT work_experience_status_worker_id_fk 
FOREIGN KEY (status_worker_id) REFERENCES statuses_worker(id)
ON DELETE SET NULL,
ADD CONSTRAINT work_experience_employment_id_fk 
FOREIGN KEY (employment_id) REFERENCES employments(id)
ON DELETE SET NULL,
 ADD CONSTRAINT work_experience_work_experience_id_fk 
FOREIGN KEY (work_experience_id) REFERENCES experience(id)
ON DELETE SET NULL,
ADD CONSTRAINT work_experience_work_confidentiality_id_fk 
FOREIGN KEY (confidentiality_id) REFERENCES confidentiality(id)
ON DELETE SET NULL;

ALTER TABLE career
ADD CONSTRAINT career_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
 ADD CONSTRAINT career_employment_id_fk 
FOREIGN KEY (employment_id) REFERENCES employments(id)
ON DELETE SET NULL,
ADD CONSTRAINT career_wish_experience_id_fk 
FOREIGN KEY (wish_experience_id) REFERENCES experience(id)
ON DELETE SET NULL,
ADD CONSTRAINT career_work_confidentiality_id_fk 
FOREIGN KEY (confidentiality_id) REFERENCES confidentiality(id)
ON DELETE SET NULL;

ALTER TABLE courses ADD CONSTRAINT courses_catalog_id_fk 
FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
ON DELETE SET NULL,
 ADD CONSTRAINT courses_photo_id_fk 
FOREIGN KEY (photo_id) REFERENCES photo(id)
ON DELETE SET NULL,
ADD CONSTRAINT courses_level_id_fk 
FOREIGN KEY (level_id) REFERENCES levels(id)
ON DELETE SET NULL;


ALTER TABLE languages_courses ADD CONSTRAINT courses_courses_id_fk 
FOREIGN KEY (courses_id) REFERENCES courses(id)
ON DELETE CASCADE,
 ADD CONSTRAINT courses_language_id_fk 
FOREIGN KEY (language_id) REFERENCES languages(id)
ON DELETE CASCADE;

ALTER TABLE teachers ADD CONSTRAINT teachers_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
 ADD CONSTRAINT teachers_courses_id_fk 
FOREIGN KEY (courses_id) REFERENCES courses(id)
ON DELETE CASCADE;

ALTER TABLE users_courses ADD CONSTRAINT users_courses_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE,
 ADD CONSTRAINT users_courses_courses_id_fk 
FOREIGN KEY (courses_id) REFERENCES courses(id)
ON DELETE CASCADE;


CREATE UNIQUE INDEX users_email_uq ON users(email);
CREATE UNIQUE INDEX users_login_uq ON users(login);
CREATE INDEX courses_catalog_uq ON courses(id,catalog_id);
CREATE INDEX courses_photo_uq ON courses(id,photo_id);
CREATE INDEX users_courses_courses_uq ON users_courses(user_id,courses_id);


--  тригер Таблицы users
/*CREATE DEFINER = CURRENT_USER TRIGGER `coursera`.`users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW
BEGIN
INSERT INTO profiles (user_id) VALUE (NEW.id);
INSERT INTO career (user_id) VALUE (NEW.id);
INSERT INTO work_experience (user_id) VALUE (NEW.id);
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





