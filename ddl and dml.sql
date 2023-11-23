PART 1 

CREATE DATABASE OFFICE;

USE OFFICE;

-- 1. Create a Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Department VARCHAR(50)
);

-- Explanation: This makes a table named `Employee` to store information like employee ID, first name, last name, date of birth, and department.

-- Show the Employee table
SHOW TABLES;

-- 2. Create a View
CREATE VIEW EmployeeDetails AS
    SELECT EmployeeID, FirstName, LastName, Department
    FROM Employee
    WHERE Department = 'IT';

-- Explanation: This creates a virtual table (a view) called `EmployeeDetails` showing details of employees working in the 'IT' department.

-- Show the EmployeeDetails view
SHOW TABLES;

-- 3. Create an Index
CREATE INDEX idx_Employee_Department ON Employee(Department);

-- Explanation: This helps to search and sort employees faster based on their department.

-- Show the Employee table after adding the index
SHOW TABLES;

-- 4. Create a Sequence
CREATE SEQUENCE emp_id_seq START WITH 1 INCREMENT BY 1;

-- Explanation: This sets up a counter (`emp_id_seq`) that automatically increases by 1 each time you add a new employee. It's handy for creating unique IDs.

-- Show the Employee table (Sequences are not shown directly using SHOW TABLES)
SHOW TABLES;

-- 5. Create a Synonym
CREATE SYNONYM EmpDetails FOR EmployeeDetails;

-- Explanation: This provides a shorter name (`EmpDetails`) to refer to the `EmployeeDetails` view.

-- Show the EmployeeDetails view after adding the synonym
SHOW TABLES;

-- 6. Add a Check Constraint
ALTER TABLE Employee
ADD CONSTRAINT chk_DOB CHECK (DOB >= '1980-01-01');

-- Explanation: This ensures that the date of birth (`DOB`) for employees is not earlier than January 1, 1980.

-- Show the Employee table after adding the constraint
SHOW TABLES;

-- 7. Insert Data into the Employee Table
INSERT INTO Employee (EmployeeID, FirstName, LastName, DOB, Department)
VALUES 
    (1, 'Raj', 'Kumar', '1992-07-18', 'HR'),
    (2, 'Priya', 'Sharma', '1988-03-25', 'IT');

-- Explanation: This adds two employees (Raj Kumar and Priya Sharma) to the Employee table.

-- Show the Employee table after inserting data
SELECT * FROM Employee;

-- 8. Update Employee Department
UPDATE Employee
SET Department = 'Finance'
WHERE LastName = 'Kumar';

-- Explanation: This changes Raj Kumar's department to 'Finance'.

-- Show the Employee table after updating data
SELECT * FROM Employee;

-- 9. Delete Employee Record
DELETE FROM Employee
WHERE EmployeeID = 2;

-- Explanation: This removes Priya Sharma's record from the Employee table.

-- Show the Employee table after deleting a record
SELECT * FROM Employee;

-- 10. Query to Retrieve Employee Information
SELECT EmployeeID, FirstName, LastName, DOB, Department
FROM Employee
WHERE Department = 'HR';

-- Explanation: This finds and displays details of employees working in the 'HR' department.

-- Show the Employee table after the final query
SELECT * FROM Employee;


PART 2

-- 11. Insert Data into the Employee Table
INSERT INTO Employee (EmployeeID, FirstName, LastName, DOB, Department)
VALUES 
    (3, 'Amit', 'Patel', '1985-12-10', 'Finance'),
    (4, 'Sonia', 'Verma', '1990-05-05', 'HR');

-- Explanation: This adds two more employees (Amit Patel and Sonia Verma) to the Employee table.

-- Show the Employee table after inserting additional data
SELECT * FROM Employee;

-- 12. Update Employee's Department and Name
UPDATE Employee
SET Department = 'IT', FirstName = 'Anil'
WHERE LastName = 'Patel';

-- Explanation: This changes Amit Patel's department to 'IT' and updates his first name to 'Anil'.

-- Show the Employee table after updating data
SELECT * FROM Employee;

-- 13. Delete Employees in the 'HR' Department
DELETE FROM Employee
WHERE Department = 'HR';

-- Explanation: This removes employees from the 'HR' department (Sonia Verma) from the Employee table.

-- Show the Employee table after deleting records
SELECT * FROM Employee;

-- 14. Query to Retrieve Employee Information
SELECT EmployeeID, FirstName, LastName, DOB, Department
FROM Employee
WHERE Department = 'IT';

-- Explanation: This finds and displays details of employees working in the 'IT' department.

-- Show the Employee table after the final query
SELECT * FROM Employee;
