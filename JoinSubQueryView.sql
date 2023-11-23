-- 1. Create Database
CREATE DATABASE UniversityDB;
-- Explanation: This query creates a new database named `UniversityDB` to store information about students, courses, and enrollment.

-- 2. Use Database
USE UniversityDB;
-- Explanation: This query specifies that subsequent SQL statements will be executed in the `UniversityDB` database.

-- 3. Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);
-- Explanation: This query creates a table named `Students` to store student information.

-- 4. Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);
-- Explanation: This query creates a table named `Courses` to store course information.

-- 5. Create Enrollment Table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
-- Explanation: This query creates a table named `Enrollment` to track students' enrollment in courses. It includes foreign key constraints to link student and course information.

-- 6. Insert Data into Students Table
INSERT INTO Students (StudentID, FirstName, LastName, Age)
VALUES 
    (1, 'Rahul', 'Gupta', 20),
    (2, 'Pooja', 'Sharma', 22);
-- Explanation: This query inserts two student records into the `Students` table.

-- 7. Insert Data into Courses Table
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES 
    (101, 'Mathematics', 3),
    (102, 'Computer Science', 4);
-- Explanation: This query inserts two course records into the `Courses` table.

-- 8. Inner Join
SELECT Students.StudentID, FirstName, LastName, CourseName
FROM Students
INNER JOIN Enrollment ON Students.StudentID = Enrollment.StudentID
INNER JOIN Courses ON Enrollment.CourseID = Courses.CourseID;
-- Explanation: This query uses an inner join to retrieve student information along with the courses they are enrolled in.

-- 9. Left Join
SELECT Students.StudentID, FirstName, LastName, CourseName
FROM Students
LEFT JOIN Enrollment ON Students.StudentID = Enrollment.StudentID
LEFT JOIN Courses ON Enrollment.CourseID = Courses.CourseID;
-- Explanation: This query uses a left join to retrieve all students and their enrolled courses, including students without enrollments.

-- 10. Sub-Query
SELECT StudentID, FirstName, LastName
FROM Students
WHERE StudentID IN (SELECT StudentID FROM Enrollment WHERE Grade = 'A');
-- Explanation: This query uses a sub-query to find students who received an 'A' grade in any course.

-- 11. Create a View
CREATE VIEW StudentEnrollmentView AS
SELECT Students.StudentID, FirstName, LastName, CourseName
FROM Students
INNER JOIN Enrollment ON Students.StudentID = Enrollment.StudentID
INNER JOIN Courses ON Enrollment.CourseID = Courses.CourseID;
-- Explanation: This query creates a view named `StudentEnrollmentView` to simplify querying student enrollment information.

-- 12. Query View
SELECT * FROM StudentEnrollmentView;
-- Explanation: This query retrieves data from the `StudentEnrollmentView` to show student enrollment information.
