create database sqlproject;
use sqlproject;

-- Student Table
CREATE TABLE students ( student_id INT PRIMARY KEY, name VARCHAR(50), date_of_birth DATE, address VARCHAR(100), contact_number VARCHAR(15));

-- Coursees Table
CREATE TABLE courses (
course_id INT PRIMARY KEY, name VARCHAR(50), description VARCHAR(200), credits INT
);

-- Grades Table
CREATE TABLE grades (
student_id INT,
course_id INT, FOREIGN KEY (student_id) REFERENCES students (student_id),
grade FLOAT,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id)
);


-- Enrollments Table
CREATE TABLE enrollments (
student_id INT,
course_id INT,
enrollment_date DATE,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id)
);


-- Insert a sample student record
INSERT INTO students (student_id, name, date_of_birth, address, contact_number) VALUES (1, 'John Doe', '1995-07-15', '123 Main Street', '555-1234');

-- Retrieve the student record from the "students" table where the student_id is 1
SELECT * FROM students WHERE student_id = 1;

-- Insert a sample course record
INSERT INTO courses(course_id,name,description,credits) VALUES(101,'Mathematics','Introduction to Calculus',3);

-- Retrieve the course record from the "courses" table where the course_id is 101
SELECT * FROM courses;
SELECT * FROM courses WHERE course_id = 101;

-- Insert a sample grades record
INSERT INTO grades (student_id, course_id, grade) VALUES (1, 101, 85.5);

-- update student's grades
UPDATE grades SET grade = 90.0 WHERE student_id = 1 AND course_id = 101;

-- Insert a sample enrollments record
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES (1, 101, '2023-01-01');

-- Retrieve the course information 
SELECT courses.* FROM courses JOIN enrollments ON courses.course_id = enrollments.course_id WHERE enrollments.student_id = 1;

-- Calculate the average grade
SELECT AVG(grade) FROM grades WHERE student_id = 1;

-- Retrieve the student records
SELECT students.*, AVG(grades.grade) AS average_grade FROM students JOIN grades ON students.student_id = grades.student_id GROUP BY students.student_id ORDER BY average_grade DESC LIMIT 10;

