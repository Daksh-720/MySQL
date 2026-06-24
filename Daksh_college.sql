CREATE DATABASE IF NOT EXISTS daksh_college;
USE daksh_college;

CREATE TABLE STUDENT(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);


CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES dept(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);




INSERT INTO STUDENT
(rollno, name, marks, grade, city)
VALUES
(101, "daksh", 100, "A", "Mumbai"),
(102, "krish", 77, "C", "Pune"),
(103, "veer", 77, "C", "Delhi"),
(104, "parth", 89, "A", "Mumbai"),
(105, "jai", 88, "B", "Mumbai"),
(106, "heet", 81, "B", "Delhi");



INSERT INTO dept
VALUES
(101, "eng"),
(102, "maths");
SELECT * FROM dept;

INSERT INTO teacher VALUES 
(101, "Adam", 101),
(102, "Eve", 102);
SELECT * FROM teacher;

UPDATE dept
SET id = 103
WHERE id = 102;





SELECT name, marks FROM STUDENT;  -- --(TO SELECT PERTICULAR COLUMN)
SELECT * FROM STUDENT;  -- (FOR ALL ELEMENTS)

-- (FOR UNIQUE VALUES LIKE UNREPEATED DATA)
SELECT DISTINCT city FROM STUDENT;

SELECT * FROM STUDENT WHERE marks > 80;  -- (in this clause is used to show table of data whose marks is greater than 80)
SELECT * FROM STUDENT WHERE city = "Mumbai"; -- (in this clause is used to show table of data whose city is equal to "Mumbai")

SELECT * FROM STUDENT WHERE marks > 80 AND city="Mumbai"; -- (Use of multiple Clauses in single line)

SELECT * FROM STUDENT WHERE marks+10 > 100;  -- (Use of arithematic operators in clauses)
SELECT * FROM STUDENT WHERE marks BETWEEN 85 and 100; -- (BETWEEN operater)
SELECT * FROM STUDENT WHERE city IN ("Delhi", "Mumbai");  -- (only data of students in delhi and mumbai)
SELECT * FROM STUDENT WHERE city NOT IN ("Delhi", "Mumbai");  -- (city NOT IN delhi AND mumbai)
SELECT * FROM STUDENT LIMIT 4;   -- (TO LIMIT THE AMOUNT OF DATA TO SHOW)
SELECT * FROM STUDENT ORDER BY city ASC;  -- (ascending order)
SELECT *FROM STUDENT ORDER BY rollno DESC;  -- (descending order)

--------------------------
-- //AGGREGATE FUNCTIONS//
--------------------------

SELECT MAX(marks) FROM STUDENT;  -- (CAN ALSO USE MIN(marks)-)_ (for single value)
SELECT * FROM STUDENT WHERE marks = (SELECT MAX(marks) FROM STUDENT);  -- (FOR ENTIRE COLUMN)
SELECT AVG(marks) FROM STUDENT;

-- (GROUP BY CLAUSE)-----

SELECT city, count(rollno) FROM STUDENT GROUP BY city;  -- (THIS SHOWS NO. OF STUDENTS IN 1 CITY)
SELECT city, AVG(marks) FROM STUDENT GROUP BY city;    -- (AVG MARKS of student PER CITY)


-- ----------------------------------------------------------------------------------
-- (PROBLEM STATEMENT TO FIND AVG MARKS IN EACH CITY IN ASCENDING ORDER)-------  -- |
SELECT city, AVG(marks) FROM STUDENT GROUP BY city ORDER BY city ASC;            -- |
SELECT city, AVG(marks) FROM STUDENT GROUP BY city ORDER BY AVG(marks) ASC;      -- |
-- ----------------------------------------------------------------------------------


-- ----------------
-- HAVING CLAUSE  |
-- ----------------
SELECT city, COUNT(rollno) FROM STUDENT GROUP BY city HAVING MAX(marks) > 90;



-- -----------------
-- UPDATE VALUES   |
-- -----------------
SET SQL_SAFE_UPDATES = 0;

UPDATE STUDENT
SET grade = "O"
WHERE grade = "A";

UPDATE STUDENT
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

SELECT * FROM STUDENT;
SELECT city FROM STUDENT WHERE grade = "O" GROUP BY city;


-- ------------------
-- DELETE VALUES    |
-- ------------------
-- DELETE FROM STUDENT              {NEVER USE ONLY (DELETE FROM STUDENT;) CUZZ IT DELETES ENTIRE DATABASE}
-- WHERE marks < 80;





