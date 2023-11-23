-- DDL Statements --

-- Create Table: Defines a table to store student information
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Explanation: Creates a table named 'Students' with columns for student information. The 'StudentID' column is set as the primary key, and a foreign key constraint is established on the 'DepartmentID' column, referencing the 'Departments' table.

-- Create View: Creates a view to display student details along with department names
CREATE VIEW StudentDetails AS
SELECT StudentID, FirstName, LastName, DepartmentName
FROM Students
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;

-- Explanation: Creates a view named 'StudentDetails' that combines data from the 'Students' and 'Departments' tables, displaying student details along with department names.

-- Create Index: Creates an index on the last name for faster retrieval
CREATE INDEX IX_StudentLastName ON Students(LastName);

-- Explanation: Creates an index named 'IX_StudentLastName' on the 'LastName' column of the 'Students' table. Indexes improve the speed of data retrieval operations.

-- Create Sequence: Creates a sequence to generate unique student IDs
CREATE SEQUENCE StudentID_Seq START WITH 1 INCREMENT BY 1;

-- Explanation: Creates a sequence named 'StudentID_Seq' to generate unique student IDs automatically.

-- DML Statements --

-- Insert Data: Adds a new student record
INSERT INTO Students (StudentID, FirstName, LastName, DepartmentID)
VALUES (1, 'Alice', 'Smith', 101);

-- Explanation: Inserts a new student record with specified details into the 'Students' table.

-- Update Data: Modifies the last name of a student with StudentID 1
UPDATE Students
SET LastName = 'Johnson'
WHERE StudentID = 1;

-- Explanation: Modifies the last name of a student with 'StudentID' 1 in the 'Students' table.

-- Delete Data: Removes a student record with StudentID 1
DELETE FROM Students
WHERE StudentID = 1;

-- Explanation: Deletes the student record with 'StudentID' 1 from the 'Students' table.

-- Select with WHERE Clause: Retrieves all students in a specific department
SELECT * FROM Students
WHERE DepartmentID = 101;

-- Explanation: Retrieves all columns from the 'Students' table where the 'DepartmentID' is 101.

-- Aggregate Function: Calculates the average GPA of all students
SELECT AVG(GPA) AS AverageGPA
FROM Students;

-- Explanation: Calculates the average GPA (Grade Point Average) of all students in the 'Students' table.

-- Join Tables: Retrieves student details along with department names by joining tables
SELECT Students.StudentID, FirstName, LastName, DepartmentName
FROM Students
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;

-- Explanation: Retrieves student details along with department names by joining the 'Students' and 'Departments' tables.

-- Subquery: Retrieves students in departments located in 'City'
SELECT FirstName, LastName
FROM Students
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Location = 'City');

-- Explanation: Retrieves first and last names of students in departments located in 'City' using a subquery.

-- Order By Clause: Retrieves all students, ordered by last name in ascending order
SELECT * FROM Students
ORDER BY LastName ASC;

-- Explanation: Retrieves all columns from the 'Students' table, ordered by last name in ascending order.

-- Group By Clause: Counts the number of students in each department
SELECT DepartmentID, COUNT(*) AS StudentCount
FROM Students
GROUP BY DepartmentID;

-- Explanation: Counts the number of students in each department using the 'GROUP BY' clause.

-- Conditional Aggregation: Calculates the average GPA of students with a GPA greater than 3.5 in each department
SELECT DepartmentID, AVG(CASE WHEN GPA > 3.5 THEN GPA ELSE NULL END) AS AvgHighGPA
FROM Students
GROUP BY DepartmentID;

-- Explanation: Calculates the average GPA of students with a GPA greater than 3.5 in each department using conditional aggregation.
