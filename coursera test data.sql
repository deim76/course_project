USE coursera;

-- Заполнение таблицы users
 delete from  users;
INSERT INTO users (login,email,password,user_status_id) VALUES ('Ivanov','ivanov@mail.ru',md5('password'),1),
('Main Read','read@google.com',md5('1223'),1),
('Hartman','hartman@google.com',md5('136'),2),
('Kim','kim_s@google.com',md5('136'),2);


-- заполнение таблицы фото
 delete from  photo;
INSERT INTO photo (id,filename) VALUES (1,'//photo1');
INSERT INTO photo (id,filename) VALUES (2,'//photo2');
INSERT INTO photo (id,filename) VALUES (3,'//photo3');
INSERT INTO photo (id,filename) VALUES (4,'//photo4');
INSERT INTO photo (id,filename) VALUES (5,'//photo5');


-- update таблицы profiles
UPDATE profiles SET last_name='Иванов' ,first_name='Иван',photo_id=1,sex_id=1,hometown_id=3,birthday='1951-01-23' WHERE user_id=(Select id  FROM users WHERE login='Ivanov');
UPDATE profiles SET last_name='Read' ,first_name='Main',photo_id=2,sex_id=1,hometown_id=5,birthday='1901-08-11' WHERE user_id=(Select id  FROM users WHERE login='Main Read');
UPDATE profiles SET last_name='Hartman' ,first_name='Joan',photo_id=3,sex_id=1,hometown_id=1,birthday='1982-01-23' WHERE user_id=(Select id  FROM users WHERE login='Hartman');
UPDATE profiles SET last_name='Kim' ,first_name='Susan',photo_id=4,sex_id=2,hometown_id=2,birthday='1993-12-23' WHERE user_id=(Select id  FROM users WHERE login='Kim');

-- update таблицы career
UPDATE career SET required_skills='работа в команде, ответственность' ,wish_professional='frontend разработчик',employment_id=1 WHERE user_id=(Select id  FROM users WHERE login='Ivanov');
UPDATE career SET required_skills='работа в команде, ответственность' ,wish_professional='Java',employment_id=2 WHERE user_id=(Select id  FROM users WHERE login='Main Read');
UPDATE career SET required_skills='аналитические способности, ответственность' ,wish_professional='Финансовый аналитик',employment_id=1 WHERE user_id=(Select id  FROM users WHERE login='Hartman');
UPDATE career SET required_skills='целеустремленность' ,wish_professional='менеджер',employment_id=1 WHERE user_id=(Select id  FROM users WHERE login='Kim');

-- update таблицы work_experience
UPDATE work_experience SET level_education_id=2 ,university='СПБГУ',status_worker_id=2,i_am_student=0,employment_id=2,department='Безопасность сетей',
employer='ООО Одуванчик',profession='настройщик',is_now_employer=1 WHERE user_id=(Select id  FROM users WHERE login='Ivanov');
UPDATE work_experience SET level_education_id=2 ,university='СПБГУ',status_worker_id=2,i_am_student=0,employment_id=2,department='Безопасность сетей',
employer='ООО Ромашка',profession='разработчик',is_now_employer=2 WHERE user_id=(Select id  FROM users WHERE login='Read');
UPDATE work_experience SET level_education_id=2 ,university='ДВФУ',status_worker_id=3,i_am_student=1,employment_id=2,department='разработчик приложений',
employer='ООО Пион',profession='настройщик',is_now_employer=1 WHERE user_id=(Select id  FROM users WHERE login='Hartman');
UPDATE work_experience SET level_education_id=2 ,university='СПБГУ',status_worker_id=2,i_am_student=0,employment_id=2,department='Безопасность сетей',
employer='ООО Одуванчик',profession='менеджер',is_now_employer=1 WHERE user_id=(Select id  FROM users WHERE login='Kim');

-- заполнение таблицы courses
 DELETE FROM  courses;
