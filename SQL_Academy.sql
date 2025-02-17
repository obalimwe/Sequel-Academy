CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    role VARCHAR(100)
);


INSERT INTO staff (name, role)
VALUES 
    ('Obalimwe Eno', 'Principal'),
    ('Sarah Ijoba', 'Vice Principal'),
    ('Akede Bosun', 'Registrar'),
    ('Toyosi Anthony', 'Counsellor'),
    ('Loveday Effiong', 'Bursar'),
    ('James Smith', 'Teacher'),
    ('Chinedu Okeke', 'Teacher'),
    ('Emily Johnson', 'Teacher'),
    ('Ngozi Nwosu', 'Teacher'),
    ('Michael Brown', 'Teacher'),
    ('Amina Bello', 'Teacher'),
    ('Sarah Williams', 'Teacher'),
    ('Temitope Adebayo', 'Teacher'),
    ('David Wilson', 'Teacher'),
    ('Ifeoma Obi', 'Teacher'),
    ('Jessica Davis', 'Teacher'),
    ('Bashir Abdullahi', 'Teacher'),
    ('Olivia Taylor', 'Teacher'),
    ('Chukwuemeka Eze', 'Teacher'),
    ('Liam Jones', 'Teacher'),
    ('Funke Akinyemi', 'Teacher'),
    ('Mia Clark', 'Teacher'),
    ('Emeka Nnamdi', 'Teacher'),
    ('Sophia Lewis', 'Teacher'),
    ('Adeola Ogunleye', 'Teacher'),
    ('Martha Nyam', 'Teacher'),
    ('Owo Ekade', 'Teacher'),
    ('John Itobo', 'Teacher'),
    ('Abia Ukwa', 'Teacher');
    
    SELECT * FROM staff;
    
    
CREATE TABLE class (
    class_id VARCHAR(5) PRIMARY KEY,
    form_teacher_id INT,
    FOREIGN KEY (form_teacher_id) REFERENCES staff(staff_id)
);



INSERT INTO class (class_id, form_teacher_id)
VALUES
('JSS1', 6),
('JSS2', 8),
('JSS3', 10),
('SS1A', 15),
('SS1B', 18),
('SS2A', 12),
('SS2B', 7),
('SS3A', 9),
('SS3B', 11);

ALTER TABLE staff
ADD gender VARCHAR(10);

UPDATE staff SET gender = 'Male' WHERE staff_id = 1;
UPDATE staff SET gender = 'Female' WHERE staff_id = 2;
UPDATE staff SET gender = 'Female' WHERE staff_id = 3;
UPDATE staff SET gender = 'Female' WHERE staff_id = 4;
UPDATE staff SET gender = 'Female' WHERE staff_id = 5;
UPDATE staff SET gender = 'Male' WHERE staff_id = 6;
UPDATE staff SET gender = 'Male' WHERE staff_id = 7;
UPDATE staff SET gender = 'Female' WHERE staff_id = 8;
UPDATE staff SET gender = 'Female' WHERE staff_id = 9;
UPDATE staff SET gender = 'Male' WHERE staff_id = 10;
UPDATE staff SET gender = 'Female' WHERE staff_id = 11;
UPDATE staff SET gender = 'Female' WHERE staff_id = 12;
UPDATE staff SET gender = 'Female' WHERE staff_id = 13;
UPDATE staff SET gender = 'Male' WHERE staff_id = 14;
UPDATE staff SET gender = 'Female' WHERE staff_id = 15;
UPDATE staff SET gender = 'Female' WHERE staff_id = 16;
UPDATE staff SET gender = 'Male' WHERE staff_id = 17;


UPDATE staff SET gender = 'Male' WHERE staff_id = 19;  -- Chukwuemeka Eze
UPDATE staff SET gender = 'Male' WHERE staff_id = 20;  -- Liam Jones
UPDATE staff SET gender = 'Female' WHERE staff_id = 21;  -- Funke Akinyemi
UPDATE staff SET gender = 'Female' WHERE staff_id = 22;  -- Mia Clark
UPDATE staff SET gender = 'Male' WHERE staff_id = 23;  -- Emeka Nnamdi
UPDATE staff SET gender = 'Female' WHERE staff_id = 24;  -- Sophia Lewis
UPDATE staff SET gender = 'Female' WHERE staff_id = 25;  -- Adeola Ogunleye
UPDATE staff SET gender = 'Female' WHERE staff_id = 26;  -- Martha Nyam
UPDATE staff SET gender = 'Male' WHERE staff_id = 27;  -- Owo Ekade
UPDATE staff SET gender = 'Male' WHERE staff_id = 28;  -- John Itobo
UPDATE staff SET gender = 'Male' WHERE staff_id = 29;  -- Abia Ukwa

CREATE TABLE hod(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    hod_id INT,
    FOREIGN KEY (hod_id) REFERENCES staff(staff_id)
);


INSERT INTO hod (name, hod_id)
VALUES
('Science', 13),
('Arts and Languages', 14),
('Humanities', 16),
('Social Science and Management', 17);



CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department_id VARCHAR(100)
);


INSERT INTO subjects ( name, department_id)
VALUES
('Mathematics', 1),
('English Language', 2),
('Biology', 1),
('Physics', 1),
('Chemistry', 1),
('Economics', 4),
('Geography', 1),
('History', 3),
('Literature in English', 2),
('Government', 3),
('Further Mathematics', 1),
('Agricultural Science', 1),
('Commerce', 4),
('Financial Accounting', 4),
('Technical Drawing', 1),
('Food and Nutrition', 1),
('Home Economics', 1),
('Fine Arts', 2),
('Computer Science', 1),
('Religious Studies', 3),
('Basic Science', 1),
('Social Studies', 3),
('Business Studies', 4),
('Christian Religious Studies', 3),
('Islamic Religious Studies', 3),
('Civic Education', 3),
('Cultural and Creative Arts', 2),
('Physical and Health Education', 1),
('French', 2),
('Igbo', 2);


CREATE TABLE class_assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    class VARCHAR(255),
    subject_id INT,
    FOREIGN KEY (teacher_id) REFERENCES staff(staff_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);


INSERT INTO class_assignments (teacher_id, class, subject_id)
VALUES
-- Assignments for Mathematics across levels
(6, 'JSS1', 1), (6, 'JSS2', 1), -- Mathematics teacher handles JSS1 & JSS2 for Mathematics

-- Assignments for English Language across SS levels that are not science-specific
(7, 'SS1B', 2), (7, 'SS2B', 2), (7, 'SS3B', 2), -- English Language teacher handles SS1B, SS2B, SS3B

-- Science subjects assigned to 'A' sections in Senior Secondary
(8, 'SS1A', 3), (8, 'SS2A', 3), (8, 'SS3A', 3), -- Biology teacher handles SS1A, SS2A, SS3A for Biology
(9, 'SS1A', 4), (9, 'SS2A', 4), (9, 'SS3A', 4), -- Physics teacher handles SS1A, SS2A, SS3A for Physics
(10, 'SS1A', 5), (10, 'SS2A', 5), (10, 'SS3A', 5), -- Chemistry teacher handles SS1A, SS2A, SS3A for Chemistry

-- Assignments for subjects exclusive to JSS
(19, 'JSS1', 23), (19, 'JSS2', 23), -- Business Studies (now only for JSS)
(20, 'JSS2', 18), (20, 'JSS3', 18), -- Fine Arts
(23, 'JSS1', 27), (23, 'JSS2', 27), -- Cultural and Creative Arts
(26, 'JSS1', 30), (26, 'JSS2', 30), -- Igbo (now only for JSS)

-- Additional subjects in SS that are not science-specific
(17, 'SS1B', 11), (17, 'SS2B', 11), (17, 'SS3B', 11), -- Further Mathematics
(21, 'SS1B', 19), (21, 'SS2B', 19), (21, 'SS3B', 19), -- Computer Science
(22, 'SS1B', 20), (22, 'SS2B', 20), (22, 'SS3B', 20), -- Religious Studies
(24, 'SS1B', 28), (24, 'SS2B', 28), (24, 'SS3B', 28), -- Physical and Health Education
(25, 'SS1B', 29), (25, 'SS2B', 29), (25, 'SS3B', 29); -- French



CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    class_id VARCHAR(5),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

UPDATE class
SET class_id = 'JS1'
WHERE class_id = 'JSS1';

UPDATE class
SET class_id = 'JS2'
WHERE class_id = 'JSS2';

UPDATE class
SET class_id = 'JS3'
WHERE class_id = 'JSS3';




