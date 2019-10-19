USE coursera;
-- Популярные курсы
SELECT AVG(rating), level_education.name,learning.name
FROM likes_cours 
LEFT JOIN work_education ON work_education.user_id=likes_cours.user_id
LEFT JOIN level_education ON level_education.id=work_education.level_education_id
JOIN learning ON learning.id=likes_cours.learning_id
GROUP BY learning.name;

#DROP FUNCTION IF EXISTS date_end_course; 

-- курсы пользователя  
SELECT learning.name, progress,date_end(users_cours.date_began,learning.len_course,progress) 
FROM  users_cours
JOIN learning ON learning.id=users_cours.learning_id
JOIN users ON users.id=users_cours.user_id
WHERE users.login='Ivanov';

-- VIEW  course
CREATE VIEW course_info AS
SELECT learning.name as name,
learning.photo_id as photo,
learning.title as title,
learning.len_course,
level.name as level,
catalog.name as catalog_name 
FROM learning
JOIN catalog ON catalog.id=learning.catalog_id
JOIN level ON level.id=learning.level_id;

-- VIEW  profile
CREATE VIEW profile_user AS
SELECT pr.first_name as first_name,
town.name as hometown,
pr.last_name as last_name,
photo.filename as filename,
w_e.profession as profesional,
l_e.name as level
FROM profiles as pr
LEFT JOIN town ON town.id=pr.hometown_id
LEFT JOIN photo ON photo.target_id=pr.user_id
LEFT JOIN work_education AS w_e ON w_e.user_id=pr.user_id 
LEFT JOIN level_education AS l_e ON l_e.id=w_e.level_education_id