INSERT INTO courses (name,catalog_id,photo_id,title,level_id,time_execute,how_take,len_course) 
VALUES ('Master of Computer Science in Data Science',3,5,'Deepen your knowledge and boost your career with a degree from a top-5 Computer Science graduate program in the U.S.',
1,'3 месяца','Бесплатно',100),
('Python для всех',3,5,'Learn to Program and Analyze Data with Python. Develop programs to gather, clean, analyze, and visualize data',
1,'3 месяца','Бесплатно',300),
('Online Master of Accounting (iMSA)',2,5,'analytics-minded professional',
1,'18-36 months','Бесплатно',600),
('Java для всех','3',5,'Learn to Program and Analyze Data with Python. Develop programs to gather, clean, analyze, and visualize data',
1,'18-36 months','Бесплатно',600);

-- заполнение таблицы языки курсов language_courses
 delete from  languages_courses;
 INSERT INTO languages_courses (courses_id,language_id) VALUES  
 ((Select id  FROM courses WHERE name='Java для всех'),1),((Select id  FROM courses WHERE name='Java для всех'),2),((Select id  FROM courses WHERE name='Java для всех'),3),
 ((Select id  FROM courses WHERE name='Python для всех'),1),((Select id  FROM courses WHERE name='Python для всех'),5),((Select id  FROM courses WHERE name='Online Master of Accounting (iMSA)'),3),
 ((Select id  FROM courses WHERE name='Master of Computer Science in Data Science'),1);

 
 -- заполнение таблицы курсов пользователя users_course
 delete from  users_courses;
 INSERT INTO users_courses (user_id,courses_id,progress,date_began) VALUES ((Select id  FROM users WHERE login='Ivanov'),(Select id  FROM courses WHERE name='Python для всех'),0,now()),
 ((Select id  FROM users WHERE login='Ivanov'),(Select id  FROM courses WHERE name='Java для всех'),10,'2019-01-01'),
 ((Select id  FROM users WHERE login='Ivanov'),(Select id  FROM courses WHERE name='Master of Computer Science in Data Science'),20,'2019-09-10'),
 ((Select id  FROM users WHERE login='Hartman'),(Select id  FROM courses WHERE name='Python для всех'),0,now()),
 ((Select id  FROM users WHERE login='Kim'),(Select id  FROM courses WHERE name='Online Master of Accounting (iMSA)'),0,now());
 
 -- заполнение таблицы рейтинг курсов likes_course
 delete from  likes_courses;
 INSERT INTO likes_courses (user_id,courses_id,rating) VALUES
 ((Select id  FROM users WHERE login='Ivanov'),(Select id  FROM courses WHERE name='Java для всех'),20),
 ((Select id  FROM users WHERE login='Ivanov'),(Select id  FROM courses WHERE name='Master of Computer Science in Data Science'),50),
 ((Select id  FROM users WHERE login='Hartman'),(Select id  FROM courses WHERE name='Python для всех'),80),
 ((Select id  FROM users WHERE login='Kim'),(Select id  FROM courses WHERE name='Online Master of Accounting (iMSA)'),100); 

 -- заполнение таблицы сообщений Messages 
 delete from  messages;
 INSERT INTO messages (user_id,courses_id,title,body) VALUES
 ((Select id  FROM users WHERE login='Ivanov'),(Select id  FROM courses WHERE name='Java для всех'),"Вопросы по курсу","не получается решение"),
 ((Select id  FROM users WHERE login='Ivanov'),(Select id  FROM courses WHERE name='Master of Computer Science in Data Science'),"Вопросы преподователю","не получается решение"),
 ((Select id  FROM users WHERE login='Hartman'),(Select id  FROM courses WHERE name='Python для всех'),"Вопросы преподователю","не получается решение"),
 ((Select id  FROM users WHERE login='Kim'),(Select id  FROM courses WHERE name='Online Master of Accounting (iMSA)'),'Вопросы преподователю',"не понятно"); 


