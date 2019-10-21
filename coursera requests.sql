USE coursera;
-- курсы по рейтингу
SELECT AVG(rating) as rating, levels_education.name,courses.name
FROM likes_courses 
LEFT JOIN work_experience ON work_experience.user_id=likes_courses.user_id
LEFT JOIN levels_education ON levels_education.id=work_experience.level_education_id
JOIN courses ON courses.id=likes_courses.courses_id
GROUP BY courses.name
ORDER BY rating DESC;


-- курсы пользователя  
SELECT courses.name, progress,date_end(users_courses.date_began,courses.len_course,progress) 
FROM  users_courses
JOIN courses ON courses.id=users_courses.courses_id
JOIN users ON users.id=users_courses.user_id
WHERE users.login='Ivanov';

-- VIEW  course
DROP VIEW IF EXISTS course_info;
CREATE VIEW course_info AS
SELECT courses.name as name,
courses.photo_id as photo,
courses.title as title,
courses.len_course,
levels.name as level,
catalogs.name as catalog_name 
FROM courses
JOIN catalogs ON catalogs.id=courses.catalog_id
JOIN levels ON levels.id=courses.level_id;

-- VIEW  profile
CREATE VIEW profile_user AS
SELECT pr.first_name as first_name,
towns.name as hometown,
pr.last_name as last_name,
photo.filename as filename,
w_e.profession as profesional,
l_e.name as level
FROM profiles as pr
LEFT JOIN towns ON towns.id=pr.hometown_id
LEFT JOIN photo ON photo.id=pr.user_id
LEFT JOIN work_experience AS w_e ON w_e.user_id=pr.user_id 
LEFT JOIN levels_education AS l_e ON l_e.id=w_e.level_education_id