INSERT INTO students (name, class_id)
VALUES
('Chinedu Okoro', 'JS1'),
('Amina Yusuf', 'JS1'),
('Ifeoma Eze', 'JS1'),
('Musa Abdullahi', 'JS1'),
('Joy Adelaja', 'JS1'),
('Samuel Chukwuma', 'JS1'),
('Maryam Bello', 'JS1'),
('Victor Okeke', 'JS1'),
('Fatima Mohammed', 'JS1'),
('Emeka Nwosu', 'JS1'),
('Halima Musa', 'JS2'),
('Sunday Adegoke', 'JS2'),
('Ngozi Ibe', 'JS2'),
('Uchechi Amadi', 'JS2'),
('Sani Ahmed', 'JS2'),
('Blessing Ojo', 'JS2'),
('Ibrahim Aliyu', 'JS2'),
('Chioma Duru', 'JS2'),
('Segun Fashola', 'JS2'),
('Kemi Afolabi', 'JS2'),
('Tolu Smith', 'JS3'),
('Adeola Oke', 'JS3'),
('Kolade Alabi', 'JS3'),
('Simi Adeleke', 'JS3'),
('Yusuf Lawal', 'JS3'),
('Chiagozie Onwuka', 'JS3'),
('Zainab Ali', 'JS3'),
('Wale Thomas', 'JS3'),
('Gbenga Falade', 'JS3'),
('Linda Ike', 'JS3'),
-- Senior Secondary School A and B (SS1A, SS1B, SS2A, SS2B, SS3A, SS3B)
('Obinna Eze', 'SS1A'),
('Ismail Mohammed', 'SS1A'),
('Esther Udom', 'SS1A'),
('Kelechi Obi', 'SS1A'),
('Nneka Okonkwo', 'SS1A'),
('Abdul Basit', 'SS1A'),
('Amara Chukwu', 'SS1A'),
('Yemi Osinbajo', 'SS1A'),
('Joy Okoye', 'SS1A'),
('Kola Nut', 'SS1A'),
('Adaobi Mba', 'SS1B'),
('Chisom Philips', 'SS1B'),
('Femi Coker', 'SS1B'),
('Umar Farouk', 'SS1B'),
('Sophia Aliyu', 'SS1B'),
('Bayo Martins', 'SS1B'),
('Oluchi Orji', 'SS1B'),
('Hassan Abubakar', 'SS1B'),
('Rita Dominic', 'SS1B'),
('Kenny Adebayo', 'SS1B'),
('Emmanuella Okon', 'SS2A'),
('George Akpan', 'SS2A'),
('Shola Ameobi', 'SS2A'),
('Janet Akande', 'SS2A'),
('Tony Umez', 'SS2A'),
('Omotola Jalade', 'SS2A'),
('Stephen Keshi', 'SS2A'),
('Precious Adebayo', 'SS2A'),
('Sandra Eze', 'SS2A'),
('Olu Jacobs', 'SS2A'),
('Ugochukwu Nnamdi', 'SS2B'),
('Ronke Lawal', 'SS2B'),
('Sefiu Alao', 'SS2B'),
('Chinyere Wilfred', 'SS2B'),
('Binta Jibril', 'SS2B'),
('Tope Solaja', 'SS2B'),
('Dayo Okeniyi', 'SS2B'),
('Naomi Adegoke', 'SS2B'),
('Blessing Awolowo', 'SS2B'),
('Mike Ezuruonye', 'SS2B'),
('Okezie Ikpeazu', 'SS3A'),
('Nkem Owoh', 'SS3A'),
('Aisha Buhari', 'SS3A'),
('Lola Maja', 'SS3A'),
('Joshua King', 'SS3A'),
('Funke Akindele', 'SS3A'),
('Kemi Adetiba', 'SS3A'),
('Zubby Michael', 'SS3A'),
('Mercy Johnson', 'SS3A'),
('Ali Nuhu', 'SS3A'),
('Lekan King', 'SS3B'),
('Mercy Chukwu', 'SS3B'),
('Samuel Adeoye', 'SS3B'),
('Esther John', 'SS3B'),
('James Ibe', 'SS3B'),
('Deborah Emeka', 'SS3B'),
('Nnamdi Asomugha', 'SS3B'),
('Ada Eze', 'SS3B'),
('Rachel Okon', 'SS3B'),
('Peter Osundu', 'SS3B');


CREATE TABLE js_broadsheet (
    student_id INT,
    subject_id INT,
    class_id VARCHAR(5),
    CA1 DECIMAL(4,2) CHECK (CA1 BETWEEN 0 AND 15),
    CA2 DECIMAL(4,2) CHECK (CA2 BETWEEN 0 AND 15),
    Exam DECIMAL(4,2) CHECK (Exam BETWEEN 0 AND 70),
    Term VARCHAR(50),  -- e.g., 'Fall 2023', 'Spring 2024'
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (class_id) REFERENCES class(Class_id)
);


CREATE TABLE ss_broadsheet (
    student_id INT,
    subject_id INT,
    class_id VARCHAR(5),
    CA1 DECIMAL(4,2) CHECK (CA1 BETWEEN 0 AND 15),
    CA2 DECIMAL(4,2) CHECK (CA2 BETWEEN 0 AND 15),
    Exam DECIMAL(4,2) CHECK (Exam BETWEEN 0 AND 70),
    Term VARCHAR(50),  
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (class_id) REFERENCES class(Class_id)
);

ALTER TABLE students
ADD gender VARCHAR(10);

-- I used chatgpt for this --
UPDATE Students
SET Gender = CASE
    WHEN Name IN ('Chinedu Okoro', 'Musa Abdullahi', 'Samuel Chukwuma', 'Victor Okeke', 'Emeka Nwosu', 'Sunday Adegoke', 'Sani Ahmed', 'Ibrahim Aliyu', 'Segun Fashola', 'Tolu Smith', 'Kolade Alabi', 'Simi Adeleke', 'Yusuf Lawal', 'Chiagozie Onwuka', 'Wale Thomas', 'Gbenga Falade', 'Obinna Eze', 'Ismail Mohammed', 'Kelechi Obi', 'Abdul Basit', 'Yemi Osinbajo', 'Kola Nut', 'Femi Coker', 'Umar Farouk', 'Bayo Martins', 'Hassan Abubakar', 'Kenny Adebayo', 'George Akpan', 'Shola Ameobi', 'Tony Umez', 'Stephen Keshi', 'Precious Adebayo', 'Olu Jacobs', 'Ugochukwu Nnamdi', 'Sefiu Alao', 'Mike Ezuruonye', 'Okezie Ikpeazu', 'Nkem Owoh', 'Joshua King', 'Zubby Michael', 'Ali Nuhu', 'Lekan King', 'Samuel Adeoye', 'James Ibe', 'Nnamdi Asomugha', 'Peter Osundu') THEN 'Male'
    WHEN Name IN ('Amina Yusuf', 'Ifeoma Eze', 'Joy Adelaja', 'Maryam Bello', 'Fatima Mohammed', 'Halima Musa', 'Ngozi Ibe', 'Uchechi Amadi', 'Blessing Ojo', 'Chioma Duru', 'Kemi Afolabi', 'Adeola Oke', 'Simi Adeleke', 'Zainab Ali', 'Linda Ike', 'Esther Udom', 'Nneka Okonkwo', 'Amara Chukwu', 'Joy Okoye', 'Adaobi Mba', 'Chisom Philips', 'Sophia Aliyu', 'Oluchi Orji', 'Rita Dominic', 'Emmanuella Okon', 'Janet Akande', 'Omotola Jalade', 'Sandra Eze', 'Ronke Lawal', 'Chinyere Wilfred', 'Binta Jibril', 'Tope Solaja', 'Naomi Adegoke', 'Blessing Awolowo', 'Aisha Buhari', 'Lola Maja', 'Funke Akindele', 'Kemi Adetiba', 'Mercy Johnson', 'Mercy Chukwu', 'Esther John', 'Deborah Emeka', 'Ada Eze', 'Rachel Okon') THEN 'Female'
END
WHERE Name IN ('Chinedu Okoro', 'Musa Abdullahi', 'Samuel Chukwuma', 'Victor Okeke', 'Emeka Nwosu', 'Sunday Adegoke', 'Sani Ahmed', 'Ibrahim Aliyu', 'Segun Fashola', 'Tolu Smith', 'Kolade Alabi', 'Simi Adeleke', 'Yusuf Lawal', 'Chiagozie Onwuka', 'Wale Thomas', 'Gbenga Falade', 'Obinna Eze', 'Ismail Mohammed', 'Kelechi Obi', 'Abdul Basit', 'Yemi Osinbajo', 'Kola Nut', 'Femi Coker', 'Umar Farouk', 'Bayo Martins', 'Hassan Abubakar', 'Kenny Adebayo', 'George Akpan', 'Shola Ameobi', 'Tony Umez', 'Stephen Keshi', 'Precious Adebayo', 'Olu Jacobs', 'Ugochukwu Nnamdi', 'Sefiu Alao', 'Mike Ezuruonye', 'Okezie Ikpeazu', 'Nkem Owoh', 'Joshua King', 'Zubby Michael', 'Ali Nuhu', 'Lekan King', 'Samuel Adeoye', 'James Ibe', 'Nnamdi Asomugha', 'Peter Osundu', 'Amina Yusuf', 'Ifeoma Eze', 'Joy Adelaja', 'Maryam Bello', 'Fatima Mohammed', 'Halima Musa', 'Ngozi Ibe', 'Uchechi Amadi', 'Blessing Ojo', 'Chioma Duru', 'Kemi Afolabi', 'Adeola Oke', 'Simi Adeleke', 'Zainab Ali', 'Linda Ike', 'Esther Udom', 'Nneka Okonkwo', 'Amara Chukwu', 'Joy Okoye', 'Adaobi Mba', 'Chisom Philips', 'Sophia Aliyu', 'Oluchi Orji', 'Rita Dominic', 'Emmanuella Okon', 'Janet Akande', 'Omotola Jalade', 'Sandra Eze', 'Ronke Lawal', 'Chinyere Wilfred', 'Binta Jibril', 'Tope Solaja', 'Naomi Adegoke', 'Blessing Awolowo', 'Aisha Buhari', 'Lola Maja', 'Funke Akindele', 'Kemi Adetiba', 'Mercy Johnson', 'Mercy Chukwu', 'Esther John', 'Deborah Emeka', 'Ada Eze', 'Rachel Okon');


-- Student 1: Insert scores for Mathematics, English Language, and Basic Science
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES
(1, 1, 'JS1', 12.5, 13.5, 55.2, 'Fall 2023'),  -- Mathematics
(1, 2, 'JS1', 14.0, 11.5, 60.0, 'Fall 2023'),  -- English Language
(1, 21, 'JS1', 10.0, 12.0, 65.5, 'Fall 2023'); -- Basic Science

