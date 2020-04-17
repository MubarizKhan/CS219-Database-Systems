-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE
( Fname VARCHAR(15) NOT NULL, -- Adding columns
Minit CHAR,
Lname VARCHAR(15) NOT NULL, -- NOT NULL means the domain must have a value
Ssn CHAR(9) NOT NULL, -- CHAR padded to 9 spaces
Bdate DATE, -- Date, YYYY-MM-DD
Address VARCHAR(30), -- Variable length CHAR array (string)
Sex CHAR, -- Single character
Salary DECIMAL(10,2), -- Decimal up to a precision of two decimal points
Super_ssn CHAR(9),
Dno INT NOT NULL,
PRIMARY KEY (Ssn) -- Primary key constraint
);


-- Create DEPARTMENT table
CREATE TABLE DEPARTMENT
( Dname VARCHAR(15) NOT NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9) NOT NULL,
Mgr_start_date DATE,
PRIMARY KEY (Dnumber),
UNIQUE (Dname), -- Unique value constraint - no Departments can have the same name
FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn) ); -- Foreign key constraint
-- Now that the DEPARTMENT table is defined, add the Foreign Key constraints
-- to the EMPLOYEE table.
-- Super_ssn references Ssn
ALTER TABLE EMPLOYEE
--ADD CONSTRAINT FKCONSTR1
FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn);
-- The Dno column is referenced in the Department table
ALTER TABLE EMPLOYEE
--ADD CONSTRAINT FKCONSTR2
FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber);
CREATE TABLE DEPT_LOCATIONS
( Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY (Dnumber, Dlocation), -- Primary key is combined between 2 columns
FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) ); -- Foreign key constraint


CREATE TABLE PROJECT
( Pname VARCHAR(15) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY (Pnumber), -- Primary key constraint
UNIQUE (Pname), -- Uniqye value constraint
FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) ); -- Foreign key constraint


CREATE TABLE WORKS_ON
( Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn, Pno),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn), -- Foreign key constraint
FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) ); -- Foreign key constraint



CREATE TABLE DEPENDENT
( Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(15) NOT NULL,
Sex CHAR,
Bdate DATE,
Relationship VARCHAR(8),
PRIMARY KEY (Essn, Dependent_name), -- Primary key constraint
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) ); -- Foreign key constraint