-- CREATE DATABASE
CREATE DATABASE CollegeDB;
USE CollegeDB;


-- 1. FACULTY TABLE
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);


-- 2. STUDENTS TABLE
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dept VARCHAR(50) NOT NULL,
    join_year INT NOT NULL
);


-- 3. COURSES TABLE
CREATE TABLE Courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id)
        REFERENCES Faculty(faculty_id)
);


-- 4. REGISTRATIONS TABLE
CREATE TABLE Registrations (
    reg_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    semester VARCHAR(20) NOT NULL,
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id),
    UNIQUE (student_id, course_id, semester)
);


-- INSERT FACULTY DATA
INSERT INTO Faculty
(faculty_name, department, email)
VALUES
('Dr. Ramesh Kumar', 'Computer Science', 'ramesh@college.edu'),
('Prof. Priya Sharma', 'Mathematics', 'priya@college.edu');


-- INSERT STUDENT DATA
INSERT INTO Students
(student_name, email, dept, join_year)
VALUES
('Deepak', 'deepak@student.edu', 'B.Sc CS', 2024),
('Sanjay', 'sanjay@student.edu', 'B.Sc CS', 2024),
('Kavitha', 'kavitha@student.edu', 'B.Sc Maths', 2024);


-- INSERT COURSE DATA
INSERT INTO Courses
(course_id, course_name, credits, faculty_id)
VALUES
('CS201', 'Database Management Systems', 4, 1),
('MA201', 'Discrete Mathematics', 3, 2);


-- INSERT REGISTRATION DATA
INSERT INTO Registrations
(student_id, course_id, semester)
VALUES
(1, 'CS201', 'Semester 3'),
(2, 'CS201', 'Semester 3'),
(1, 'MA201', 'Semester 3'),
(3, 'MA201', 'Semester 3');
SELECT * FROM Faculty;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Registrations;
SELECT
    c.course_id AS 'Course Code',
    c.course_name AS 'Course Name',
    f.faculty_name AS 'Faculty Name',
    s.student_id AS 'Student ID',
    s.student_name AS 'Student Name',
    r.semester AS 'Semester'
FROM Registrations r
JOIN Courses c
    ON r.course_id = c.course_id
LEFT JOIN Faculty f
    ON c.faculty_id = f.faculty_id
JOIN Students s
    ON r.student_id = s.student_id
ORDER BY c.course_id, s.student_name;