-- Python was used to randomize and generate scores--
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 1, 'JS1', 2.03, 11.04, 3.24, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 2, 'JS1', 12.13, 14.35, 23.25, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 12, 'JS1', 8.24, 3.57, 56.31, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 21, 'JS1', 3.18, 3.88, 40.3, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 22, 'JS1', 0.06, 7.37, 3.33, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 23, 'JS1', 7.28, 12.95, 61.68, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 24, 'JS1', 14.32, 8.93, 46.83, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 25, 'JS1', 10.37, 6.78, 53.46, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 26, 'JS1', 8.35, 11.21, 14.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 27, 'JS1', 3.64, 14.2, 18.19, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 28, 'JS1', 9.32, 14.94, 33.27, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 17, 'JS1', 5.23, 10.38, 1.21, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 19, 'JS1', 7.7, 13.02, 2.38, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (1, 29, 'JS1', 7.24, 1.17, 50.24, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 1, 'JS1', 3.57, 5.24, 23.31, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 2, 'JS1', 11.53, 0.01, 31.41, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 12, 'JS1', 7.21, 1.66, 41.77, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 21, 'JS1', 5.94, 6.22, 63.07, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 22, 'JS1', 13.66, 1.05, 23.57, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 23, 'JS1', 3.86, 11.59, 30.51, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 24, 'JS1', 14.96, 9.28, 51.56, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 25, 'JS1', 5.57, 8.23, 55.09, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 26, 'JS1', 10.35, 9.47, 64.55, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 27, 'JS1', 7.62, 10.22, 67.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 28, 'JS1', 7.3, 5.64, 32.57, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 17, 'JS1', 2.46, 6.53, 33.8, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 19, 'JS1', 11.29, 3.22, 28.66, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (2, 29, 'JS1', 8.19, 1.36, 38.82, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 1, 'JS1', 12.13, 5.85, 23.14, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 2, 'JS1', 4.66, 6.85, 56.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 12, 'JS1', 11.45, 13.84, 38.71, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 21, 'JS1', 5.95, 13.36, 34.13, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 22, 'JS1', 1.42, 4.94, 21.76, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 23, 'JS1', 4.83, 9.91, 61.87, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 24, 'JS1', 7.32, 4.97, 51.32, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 25, 'JS1', 12.96, 11.22, 18.66, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 26, 'JS1', 1.31, 8.36, 53.93, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 27, 'JS1', 5.84, 7.41, 48.38, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 28, 'JS1', 4.36, 4.72, 22.91, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 17, 'JS1', 8.75, 1.83, 9.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 19, 'JS1', 9.58, 4.87, 41.49, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (3, 29, 'JS1', 7.09, 5.87, 43.77, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 1, 'JS1', 0.6, 11.68, 1.01, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 2, 'JS1', 3.54, 6.73, 25.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 12, 'JS1', 7.63, 10.66, 1.35, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 21, 'JS1', 12.16, 2.54, 12.62, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 22, 'JS1', 10.7, 14.61, 6.11, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 23, 'JS1', 2.95, 7.52, 10.03, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 24, 'JS1', 6.01, 12.64, 59.06, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 25, 'JS1', 12.92, 0.82, 55.01, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 26, 'JS1', 3.12, 9.18, 41.07, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 27, 'JS1', 0.77, 3.95, 39.7, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 28, 'JS1', 4.72, 13.68, 32.51, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 17, 'JS1', 8.15, 6.56, 45.15, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 19, 'JS1', 2.84, 12.17, 23.65, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (4, 29, 'JS1', 9.97, 12.84, 9.74, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 1, 'JS1', 5.96, 8.44, 60.23, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 2, 'JS1', 0.06, 0.62, 23.01, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 12, 'JS1', 9.34, 14.41, 41.35, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 21, 'JS1', 2.94, 0.97, 38.14, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 22, 'JS1', 0.68, 1.64, 26.87, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 23, 'JS1', 5.33, 6.77, 39.65, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 24, 'JS1', 13.96, 2.14, 67.12, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 25, 'JS1', 1.33, 14.76, 8.81, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 26, 'JS1', 11.66, 3.81, 34.43, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 27, 'JS1', 1.52, 0.68, 18.36, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 28, 'JS1', 2.19, 14.86, 56.73, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 17, 'JS1', 13.78, 4.52, 9.32, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 19, 'JS1', 10.72, 10.95, 18.38, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (5, 29, 'JS1', 9.98, 9.85, 9.05, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 1, 'JS1', 4.61, 9.01, 41.11, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 2, 'JS1', 0.77, 6.83, 23.36, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 12, 'JS1', 5.44, 13.13, 34.75, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 21, 'JS1', 2.71, 0.41, 49.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 22, 'JS1', 12.93, 8.46, 17.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 23, 'JS1', 0.11, 2.34, 64.36, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 24, 'JS1', 3.97, 11.26, 42.64, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 25, 'JS1', 8.93, 6.55, 5.18, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 26, 'JS1', 0.07, 11.46, 18.86, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 27, 'JS1', 11.44, 5.82, 19.2, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 28, 'JS1', 14.84, 10.1, 19.66, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 17, 'JS1', 13.52, 5.0, 8.63, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 19, 'JS1', 7.92, 2.77, 68.05, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (6, 29, 'JS1', 0.84, 11.05, 24.45, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 1, 'JS1', 13.1, 1.4, 65.13, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 2, 'JS1', 11.75, 8.0, 48.28, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 12, 'JS1', 6.61, 12.87, 2.4, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 21, 'JS1', 10.64, 2.23, 27.81, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 22, 'JS1', 5.75, 1.36, 6.3, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 23, 'JS1', 14.56, 7.86, 42.07, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 24, 'JS1', 2.16, 1.73, 27.51, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 25, 'JS1', 4.74, 9.81, 60.69, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 26, 'JS1', 10.36, 0.81, 19.27, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 27, 'JS1', 10.3, 0.92, 28.24, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 28, 'JS1', 3.59, 5.44, 47.33, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 17, 'JS1', 7.78, 12.05, 55.17, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 19, 'JS1', 9.35, 3.01, 37.32, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (7, 29, 'JS1', 13.85, 5.34, 21.73, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 1, 'JS1', 1.23, 6.01, 49.45, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 2, 'JS1', 5.96, 7.47, 49.42, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 12, 'JS1', 0.34, 10.43, 35.3, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 21, 'JS1', 1.23, 0.72, 6.83, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 22, 'JS1', 10.54, 6.14, 7.91, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 23, 'JS1', 5.55, 14.71, 42.15, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 24, 'JS1', 10.98, 5.9, 55.19, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 25, 'JS1', 6.75, 9.34, 16.64, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 26, 'JS1', 8.55, 12.05, 49.39, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 27, 'JS1', 4.2, 6.6, 26.33, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 28, 'JS1', 7.16, 6.05, 53.3, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 17, 'JS1', 10.07, 3.21, 68.75, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 19, 'JS1', 1.03, 14.67, 52.84, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (8, 29, 'JS1', 10.18, 4.84, 40.61, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 1, 'JS1', 7.56, 2.0, 29.82, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 2, 'JS1', 1.21, 7.95, 17.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 12, 'JS1', 1.2, 6.98, 25.88, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 21, 'JS1', 5.67, 11.5, 15.61, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 22, 'JS1', 4.33, 4.88, 57.31, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 23, 'JS1', 13.21, 13.37, 55.34, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 24, 'JS1', 0.95, 14.04, 40.44, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 25, 'JS1', 2.69, 6.25, 10.93, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 26, 'JS1', 8.81, 11.56, 8.15, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 27, 'JS1', 1.44, 9.88, 67.62, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 28, 'JS1', 4.48, 10.99, 40.68, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 17, 'JS1', 10.07, 2.71, 1.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 19, 'JS1', 4.01, 12.16, 38.53, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (9, 29, 'JS1', 4.51, 12.73, 56.46, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 1, 'JS1', 11.66, 7.97, 38.73, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 2, 'JS1', 8.95, 0.44, 19.02, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 12, 'JS1', 9.41, 5.55, 43.23, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 21, 'JS1', 5.04, 9.03, 54.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 22, 'JS1', 2.11, 4.98, 23.59, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 23, 'JS1', 14.83, 12.43, 57.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 24, 'JS1', 12.86, 5.21, 32.49, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 25, 'JS1', 4.01, 11.82, 47.6, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 26, 'JS1', 5.18, 8.87, 47.96, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 27, 'JS1', 13.49, 5.24, 31.5, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 28, 'JS1', 2.86, 5.65, 59.88, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 17, 'JS1', 8.22, 11.81, 66.88, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 19, 'JS1', 10.95, 0.5, 58.42, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (10, 29, 'JS1', 2.31, 6.56, 31.29, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 1, 'JS2', 12.15, 0.48, 1.0, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 2, 'JS2', 9.78, 2.7, 37.35, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 12, 'JS2', 9.54, 14.99, 62.38, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 21, 'JS2', 7.45, 0.11, 9.92, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 22, 'JS2', 5.67, 7.44, 60.77, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 23, 'JS2', 14.93, 9.01, 52.88, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 24, 'JS2', 4.73, 6.72, 0.41, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 25, 'JS2', 14.53, 0.65, 53.96, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 26, 'JS2', 0.12, 9.88, 36.0, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 27, 'JS2', 4.1, 10.44, 42.95, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 28, 'JS2', 13.67, 2.38, 8.86, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 17, 'JS2', 10.1, 8.13, 17.87, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 19, 'JS2', 13.53, 2.04, 37.26, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (11, 29, 'JS2', 4.03, 14.72, 19.09, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 1, 'JS2', 8.68, 13.23, 15.08, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 2, 'JS2', 2.9, 10.66, 50.06, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 12, 'JS2', 10.88, 6.77, 36.95, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 21, 'JS2', 14.96, 11.69, 62.18, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 22, 'JS2', 7.01, 6.0, 27.25, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 23, 'JS2', 3.75, 9.85, 43.51, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 24, 'JS2', 13.43, 6.45, 54.27, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 25, 'JS2', 8.65, 9.7, 44.83, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 26, 'JS2', 4.48, 12.97, 52.03, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 27, 'JS2', 10.28, 11.63, 63.34, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 28, 'JS2', 0.66, 9.27, 5.89, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 17, 'JS2', 10.39, 4.02, 22.06, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 19, 'JS2', 14.89, 13.65, 54.52, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (12, 29, 'JS2', 13.3, 12.67, 18.3, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 1, 'JS2', 6.91, 13.53, 58.38, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 2, 'JS2', 9.02, 5.78, 48.07, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 12, 'JS2', 9.1, 4.51, 11.58, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 21, 'JS2', 6.2, 11.51, 66.51, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 22, 'JS2', 14.28, 4.71, 64.33, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 23, 'JS2', 4.38, 9.23, 64.13, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 24, 'JS2', 2.83, 12.44, 45.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 25, 'JS2', 9.5, 8.08, 23.16, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 26, 'JS2', 11.54, 10.57, 59.73, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 27, 'JS2', 4.67, 12.36, 9.69, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 28, 'JS2', 7.55, 11.28, 47.33, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 17, 'JS2', 6.87, 1.43, 45.81, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 19, 'JS2', 10.43, 10.06, 5.17, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (13, 29, 'JS2', 14.44, 12.79, 4.05, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 1, 'JS2', 12.06, 14.47, 30.15, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 2, 'JS2', 10.56, 11.15, 32.56, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 12, 'JS2', 0.38, 2.05, 46.09, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 21, 'JS2', 10.15, 6.13, 65.43, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 22, 'JS2', 7.62, 3.65, 22.5, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 23, 'JS2', 9.49, 0.7, 19.68, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 24, 'JS2', 1.43, 2.71, 39.25, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 25, 'JS2', 11.8, 8.61, 57.4, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 26, 'JS2', 6.34, 5.13, 18.66, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 27, 'JS2', 2.36, 14.44, 31.76, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 28, 'JS2', 6.04, 9.5, 12.8, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 17, 'JS2', 14.28, 3.74, 66.81, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 19, 'JS2', 8.46, 1.52, 44.17, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (14, 29, 'JS2', 13.32, 9.8, 62.2, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 1, 'JS2', 8.56, 8.85, 0.0, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 2, 'JS2', 12.79, 8.35, 16.92, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 12, 'JS2', 7.77, 5.25, 51.62, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 21, 'JS2', 0.87, 12.47, 28.79, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 22, 'JS2', 4.6, 10.44, 27.23, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 23, 'JS2', 12.37, 11.07, 26.25, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 24, 'JS2', 1.3, 14.28, 61.71, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 25, 'JS2', 0.71, 11.04, 58.08, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 26, 'JS2', 14.19, 8.87, 20.24, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 27, 'JS2', 13.03, 8.28, 10.57, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 28, 'JS2', 9.99, 1.31, 27.35, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 17, 'JS2', 8.14, 0.71, 41.86, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 19, 'JS2', 0.31, 1.54, 55.55, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (15, 29, 'JS2', 4.1, 13.46, 37.33, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 1, 'JS2', 8.23, 10.6, 16.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 2, 'JS2', 8.39, 0.93, 3.15, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 12, 'JS2', 13.75, 10.62, 11.18, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 21, 'JS2', 1.64, 0.33, 26.59, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 22, 'JS2', 10.3, 9.43, 25.68, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 23, 'JS2', 8.4, 5.8, 46.05, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 24, 'JS2', 5.02, 11.26, 47.76, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 25, 'JS2', 7.82, 3.31, 52.69, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 26, 'JS2', 1.65, 7.08, 57.0, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 27, 'JS2', 10.8, 8.46, 41.16, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 28, 'JS2', 6.17, 8.46, 28.48, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 17, 'JS2', 6.28, 12.24, 15.59, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 19, 'JS2', 7.02, 12.79, 42.31, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (16, 29, 'JS2', 6.16, 7.56, 64.17, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 1, 'JS2', 9.79, 10.95, 69.54, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 2, 'JS2', 8.78, 6.21, 36.47, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 12, 'JS2', 1.71, 1.97, 46.99, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 21, 'JS2', 13.56, 13.28, 41.09, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 22, 'JS2', 7.76, 14.88, 59.13, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 23, 'JS2', 13.41, 7.1, 64.69, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 24, 'JS2', 2.14, 13.78, 53.27, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 25, 'JS2', 6.21, 9.65, 0.43, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 26, 'JS2', 9.67, 13.9, 35.3, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 27, 'JS2', 7.73, 11.38, 24.24, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 28, 'JS2', 0.65, 2.86, 69.58, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 17, 'JS2', 3.85, 13.92, 50.74, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 19, 'JS2', 13.4, 7.26, 26.37, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (17, 29, 'JS2', 4.37, 5.9, 39.11, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 1, 'JS2', 10.68, 14.32, 17.39, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 2, 'JS2', 6.39, 10.89, 37.02, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 12, 'JS2', 11.91, 2.57, 23.76, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 21, 'JS2', 12.81, 9.23, 44.73, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 22, 'JS2', 8.12, 13.0, 6.76, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 23, 'JS2', 3.14, 0.03, 14.33, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 24, 'JS2', 4.31, 8.77, 13.53, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 25, 'JS2', 12.84, 1.05, 28.18, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 26, 'JS2', 5.2, 14.65, 30.79, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 27, 'JS2', 7.08, 7.85, 44.48, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 28, 'JS2', 7.07, 12.25, 13.66, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 17, 'JS2', 2.46, 14.19, 46.74, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 19, 'JS2', 3.31, 10.6, 4.21, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (18, 29, 'JS2', 8.61, 7.2, 29.55, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 1, 'JS2', 8.18, 11.89, 26.2, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 2, 'JS2', 7.51, 3.15, 62.06, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 12, 'JS2', 7.13, 3.09, 17.91, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 21, 'JS2', 7.69, 10.12, 37.06, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 22, 'JS2', 7.33, 6.01, 4.03, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 23, 'JS2', 10.2, 11.79, 2.49, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 24, 'JS2', 3.18, 1.35, 56.66, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 25, 'JS2', 4.68, 6.74, 62.88, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 26, 'JS2', 5.73, 1.54, 61.17, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 27, 'JS2', 14.26, 13.41, 11.78, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 28, 'JS2', 5.23, 8.7, 62.82, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 17, 'JS2', 3.74, 14.75, 62.37, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 19, 'JS2', 2.53, 10.12, 51.65, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (19, 29, 'JS2', 3.75, 11.48, 52.88, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 1, 'JS2', 4.89, 12.91, 26.99, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 2, 'JS2', 13.66, 2.86, 35.39, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 12, 'JS2', 0.38, 8.42, 20.25, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 21, 'JS2', 8.57, 11.3, 20.21, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 22, 'JS2', 8.51, 13.38, 47.98, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 23, 'JS2', 1.78, 1.0, 8.99, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 24, 'JS2', 4.02, 0.46, 7.41, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 25, 'JS2', 12.08, 0.24, 8.67, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 26, 'JS2', 8.74, 1.67, 25.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 27, 'JS2', 12.76, 9.89, 22.25, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 28, 'JS2', 9.69, 4.76, 47.72, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 17, 'JS2', 9.76, 13.51, 18.89, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 19, 'JS2', 1.46, 6.67, 45.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (20, 29, 'JS2', 8.09, 7.28, 35.64, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 1, 'JS3', 0.9, 2.03, 14.51, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 2, 'JS3', 2.82, 5.55, 50.74, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 12, 'JS3', 6.46, 6.15, 33.95, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 21, 'JS3', 3.12, 5.43, 8.3, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 22, 'JS3', 11.82, 6.95, 40.37, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 23, 'JS3', 1.5, 6.35, 6.85, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 24, 'JS3', 3.02, 6.09, 35.37, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 25, 'JS3', 0.41, 6.71, 1.05, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 26, 'JS3', 12.03, 8.2, 3.09, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 27, 'JS3', 8.38, 1.91, 22.75, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 28, 'JS3', 13.85, 1.04, 69.26, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 17, 'JS3', 10.28, 14.89, 41.12, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 19, 'JS3', 1.59, 10.49, 16.77, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (21, 29, 'JS3', 1.89, 7.18, 48.08, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 1, 'JS3', 0.53, 1.13, 63.88, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 2, 'JS3', 3.81, 6.5, 45.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 12, 'JS3', 0.73, 13.94, 56.2, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 21, 'JS3', 12.25, 12.19, 21.02, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 22, 'JS3', 11.59, 5.89, 28.43, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 23, 'JS3', 13.24, 10.94, 39.34, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 24, 'JS3', 8.4, 5.27, 49.97, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 25, 'JS3', 1.53, 3.36, 30.3, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 26, 'JS3', 3.93, 13.93, 58.77, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 27, 'JS3', 3.71, 4.85, 64.99, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 28, 'JS3', 14.73, 3.65, 63.76, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 17, 'JS3', 1.96, 7.43, 68.15, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 19, 'JS3', 10.27, 14.09, 68.37, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (22, 29, 'JS3', 5.48, 13.75, 40.6, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 1, 'JS3', 12.68, 13.85, 8.23, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 2, 'JS3', 9.16, 5.18, 3.81, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 12, 'JS3', 13.64, 14.92, 1.17, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 21, 'JS3', 0.28, 13.35, 11.71, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 22, 'JS3', 5.48, 0.94, 66.28, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 23, 'JS3', 5.74, 9.41, 32.81, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 24, 'JS3', 10.54, 13.26, 26.87, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 25, 'JS3', 8.98, 6.25, 35.13, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 26, 'JS3', 3.17, 6.37, 54.86, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 27, 'JS3', 5.15, 7.12, 64.92, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 28, 'JS3', 3.51, 7.2, 45.11, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 17, 'JS3', 2.46, 6.97, 56.07, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 19, 'JS3', 5.65, 8.76, 46.15, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (23, 29, 'JS3', 5.56, 12.35, 22.16, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 1, 'JS3', 13.38, 8.34, 1.55, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 2, 'JS3', 13.88, 14.66, 42.13, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 12, 'JS3', 4.71, 3.96, 61.18, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 21, 'JS3', 13.9, 13.74, 10.68, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 22, 'JS3', 3.98, 5.39, 41.98, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 23, 'JS3', 3.35, 0.76, 68.84, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 24, 'JS3', 7.98, 6.06, 54.64, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 25, 'JS3', 0.36, 6.71, 32.95, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 26, 'JS3', 4.67, 14.11, 36.07, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 27, 'JS3', 11.65, 0.7, 19.63, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 28, 'JS3', 14.82, 4.98, 10.62, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 17, 'JS3', 1.4, 5.27, 11.25, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 19, 'JS3', 1.34, 12.95, 60.26, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (24, 29, 'JS3', 11.01, 4.83, 45.85, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 1, 'JS3', 13.28, 12.93, 43.23, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 2, 'JS3', 5.1, 4.2, 15.75, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 12, 'JS3', 0.4, 14.18, 51.7, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 21, 'JS3', 6.46, 8.49, 61.18, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 22, 'JS3', 3.47, 5.03, 48.47, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 23, 'JS3', 10.96, 8.52, 19.49, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 24, 'JS3', 5.95, 2.01, 69.32, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 25, 'JS3', 4.8, 13.52, 27.1, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 26, 'JS3', 8.28, 14.39, 60.64, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 27, 'JS3', 13.07, 9.91, 11.64, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 28, 'JS3', 10.74, 9.29, 29.21, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 17, 'JS3', 1.6, 9.32, 4.04, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 19, 'JS3', 5.19, 1.76, 40.62, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (25, 29, 'JS3', 5.13, 1.11, 1.27, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 1, 'JS3', 4.39, 12.26, 16.96, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 2, 'JS3', 11.23, 14.39, 68.86, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 12, 'JS3', 0.92, 11.01, 55.52, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 21, 'JS3', 6.94, 12.88, 14.5, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 22, 'JS3', 9.69, 4.76, 53.94, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 23, 'JS3', 9.9, 7.92, 32.54, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 24, 'JS3', 9.31, 12.78, 39.96, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 25, 'JS3', 8.69, 6.76, 26.69, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 26, 'JS3', 4.07, 10.25, 0.36, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 27, 'JS3', 9.74, 5.07, 67.42, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 28, 'JS3', 14.76, 9.51, 62.43, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 17, 'JS3', 10.16, 4.59, 10.51, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 19, 'JS3', 10.37, 7.45, 46.56, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (26, 29, 'JS3', 13.8, 3.14, 27.29, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 1, 'JS3', 11.83, 7.19, 45.03, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 2, 'JS3', 14.34, 13.1, 33.6, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 12, 'JS3', 0.86, 1.86, 40.69, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 21, 'JS3', 4.77, 8.28, 10.56, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 22, 'JS3', 9.38, 5.29, 63.17, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 23, 'JS3', 8.71, 14.08, 46.46, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 24, 'JS3', 4.99, 7.46, 51.81, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 25, 'JS3', 13.39, 3.6, 26.03, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 26, 'JS3', 9.48, 9.83, 19.81, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 27, 'JS3', 3.82, 1.99, 66.39, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 28, 'JS3', 10.08, 14.04, 45.6, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 17, 'JS3', 5.14, 0.79, 25.62, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 19, 'JS3', 8.98, 1.41, 43.98, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (27, 29, 'JS3', 2.49, 9.46, 18.87, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 1, 'JS3', 0.53, 4.4, 3.08, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 2, 'JS3', 10.64, 0.35, 30.38, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 12, 'JS3', 11.75, 7.22, 34.42, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 21, 'JS3', 0.07, 1.01, 18.93, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 22, 'JS3', 9.2, 7.95, 27.87, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 23, 'JS3', 10.33, 7.14, 19.43, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 24, 'JS3', 11.74, 4.89, 41.19, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 25, 'JS3', 1.32, 14.81, 7.27, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 26, 'JS3', 10.29, 10.02, 57.99, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 27, 'JS3', 6.73, 0.24, 54.21, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 28, 'JS3', 8.45, 10.09, 47.52, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 17, 'JS3', 14.18, 2.83, 54.8, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 19, 'JS3', 8.56, 12.41, 61.96, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (28, 29, 'JS3', 14.2, 14.89, 14.38, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 1, 'JS3', 5.56, 11.99, 33.4, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 2, 'JS3', 4.64, 14.23, 58.4, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 12, 'JS3', 2.16, 13.1, 38.8, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 21, 'JS3', 2.49, 12.13, 3.89, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 22, 'JS3', 11.02, 14.47, 46.92, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 23, 'JS3', 7.35, 7.73, 60.82, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 24, 'JS3', 4.2, 6.14, 17.03, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 25, 'JS3', 11.47, 13.62, 6.13, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 26, 'JS3', 1.49, 0.43, 27.05, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 27, 'JS3', 10.07, 5.32, 63.62, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 28, 'JS3', 11.54, 3.9, 40.32, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 17, 'JS3', 1.05, 12.26, 67.04, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 19, 'JS3', 3.21, 6.51, 12.22, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (29, 29, 'JS3', 5.98, 10.79, 10.95, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 1, 'JS3', 2.96, 5.4, 15.12, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 2, 'JS3', 13.04, 12.47, 54.02, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 12, 'JS3', 0.26, 7.23, 19.55, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 21, 'JS3', 10.67, 9.51, 59.08, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 22, 'JS3', 5.79, 14.83, 14.11, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 23, 'JS3', 8.06, 1.67, 25.5, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 24, 'JS3', 13.85, 3.15, 43.54, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 25, 'JS3', 3.5, 10.23, 2.19, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 26, 'JS3', 9.95, 9.51, 22.91, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 27, 'JS3', 13.59, 11.45, 62.47, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 28, 'JS3', 7.64, 8.64, 33.56, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 17, 'JS3', 9.98, 9.95, 48.66, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 19, 'JS3', 9.13, 2.98, 5.06, 'First Term');
INSERT INTO js_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (30, 29, 'JS3', 7.71, 8.71, 47.14, 'First Term');


INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 1, 'SS1A', 9.63, 9.99, 5.69, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 2, 'SS1A', 0.81, 9.36, 59.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 19, 'SS1A', 2.91, 8.03, 50.94, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 26, 'SS1A', 12.21, 3.81, 34.19, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 3, 'SS1A', 12.08, 2.57, 22.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 4, 'SS1A', 14.24, 4.98, 25.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 5, 'SS1A', 11.95, 10.61, 43.45, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 11, 'SS1A', 8.94, 5.72, 5.92, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (31, 15, 'SS1A', 3.22, 1.84, 69.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 1, 'SS1A', 3.66, 5.9, 41.82, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 2, 'SS1A', 14.48, 6.92, 22.49, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 19, 'SS1A', 12.82, 0.97, 50.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 26, 'SS1A', 6.81, 11.35, 64.93, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 3, 'SS1A', 11.25, 8.02, 13.06, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 4, 'SS1A', 3.77, 13.74, 48.6, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 5, 'SS1A', 9.87, 14.93, 66.39, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 11, 'SS1A', 11.44, 3.38, 50.8, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (32, 15, 'SS1A', 13.58, 8.02, 1.28, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 1, 'SS1A', 3.85, 6.09, 39.77, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 2, 'SS1A', 0.08, 7.08, 29.08, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 19, 'SS1A', 3.73, 10.48, 7.92, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 26, 'SS1A', 14.14, 0.51, 36.89, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 3, 'SS1A', 10.79, 1.12, 61.82, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 4, 'SS1A', 10.6, 8.08, 18.55, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 5, 'SS1A', 3.21, 1.54, 40.62, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 11, 'SS1A', 6.35, 13.15, 32.32, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (33, 15, 'SS1A', 8.01, 8.23, 1.17, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 1, 'SS1A', 12.11, 13.84, 20.93, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 2, 'SS1A', 2.11, 8.82, 66.93, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 19, 'SS1A', 0.34, 7.61, 34.76, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 26, 'SS1A', 1.84, 12.28, 33.9, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 3, 'SS1A', 0.16, 11.91, 67.6, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 4, 'SS1A', 6.43, 8.64, 64.83, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 5, 'SS1A', 14.29, 12.6, 35.82, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 11, 'SS1A', 14.19, 9.84, 0.34, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (34, 15, 'SS1A', 2.48, 6.15, 19.3, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 1, 'SS1A', 11.69, 4.54, 0.11, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 2, 'SS1A', 1.86, 14.01, 13.86, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 19, 'SS1A', 5.94, 10.0, 36.84, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 26, 'SS1A', 2.31, 5.63, 10.6, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 3, 'SS1A', 3.34, 14.76, 17.28, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 4, 'SS1A', 6.67, 14.61, 18.3, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 5, 'SS1A', 11.06, 0.34, 24.88, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 11, 'SS1A', 2.64, 12.82, 51.77, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (35, 15, 'SS1A', 8.04, 3.52, 65.61, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 1, 'SS1A', 10.22, 12.47, 63.49, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 2, 'SS1A', 8.89, 13.83, 37.45, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 19, 'SS1A', 5.11, 0.35, 51.5, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 26, 'SS1A', 12.88, 12.08, 13.29, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 3, 'SS1A', 13.14, 9.99, 38.49, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 4, 'SS1A', 5.86, 14.54, 40.25, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 5, 'SS1A', 5.49, 0.82, 46.74, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 11, 'SS1A', 8.06, 8.35, 1.31, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (36, 15, 'SS1A', 2.44, 0.96, 28.38, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 1, 'SS1A', 9.43, 0.06, 59.86, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 2, 'SS1A', 9.45, 1.15, 58.12, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 19, 'SS1A', 5.96, 13.19, 65.79, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 26, 'SS1A', 14.6, 5.96, 36.57, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 3, 'SS1A', 0.29, 13.07, 63.13, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 4, 'SS1A', 13.34, 1.49, 17.51, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 5, 'SS1A', 6.4, 12.64, 12.0, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 11, 'SS1A', 10.53, 11.5, 28.19, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (37, 15, 'SS1A', 5.94, 5.83, 18.91, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 1, 'SS1A', 7.1, 0.32, 67.96, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 2, 'SS1A', 5.58, 11.22, 23.41, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 19, 'SS1A', 14.02, 6.61, 12.73, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 26, 'SS1A', 3.69, 3.08, 29.23, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 3, 'SS1A', 12.06, 5.61, 32.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 4, 'SS1A', 14.03, 9.69, 33.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 5, 'SS1A', 14.74, 6.8, 23.01, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 11, 'SS1A', 0.55, 12.28, 25.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (38, 15, 'SS1A', 1.42, 3.73, 27.07, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 1, 'SS1A', 3.86, 3.91, 28.32, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 2, 'SS1A', 10.81, 1.23, 21.86, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 19, 'SS1A', 10.19, 8.97, 57.71, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 26, 'SS1A', 2.49, 7.62, 29.55, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 3, 'SS1A', 6.05, 5.91, 20.57, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 4, 'SS1A', 8.28, 5.72, 28.87, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 5, 'SS1A', 3.29, 2.89, 64.95, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 11, 'SS1A', 12.15, 12.77, 68.64, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (39, 15, 'SS1A', 4.35, 6.69, 63.12, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 1, 'SS1A', 1.47, 5.01, 48.43, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 2, 'SS1A', 12.7, 13.78, 4.93, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 19, 'SS1A', 14.01, 12.81, 59.24, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 26, 'SS1A', 12.16, 11.21, 45.57, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 3, 'SS1A', 3.48, 12.02, 3.63, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 4, 'SS1A', 3.11, 1.57, 66.86, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 5, 'SS1A', 10.83, 6.69, 23.86, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 11, 'SS1A', 13.78, 14.04, 2.51, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (40, 15, 'SS1A', 8.71, 2.87, 57.94, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 1, 'SS1B', 11.08, 9.62, 33.59, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 2, 'SS1B', 8.89, 8.57, 2.42, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 19, 'SS1B', 10.04, 1.25, 30.8, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 26, 'SS1B', 14.63, 4.75, 3.43, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 8, 'SS1B', 12.92, 11.68, 46.16, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 9, 'SS1B', 1.09, 14.54, 64.83, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 10, 'SS1B', 4.04, 1.43, 7.43, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 7, 'SS1B', 10.61, 1.52, 47.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (41, 6, 'SS1B', 2.53, 13.65, 4.4, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 1, 'SS1B', 13.21, 2.99, 34.57, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 2, 'SS1B', 2.01, 12.82, 36.15, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 19, 'SS1B', 13.81, 6.96, 44.42, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 26, 'SS1B', 14.14, 3.9, 8.47, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 8, 'SS1B', 4.17, 9.9, 59.79, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 9, 'SS1B', 12.94, 4.66, 33.17, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 10, 'SS1B', 6.4, 11.81, 38.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 7, 'SS1B', 12.81, 10.12, 33.82, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (42, 6, 'SS1B', 14.19, 2.4, 45.36, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 1, 'SS1B', 4.13, 8.18, 53.9, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 2, 'SS1B', 8.86, 9.96, 37.27, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 19, 'SS1B', 10.56, 8.28, 11.96, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 26, 'SS1B', 10.54, 13.37, 65.67, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 8, 'SS1B', 1.76, 10.91, 19.51, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 9, 'SS1B', 3.61, 13.36, 5.71, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 10, 'SS1B', 0.98, 4.39, 59.27, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 7, 'SS1B', 12.19, 0.01, 54.38, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (43, 6, 'SS1B', 11.72, 7.17, 9.97, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 1, 'SS1B', 11.51, 2.96, 64.71, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 2, 'SS1B', 2.89, 13.91, 56.9, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 19, 'SS1B', 6.91, 4.84, 52.85, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 26, 'SS1B', 12.81, 10.99, 68.62, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 8, 'SS1B', 10.45, 12.8, 31.9, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 9, 'SS1B', 12.0, 9.28, 23.42, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 10, 'SS1B', 0.97, 5.87, 32.53, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 7, 'SS1B', 12.04, 4.64, 25.37, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (44, 6, 'SS1B', 3.59, 13.81, 35.87, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 1, 'SS1B', 0.85, 8.78, 65.85, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 2, 'SS1B', 6.56, 6.55, 32.5, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 19, 'SS1B', 2.41, 13.73, 17.87, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 26, 'SS1B', 7.72, 8.67, 24.88, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 8, 'SS1B', 1.6, 6.01, 21.05, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 9, 'SS1B', 1.1, 2.15, 64.59, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 10, 'SS1B', 0.71, 3.84, 24.4, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 7, 'SS1B', 14.87, 4.19, 68.97, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (45, 6, 'SS1B', 1.66, 0.65, 69.77, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 1, 'SS1B', 13.92, 9.89, 17.25, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 2, 'SS1B', 12.69, 12.15, 57.52, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 19, 'SS1B', 8.16, 7.87, 12.36, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 26, 'SS1B', 3.78, 5.15, 1.35, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 8, 'SS1B', 4.72, 10.77, 13.66, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 9, 'SS1B', 10.38, 9.06, 35.82, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 10, 'SS1B', 7.42, 8.13, 32.94, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 7, 'SS1B', 7.17, 5.42, 0.55, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (46, 6, 'SS1B', 0.94, 2.67, 23.55, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 1, 'SS1B', 10.32, 4.52, 16.22, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 2, 'SS1B', 7.55, 3.77, 9.3, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 19, 'SS1B', 9.39, 2.57, 5.7, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 26, 'SS1B', 9.63, 6.72, 28.93, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 8, 'SS1B', 5.03, 13.74, 18.89, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 9, 'SS1B', 5.06, 1.98, 30.38, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 10, 'SS1B', 12.7, 0.4, 21.45, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 7, 'SS1B', 9.34, 7.33, 16.42, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (47, 6, 'SS1B', 5.47, 10.56, 3.69, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 1, 'SS1B', 0.95, 3.63, 22.42, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 2, 'SS1B', 9.35, 10.29, 36.4, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 19, 'SS1B', 6.42, 9.73, 62.23, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 26, 'SS1B', 4.11, 5.7, 35.02, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 8, 'SS1B', 14.19, 5.11, 27.87, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 9, 'SS1B', 2.93, 10.35, 55.29, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 10, 'SS1B', 12.86, 0.31, 25.97, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 7, 'SS1B', 11.31, 7.44, 58.11, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (48, 6, 'SS1B', 4.77, 13.89, 15.71, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 1, 'SS1B', 12.27, 8.29, 17.25, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 2, 'SS1B', 7.03, 2.26, 65.67, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 19, 'SS1B', 6.76, 2.81, 54.05, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 26, 'SS1B', 0.44, 9.55, 14.79, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 8, 'SS1B', 5.43, 8.41, 54.71, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 9, 'SS1B', 5.91, 1.72, 24.09, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 10, 'SS1B', 1.5, 7.22, 11.16, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 7, 'SS1B', 13.75, 12.29, 52.28, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (49, 6, 'SS1B', 9.46, 12.58, 47.03, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 1, 'SS1B', 3.31, 8.65, 6.08, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 2, 'SS1B', 4.12, 4.27, 39.08, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 19, 'SS1B', 10.71, 6.72, 12.47, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 26, 'SS1B', 11.85, 4.59, 47.72, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 8, 'SS1B', 13.69, 8.26, 14.58, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 9, 'SS1B', 11.02, 10.8, 42.04, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 10, 'SS1B', 14.99, 1.45, 15.43, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 7, 'SS1B', 7.93, 10.26, 66.83, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (50, 6, 'SS1B', 1.57, 9.58, 55.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 1, 'SS2A', 11.55, 11.34, 33.96, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 2, 'SS2A', 11.66, 3.41, 38.03, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 19, 'SS2A', 2.05, 13.29, 17.85, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 26, 'SS2A', 13.89, 7.22, 1.45, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 3, 'SS2A', 14.74, 14.3, 58.55, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 4, 'SS2A', 6.08, 13.38, 29.97, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 5, 'SS2A', 1.37, 14.58, 56.84, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 11, 'SS2A', 11.52, 6.08, 25.74, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (51, 15, 'SS2A', 14.5, 8.17, 6.02, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 1, 'SS2A', 14.24, 2.8, 2.41, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 2, 'SS2A', 2.78, 2.29, 37.97, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 19, 'SS2A', 9.57, 12.9, 68.84, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 26, 'SS2A', 9.2, 5.76, 46.7, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 3, 'SS2A', 14.58, 10.37, 35.03, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 4, 'SS2A', 10.45, 3.21, 62.7, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 5, 'SS2A', 8.71, 14.29, 39.93, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 11, 'SS2A', 9.77, 6.18, 1.22, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (52, 15, 'SS2A', 6.59, 10.76, 1.74, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 1, 'SS2A', 4.77, 11.49, 55.94, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 2, 'SS2A', 12.69, 11.95, 34.91, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 19, 'SS2A', 11.6, 0.6, 19.5, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 26, 'SS2A', 14.69, 2.11, 30.72, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 3, 'SS2A', 1.99, 4.21, 21.53, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 4, 'SS2A', 14.52, 9.55, 52.67, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 5, 'SS2A', 5.29, 9.27, 36.86, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 11, 'SS2A', 7.96, 1.29, 4.1, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (53, 15, 'SS2A', 7.04, 4.31, 60.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 1, 'SS2A', 10.75, 10.41, 51.67, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 2, 'SS2A', 9.32, 13.71, 60.25, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 19, 'SS2A', 14.96, 3.68, 45.31, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 26, 'SS2A', 6.36, 11.6, 69.73, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 3, 'SS2A', 8.6, 9.81, 39.19, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 4, 'SS2A', 2.78, 5.4, 64.66, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 5, 'SS2A', 3.88, 3.92, 62.74, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 11, 'SS2A', 2.86, 7.52, 13.83, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (54, 15, 'SS2A', 3.18, 11.06, 5.69, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 1, 'SS2A', 14.87, 14.18, 41.51, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 2, 'SS2A', 3.41, 13.78, 14.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 19, 'SS2A', 3.86, 6.96, 30.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 26, 'SS2A', 10.66, 1.88, 16.03, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 3, 'SS2A', 9.31, 8.22, 0.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 4, 'SS2A', 0.8, 13.78, 52.63, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 5, 'SS2A', 11.61, 2.46, 40.14, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 11, 'SS2A', 2.52, 3.53, 33.11, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (55, 15, 'SS2A', 11.55, 0.03, 58.46, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 1, 'SS2A', 3.27, 7.45, 57.35, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 2, 'SS2A', 1.64, 3.1, 14.41, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 19, 'SS2A', 0.68, 6.45, 43.46, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 26, 'SS2A', 12.39, 0.65, 7.59, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 3, 'SS2A', 9.65, 1.48, 52.74, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 4, 'SS2A', 3.82, 14.91, 22.56, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 5, 'SS2A', 7.83, 6.48, 34.72, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 11, 'SS2A', 0.04, 8.28, 48.56, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (56, 15, 'SS2A', 10.58, 7.51, 29.22, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 1, 'SS2A', 0.87, 0.1, 10.36, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 2, 'SS2A', 6.24, 3.03, 47.16, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 19, 'SS2A', 4.66, 2.07, 53.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 26, 'SS2A', 4.86, 13.08, 26.24, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 3, 'SS2A', 11.3, 10.89, 16.62, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 4, 'SS2A', 3.8, 3.38, 56.53, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 5, 'SS2A', 5.17, 13.06, 67.05, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 11, 'SS2A', 11.03, 0.47, 44.92, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (57, 15, 'SS2A', 12.68, 3.11, 53.73, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 1, 'SS2A', 5.09, 9.55, 1.67, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 2, 'SS2A', 7.51, 7.71, 67.17, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 19, 'SS2A', 9.89, 3.65, 43.66, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 26, 'SS2A', 8.44, 8.18, 17.3, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 3, 'SS2A', 7.96, 13.82, 45.09, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 4, 'SS2A', 10.46, 6.58, 6.06, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 5, 'SS2A', 11.31, 4.19, 3.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 11, 'SS2A', 10.16, 2.01, 68.61, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (58, 15, 'SS2A', 1.84, 10.98, 51.9, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 1, 'SS2A', 12.85, 9.75, 41.44, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 2, 'SS2A', 0.65, 2.41, 45.14, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 19, 'SS2A', 11.22, 6.25, 50.62, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 26, 'SS2A', 4.23, 6.93, 65.76, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 3, 'SS2A', 1.21, 2.61, 60.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 4, 'SS2A', 11.54, 4.42, 63.69, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 5, 'SS2A', 7.4, 1.87, 62.38, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 11, 'SS2A', 13.4, 2.77, 1.75, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (59, 15, 'SS2A', 5.14, 4.52, 34.45, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 1, 'SS2A', 12.78, 2.91, 27.73, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 2, 'SS2A', 1.65, 1.7, 48.53, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 19, 'SS2A', 6.07, 2.33, 44.04, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 26, 'SS2A', 4.98, 12.21, 10.37, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 3, 'SS2A', 1.23, 8.84, 60.44, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 4, 'SS2A', 10.33, 3.81, 59.5, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 5, 'SS2A', 6.57, 8.28, 46.73, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 11, 'SS2A', 9.03, 0.94, 27.43, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (60, 15, 'SS2A', 5.18, 1.09, 68.95, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 1, 'SS2B', 9.85, 0.0, 38.17, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 2, 'SS2B', 0.21, 2.94, 50.34, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 19, 'SS2B', 9.66, 14.47, 39.74, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 26, 'SS2B', 7.3, 13.92, 57.09, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 8, 'SS2B', 14.82, 5.29, 22.42, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 9, 'SS2B', 6.53, 5.85, 21.77, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 10, 'SS2B', 4.9, 2.66, 26.24, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 7, 'SS2B', 1.37, 2.57, 64.98, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (61, 6, 'SS2B', 13.21, 12.21, 33.44, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 1, 'SS2B', 6.01, 11.87, 24.68, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 2, 'SS2B', 12.46, 13.97, 16.34, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 19, 'SS2B', 11.79, 6.28, 26.37, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 26, 'SS2B', 14.22, 13.63, 59.06, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 8, 'SS2B', 11.08, 10.65, 67.88, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 9, 'SS2B', 5.09, 7.61, 50.29, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 10, 'SS2B', 13.63, 13.24, 45.77, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 7, 'SS2B', 7.23, 3.21, 43.05, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (62, 6, 'SS2B', 6.78, 14.18, 27.79, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 1, 'SS2B', 2.5, 11.99, 27.58, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 2, 'SS2B', 13.12, 0.53, 39.45, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 19, 'SS2B', 10.0, 10.09, 48.82, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 26, 'SS2B', 13.73, 3.32, 58.25, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 8, 'SS2B', 10.01, 3.05, 41.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 9, 'SS2B', 3.46, 9.07, 0.78, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 10, 'SS2B', 12.4, 9.32, 53.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 7, 'SS2B', 5.44, 6.6, 53.58, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (63, 6, 'SS2B', 9.72, 10.04, 36.48, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 1, 'SS2B', 6.53, 4.42, 62.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 2, 'SS2B', 10.82, 0.01, 62.54, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 19, 'SS2B', 6.88, 3.65, 18.93, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 26, 'SS2B', 0.87, 3.96, 26.9, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 8, 'SS2B', 7.69, 8.59, 3.47, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 9, 'SS2B', 8.06, 8.59, 29.2, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 10, 'SS2B', 0.47, 6.09, 51.98, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 7, 'SS2B', 13.56, 10.47, 48.1, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (64, 6, 'SS2B', 7.92, 3.68, 13.6, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 1, 'SS2B', 2.98, 4.77, 6.97, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 2, 'SS2B', 1.43, 13.83, 15.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 19, 'SS2B', 12.38, 12.91, 44.2, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 26, 'SS2B', 8.81, 8.29, 12.72, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 8, 'SS2B', 7.63, 1.39, 69.82, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 9, 'SS2B', 9.9, 10.19, 59.38, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 10, 'SS2B', 7.44, 8.24, 3.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 7, 'SS2B', 12.89, 5.27, 39.12, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (65, 6, 'SS2B', 14.36, 12.1, 40.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 1, 'SS2B', 13.36, 9.71, 54.08, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 2, 'SS2B', 8.11, 1.37, 33.56, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 19, 'SS2B', 7.01, 4.94, 1.5, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 26, 'SS2B', 2.13, 1.19, 37.55, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 8, 'SS2B', 9.29, 7.52, 42.59, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 9, 'SS2B', 11.7, 8.72, 60.51, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 10, 'SS2B', 6.17, 3.7, 25.81, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 7, 'SS2B', 0.37, 5.3, 6.34, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (66, 6, 'SS2B', 10.15, 10.91, 42.78, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 1, 'SS2B', 0.92, 1.77, 22.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 2, 'SS2B', 11.18, 2.74, 26.97, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 19, 'SS2B', 7.63, 4.72, 24.37, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 26, 'SS2B', 1.85, 9.99, 23.53, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 8, 'SS2B', 2.44, 3.65, 9.25, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 9, 'SS2B', 14.1, 11.96, 30.94, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 10, 'SS2B', 6.94, 14.94, 30.13, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 7, 'SS2B', 5.49, 4.94, 18.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (67, 6, 'SS2B', 9.69, 3.97, 45.43, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 1, 'SS2B', 11.57, 6.16, 50.56, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 2, 'SS2B', 2.52, 1.94, 37.13, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 19, 'SS2B', 11.75, 3.36, 26.52, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 26, 'SS2B', 1.2, 10.36, 15.25, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 8, 'SS2B', 1.66, 1.64, 23.7, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 9, 'SS2B', 12.67, 12.77, 34.88, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 10, 'SS2B', 14.91, 7.27, 31.36, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 7, 'SS2B', 5.52, 10.77, 63.18, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (68, 6, 'SS2B', 1.93, 2.94, 66.36, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 1, 'SS2B', 10.14, 6.3, 30.6, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 2, 'SS2B', 6.23, 7.23, 62.57, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 19, 'SS2B', 14.53, 9.87, 7.31, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 26, 'SS2B', 11.84, 3.17, 3.56, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 8, 'SS2B', 14.39, 12.2, 9.48, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 9, 'SS2B', 11.91, 6.13, 60.92, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 10, 'SS2B', 9.31, 0.15, 21.14, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 7, 'SS2B', 10.44, 4.59, 7.63, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (69, 6, 'SS2B', 4.17, 5.32, 41.6, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 1, 'SS2B', 9.1, 2.34, 38.34, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 2, 'SS2B', 13.48, 14.08, 32.05, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 19, 'SS2B', 13.62, 14.39, 36.91, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 26, 'SS2B', 10.32, 5.11, 16.19, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 8, 'SS2B', 5.65, 2.67, 18.48, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 9, 'SS2B', 11.7, 11.64, 66.5, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 10, 'SS2B', 14.4, 13.07, 5.41, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 7, 'SS2B', 2.02, 14.81, 25.95, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (70, 6, 'SS2B', 14.74, 7.13, 8.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 1, 'SS3A', 0.5, 6.12, 23.3, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 2, 'SS3A', 12.29, 10.63, 18.48, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 19, 'SS3A', 10.6, 11.41, 32.1, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 26, 'SS3A', 7.09, 13.22, 17.03, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 3, 'SS3A', 12.64, 8.13, 32.13, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 4, 'SS3A', 14.36, 0.6, 33.62, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 5, 'SS3A', 7.15, 4.77, 5.39, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 11, 'SS3A', 1.3, 10.16, 61.78, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (71, 15, 'SS3A', 12.58, 5.69, 32.0, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 1, 'SS3A', 7.57, 1.49, 51.28, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 2, 'SS3A', 3.37, 13.31, 27.72, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 19, 'SS3A', 0.88, 11.81, 39.66, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 26, 'SS3A', 2.37, 9.95, 52.18, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 3, 'SS3A', 10.83, 8.74, 65.56, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 4, 'SS3A', 3.1, 3.77, 12.62, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 5, 'SS3A', 7.12, 5.46, 10.74, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 11, 'SS3A', 13.94, 2.01, 55.72, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (72, 15, 'SS3A', 6.24, 14.66, 32.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 1, 'SS3A', 5.5, 12.1, 44.31, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 2, 'SS3A', 12.97, 12.73, 42.7, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 19, 'SS3A', 1.02, 6.42, 26.31, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 26, 'SS3A', 3.08, 2.68, 67.76, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 3, 'SS3A', 3.68, 3.49, 43.69, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 4, 'SS3A', 5.19, 12.97, 38.38, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 5, 'SS3A', 12.41, 0.05, 49.46, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 11, 'SS3A', 12.13, 13.54, 49.98, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (73, 15, 'SS3A', 2.04, 3.62, 58.37, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 1, 'SS3A', 14.63, 4.81, 3.91, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 2, 'SS3A', 3.6, 11.11, 25.95, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 19, 'SS3A', 13.87, 14.76, 52.03, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 26, 'SS3A', 10.09, 2.82, 65.86, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 3, 'SS3A', 13.79, 4.47, 42.34, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 4, 'SS3A', 10.73, 2.75, 59.31, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 5, 'SS3A', 0.86, 0.12, 36.88, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 11, 'SS3A', 8.07, 13.63, 15.07, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (74, 15, 'SS3A', 11.6, 6.23, 48.2, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 1, 'SS3A', 12.26, 11.1, 20.42, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 2, 'SS3A', 1.01, 4.18, 17.81, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 19, 'SS3A', 11.78, 4.38, 54.17, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 26, 'SS3A', 1.08, 4.09, 7.39, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 3, 'SS3A', 8.0, 8.71, 34.16, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 4, 'SS3A', 2.36, 12.6, 50.46, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 5, 'SS3A', 14.29, 4.11, 34.69, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 11, 'SS3A', 14.81, 6.65, 63.94, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (75, 15, 'SS3A', 6.32, 12.14, 51.99, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 1, 'SS3A', 10.95, 0.15, 8.53, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 2, 'SS3A', 0.34, 6.29, 43.08, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 19, 'SS3A', 1.32, 0.04, 25.98, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 26, 'SS3A', 6.49, 10.83, 21.16, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 3, 'SS3A', 2.19, 12.96, 69.66, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 4, 'SS3A', 13.9, 0.35, 53.22, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 5, 'SS3A', 10.93, 13.97, 52.51, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 11, 'SS3A', 8.02, 0.52, 51.28, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (76, 15, 'SS3A', 1.87, 3.62, 61.98, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 1, 'SS3A', 6.94, 6.72, 51.35, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 2, 'SS3A', 13.12, 5.3, 63.96, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 19, 'SS3A', 7.75, 9.77, 16.55, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 26, 'SS3A', 7.3, 3.2, 16.67, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 3, 'SS3A', 12.01, 1.96, 43.77, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 4, 'SS3A', 2.31, 0.68, 61.68, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 5, 'SS3A', 10.43, 12.89, 63.61, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 11, 'SS3A', 11.71, 10.14, 6.25, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (77, 15, 'SS3A', 2.95, 0.88, 0.41, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 1, 'SS3A', 1.48, 0.95, 18.64, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 2, 'SS3A', 10.28, 3.23, 52.46, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 19, 'SS3A', 10.76, 1.44, 0.85, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 26, 'SS3A', 8.68, 2.49, 16.09, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 3, 'SS3A', 3.85, 3.04, 3.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 4, 'SS3A', 2.02, 9.17, 64.03, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 5, 'SS3A', 8.92, 8.38, 30.39, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 11, 'SS3A', 5.76, 14.17, 57.05, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (78, 15, 'SS3A', 7.09, 3.25, 6.0, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 1, 'SS3A', 11.93, 4.38, 1.2, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 2, 'SS3A', 14.49, 6.04, 57.62, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 19, 'SS3A', 10.58, 11.74, 25.45, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 26, 'SS3A', 2.14, 7.54, 34.4, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 3, 'SS3A', 10.32, 2.73, 18.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 4, 'SS3A', 10.24, 1.32, 31.4, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 5, 'SS3A', 1.35, 14.4, 50.81, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 11, 'SS3A', 12.28, 12.92, 60.66, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (79, 15, 'SS3A', 7.15, 11.99, 1.46, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 1, 'SS3A', 4.06, 9.21, 26.54, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 2, 'SS3A', 1.28, 4.57, 39.95, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 19, 'SS3A', 0.26, 10.77, 45.14, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 26, 'SS3A', 9.45, 0.95, 0.94, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 3, 'SS3A', 8.08, 0.79, 49.65, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 4, 'SS3A', 3.95, 13.62, 56.13, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 5, 'SS3A', 10.43, 2.39, 53.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 11, 'SS3A', 1.62, 9.12, 6.85, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (80, 15, 'SS3A', 4.41, 4.07, 58.95, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 1, 'SS3B', 12.06, 4.46, 10.06, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 2, 'SS3B', 14.15, 9.16, 31.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 19, 'SS3B', 13.68, 12.43, 6.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 26, 'SS3B', 8.79, 6.07, 39.76, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 8, 'SS3B', 1.51, 5.49, 29.89, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 9, 'SS3B', 11.34, 5.0, 17.81, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 10, 'SS3B', 10.97, 10.68, 4.13, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 7, 'SS3B', 6.99, 9.41, 10.56, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (81, 6, 'SS3B', 12.38, 11.11, 5.15, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 1, 'SS3B', 5.0, 10.91, 39.55, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 2, 'SS3B', 7.21, 0.28, 62.59, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 19, 'SS3B', 4.59, 10.89, 20.71, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 26, 'SS3B', 2.51, 8.93, 32.6, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 8, 'SS3B', 3.82, 9.96, 11.38, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 9, 'SS3B', 5.14, 11.31, 9.28, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 10, 'SS3B', 2.41, 7.88, 65.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 7, 'SS3B', 7.29, 14.83, 68.68, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (82, 6, 'SS3B', 8.05, 12.57, 45.02, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 1, 'SS3B', 10.96, 1.63, 34.62, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 2, 'SS3B', 6.16, 2.32, 49.1, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 19, 'SS3B', 5.94, 13.11, 58.46, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 26, 'SS3B', 10.48, 13.56, 15.44, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 8, 'SS3B', 5.24, 0.56, 2.51, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 9, 'SS3B', 12.09, 8.84, 26.54, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 10, 'SS3B', 3.85, 10.36, 57.18, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 7, 'SS3B', 9.72, 3.55, 22.64, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (83, 6, 'SS3B', 9.09, 9.42, 49.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 1, 'SS3B', 5.83, 4.21, 14.7, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 2, 'SS3B', 13.83, 14.24, 55.13, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 19, 'SS3B', 13.21, 11.63, 57.38, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 26, 'SS3B', 7.97, 1.41, 1.72, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 8, 'SS3B', 4.36, 3.65, 62.29, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 9, 'SS3B', 0.42, 3.78, 19.17, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 10, 'SS3B', 3.89, 1.23, 52.72, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 7, 'SS3B', 3.4, 6.84, 44.02, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (84, 6, 'SS3B', 5.69, 10.23, 40.56, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 1, 'SS3B', 8.46, 2.12, 65.54, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 2, 'SS3B', 5.33, 9.89, 28.14, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 19, 'SS3B', 0.52, 7.34, 17.36, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 26, 'SS3B', 5.75, 14.74, 26.9, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 8, 'SS3B', 2.52, 7.75, 68.98, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 9, 'SS3B', 9.71, 9.99, 49.88, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 10, 'SS3B', 8.01, 0.26, 41.4, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 7, 'SS3B', 13.74, 10.02, 29.66, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (85, 6, 'SS3B', 5.47, 5.38, 11.09, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 1, 'SS3B', 6.26, 3.65, 8.39, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 2, 'SS3B', 13.45, 0.23, 41.27, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 19, 'SS3B', 11.54, 5.8, 31.43, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 26, 'SS3B', 12.95, 5.94, 61.65, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 8, 'SS3B', 2.99, 0.27, 69.43, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 9, 'SS3B', 8.86, 8.83, 54.21, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 10, 'SS3B', 4.95, 8.94, 40.5, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 7, 'SS3B', 12.15, 10.55, 3.53, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (86, 6, 'SS3B', 0.23, 5.23, 18.29, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 1, 'SS3B', 8.67, 14.77, 36.82, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 2, 'SS3B', 1.24, 3.92, 57.31, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 19, 'SS3B', 14.12, 12.28, 0.98, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 26, 'SS3B', 0.14, 3.56, 48.26, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 8, 'SS3B', 10.36, 14.13, 46.73, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 9, 'SS3B', 14.17, 0.97, 20.64, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 10, 'SS3B', 13.99, 9.61, 54.57, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 7, 'SS3B', 13.63, 10.02, 53.18, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (87, 6, 'SS3B', 3.29, 2.09, 8.48, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 1, 'SS3B', 0.36, 0.58, 24.03, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 2, 'SS3B', 14.79, 10.33, 9.71, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 19, 'SS3B', 9.28, 11.7, 21.97, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 26, 'SS3B', 12.21, 8.89, 58.58, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 8, 'SS3B', 6.88, 3.87, 1.24, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 9, 'SS3B', 0.16, 4.24, 57.81, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 10, 'SS3B', 8.36, 7.62, 21.22, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 7, 'SS3B', 7.26, 3.81, 22.84, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (88, 6, 'SS3B', 7.03, 4.39, 45.58, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 1, 'SS3B', 11.54, 14.62, 17.76, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 2, 'SS3B', 5.38, 9.82, 32.61, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 19, 'SS3B', 14.02, 13.82, 59.22, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 26, 'SS3B', 2.1, 12.07, 69.9, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 8, 'SS3B', 9.61, 12.74, 39.33, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 9, 'SS3B', 10.07, 9.26, 69.58, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 10, 'SS3B', 2.61, 13.33, 65.28, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 7, 'SS3B', 9.05, 0.47, 23.87, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (89, 6, 'SS3B', 4.91, 3.04, 38.28, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 1, 'SS3B', 13.85, 7.05, 64.0, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 2, 'SS3B', 8.62, 4.32, 39.65, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 19, 'SS3B', 7.03, 7.59, 51.2, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 26, 'SS3B', 0.05, 13.28, 14.81, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 8, 'SS3B', 13.11, 4.27, 2.79, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 9, 'SS3B', 7.19, 1.08, 5.31, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 10, 'SS3B', 8.23, 12.42, 51.41, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 7, 'SS3B', 11.2, 10.79, 45.15, 'First Term');
INSERT INTO ss_broadsheet (student_id, subject_id, class_id, CA1, CA2, Exam, Term) VALUES (90, 6, 'SS3B', 2.18, 14.46, 44.1, 'First Term');


