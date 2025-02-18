SELECT 
    students.student_id, 
    students.name, 
    students.class_id,
    SUM(js_broadsheet.CA1 + js_broadsheet.CA2 + js_broadsheet.Exam) AS total_score
FROM 
    students 
JOIN 
    js_broadsheet ON students.student_id = js_broadsheet.student_id
JOIN 
    subjects ON js_broadsheet.subject_id = subjects.subject_id
WHERE 
    students.class_id = 'JS1'  
GROUP BY 
    students.student_id, 
    students.name, 
    students.class_id;
