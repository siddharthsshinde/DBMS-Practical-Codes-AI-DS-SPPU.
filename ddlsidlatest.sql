-- Create Table: Defines a table named 'Employees' with columns for employee information.
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create View: Creates a view named 'EmployeeDetails' that combines data from 'Employees' and 'Departments'.
CREATE VIEW EmployeeDetails AS
SELECT EmployeeID, FirstName, LastName, DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- Create Index: Creates an index on the 'LastName' column of the 'Employees' table for faster retrieval.
CREATE INDEX IX_EmployeeLastName ON Employees(LastName);

-- Create Sequence: Defines a sequence named 'EmployeeID_Seq' to generate unique employee IDs.
CREATE SEQUENCE EmployeeID_Seq START WITH 1 INCREMENT BY 1;

-- Create Synonym: Establishes a synonym 'Emp' for the 'Employees' table for simplified referencing.
CREATE SYNONYM Emp FOR Employees;

-- Add Check Constraint: Enforces a check constraint on the 'Salary' column to ensure it is greater than or equal to 30000.
ALTER TABLE Employees
ADD CONSTRAINT CHK_Salary CHECK (Salary >= 30000);

-- Add Unique Constraint: Adds a unique constraint to ensure each 'EmployeeID' in the 'Employees' table is unique.
ALTER TABLE Employees
ADD CONSTRAINT UQ_EmployeeID UNIQUE (EmployeeID);

-- Add Default Constraint: Sets a default value 'Active' for the 'Status' column in the 'Employees' table.
ALTER TABLE Employees
ALTER COLUMN Status SET DEFAULT 'Active';

-- Create Unique Index: Creates a unique index on the 'DepartmentName' column of the 'Departments' table.
CREATE UNIQUE INDEX UQ_Index_DepartmentName ON Departments(DepartmentName);

-- Create Foreign Key Constraint: Establishes a foreign key constraint on the 'ManagerID' column in the 'Employees' table.
ALTER TABLE Employees
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID);


