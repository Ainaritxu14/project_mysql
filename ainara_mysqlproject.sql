USE project_sql2;

INSERT INTO grades( grades, students_id)
VALUES (10, 2);

INSERT INTO grades(grades_students_id,grades_courses_id,grades)
VALUES (3, 3,9);

SELECT*
FROM courses;

SELECT*
FROM students;

SELECT*
FROM profesors;

SELECT*
FROM grades;


SELECT *
FROM grades
INNER JOIN profesors
ON grades.grades_profesors_id = profesors.profesors_id;

SELECT *
FROM courses
INNER JOIN grades
ON courses.courses_grades_id = grades.grades_id;

--media pruebas

SELECT AVG(grades_courses_id) FROM grades

#1 La nota media que otorga cada profesor EN CADA CURSO QUE IMPARTE

SELECT avg (grades) as media, grades_profesors_id, grades_courses_id
FROM grades
where grades_profesors_id 
GROUP BY grades_profesors_id, grades_courses_id

#2 Las mejores notas de cada estudiante


SELECT MAX(grades) AS BestGrades, grades_students_id
FROM grades
WHERE grades_students_id
GROUP BY grades_students_id 

--pruebas

SELECT grades_students_id, grades ,grades_courses_id
FROM grades
where grades_students_id
ORDER BY CAST(grades AS UNSIGNED) DESC;

#3 ordenar los estudiantes por los cursos en los que estan inscritos

SELECT grades_courses_id ,grades_students_id 
FROM grades
ORDER BY grades_courses_id ASC;

#4 resumen de los cursos y su media, ordenados desde el curso de media mas alta a baja

SELECT avg(grades) as media , grades_courses_id
FROM grades
GROUP BY grades_courses_id
ORDER BY media DESC

#5 Encontrar qué estudiante y profesor tienen más cursos en común

SELECT grades_students_id, grades_profesors_id , COUNT(grades_courses_id) AS num_common_courses
FROM grades
GROUP BY grades.grades_students_id, grades.grades_profesors_id
ORDER BY num_common_courses DESC
LIMIT 1;

--pruebas

SELECT grades_students_id, grades_profesors_id , COUNT(grades_courses_id) AS num_common_courses
FROM grades

JOIN profesors 
on grades.grades_profesors_id=profesors.profesors_id
join courses 
on grades.grades_courses_id= courses.courses_id
join students
on grades.grades_students_id=students.students_id

GROUP BY grades.grades_students_id, grades.grades_profesors_id
ORDER BY num_common_courses DESC
LIMIT 1;
