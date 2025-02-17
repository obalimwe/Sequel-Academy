SELECT * FROM staff 
WHERE role = 'Principal';

SELECT * FROM staff 
WHERE role != 'Teacher';

SELECT count(*) AS total_number_of_staff FROM staff;

SELECT count(*) AS total_academic_departments FROM hod;

SELECT count(*) FROM students;

SELECT gender, COUNT(*) AS count 
FROM students GROUP BY gender;

SELECT *
FROM js_broadsheet
JOIN class ON js_broadsheet.class_id = class.class_id
JOIN students ON class.class_id = students.class_id;

