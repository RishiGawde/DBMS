create database Company;
use Company;

create table employee(
SSN int primary key not null,
FNAM varchar(15) not null,
MINIT varchar(15),
LNAM varchar(15),
BDATE varchar(8),
SEX varchar(6),
ADDRESS varchar(50),
SUPERSSN int,
DNO int,
SALARY int);

USE company;

CREATE TABLE department (
dname VARCHAR(10) NOT NULL,
dnumber INT PRIMARY KEY NOT NULL,
mgrssn INT,
sdate VARCHAR(20)
);

ALTER table company.employee
ADD FOREIGN KEY (DNO) references department(dnumber);

CREATE TABLE dept_loc(
dlno INT, 
dloc VARCHAR(15)  
);

ALTER TABLE dept_loc 
ADD PRIMARY KEY (dlno,dloc);

CREATE TABLE project(
pname VARCHAR(15),
pnumber int primary key not null,
ploc VARCHAR(20),
dpnum int 
);

CREATE TABLE works_on(
essn int,
pno int,
hous int
);

ALTER TABLE works_on
ADD PRIMARY KEY(essn,pno);

CREATE TABLE dependent(
esn int,
dependent_name VARCHAR(20),
gender VARCHAR(10),
bdate VARCHAR(10),
relationship VARCHAR(10)
);

ALTER TABLE dependent 
ADD PRIMARY KEY(esn,dependent_name);

ALTER TABLE employee
ADD FOREIGN KEY (dno) REFERENCES department(dnumber);

ALTER TABLE department
ADD FOREIGN KEY (mgrssn) REFERENCES employee(ssn);

ALTER TABLE dept_loc
ADD FOREIGN KEY (d1no) REFERENCES department(dnumber);

ALTER TABLE project
ADD FOREIGN KEY (dpnum) REFERENCES department(dnumber);

ALTER TABLE works_on
ADD FOREIGN KEY (essn) REFERENCES employee(ssn);

ALTER TABLE works_on
ADD FOREIGN KEY (pno) REFERENCES project(pnumber);

ALTER TABLE works_on
ADD PRIMARY KEY (essn, pno);

ALTER TABLE dependent
ADD FOREIGN KEY (esn) REFERENCES employee(ssn);


SHOW TABLES;

INSERT INTO Department (dname, dnumber, mgrssn, sdate) VALUES
('HR', 1, NULL, '2023-01-10'),
('IT', 2, NULL, '2023-02-15'),
('Sales', 3, NULL, '2023-03-20'),
('Finance', 4, NULL, '2023-04-12'),
('Admin', 5, NULL, '2023-05-18');

INSERT INTO Employee
(fnam, minit, lnam, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('John','A','Smith',1001,'19900110','Mumbai','Male',60000,1001,2),
('Alice','B','Brown',1002,'19920315','Delhi','Female',55000,1001,1),
('David','C','Miller',1003,'19880720','Pune','Male',70000,1001,3),
('Sara','D','Wilson',1004,'19951105','Chennai','Female',50000,1003,4),
('Mike','E','Taylor',1005,'19910918','Bangalore','Male',65000,1003,5);

UPDATE Department SET mgrssn = 1002 WHERE dnumber = 1;
UPDATE Department SET mgrssn = 1001 WHERE dnumber = 2;
UPDATE Department SET mgrssn = 1003 WHERE dnumber = 3;
UPDATE Department SET mgrssn = 1004 WHERE dnumber = 4;
UPDATE Department SET mgrssn = 1005 WHERE dnumber = 5;

INSERT INTO dept_loc (dlno, dloc) VALUES
(1,'Mumbai'),
(2,'Delhi'),
(3,'Pune'),
(4,'Chennai'),
(5,'Bangalore');

INSERT INTO Project (pname, pnumber, ploc, dpnum) VALUES
('Payroll',101,'Mumbai',4),
('Website',102,'Delhi',2),
('CRM',103,'Pune',3),
('Recruit',104,'Mumbai',1),
('Inventory',105,'Bangalore',5);

INSERT INTO works_on (essn, pno, hous) VALUES
(1001,102,20),
(1002,104,15),
(1003,103,25),
(1004,101,18),
(1005,105,22);

INSERT INTO Dependent
(esn, dependent_name, gender, bdate, relationship)
VALUES
(1001,'Anna','Female','2015-05-10','Daughter'),
(1002,'Tom','Male','2016-08-14','Son'),
(1003,'Mary','Female','1989-12-01','Wife'),
(1004,'Sam','Male','2018-02-18','Son'),
(1005,'Lisa','Female','1993-06-22','Wife');

SELECT * FROM employee;

Select SSN, FNAM, LNAM FROM employee;

Select SSN, FNAM, LNAM FROM employee ORDER BY SSN;

Select d.dname, d.dnumber, CONCAT(e.FNAM,' ',e.LNAM) AS manager
FROM department d
LEFT JOIN employee e ON d.mgrssn=e.SSN;

Select * from employee;
Select FNAM, LNAM, SALARY FROM employee WHERE SALARY>50000 AND SALARY BETWEEN 50000 AND 70000 AND DNO=5 AND SEX='Male';
Select FNAM, LNAM, SALARY FROM employee WHERE SALARY>50000;
Select FNAM, LNAM, SALARY FROM employee WHERE SALARY BETWEEN 50000 AND 70000;
Select FNAM, LNAM, SALARY FROM employee WHERE DNO=5;
Select FNAM, LNAM, SALARY FROM employee WHERE SEX='Male';

SELECT dno, AVG(salary) AS avg_salary
FROM employee
GROUP BY dno 
HAVING AVG(salary)>50000;

SELECT DNO,COUNT(*) as employee_count
FROM employee
GROUP BY DNO 
HAVING employee_count > 1;

SELECT FNAM,LNAM,SALARY 
FROM employee
WHERE SALARY > (SELECT AVG(SALARY) FROM employee);

SELECT e.FNAM,e.LNAM,p.ploc
FROM employee e
JOIN department d
ON e.DNO=d.dnumber
JOIN project p
ON d.dnumber=p.dpnum
WHERE ploc='Mumbai';



SELECT * FROM dept_loc;
SELECT * FROM Project;
SELECT * FROM works_on;
SELECT * FROM Dependent;










