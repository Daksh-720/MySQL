CREATE DATABASE COLLEGE;
USE COLLEGE;

CREATE TABLE student(
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO student 
(id, name) VALUES
(101, "ADAM"),
(102, "BOB"),
(103, "CASEY");


CREATE TABLE course(
 id INT PRIMARY KEY,
 course VARCHAR(50)
 );
 
 INSERT INTO course (id, course)
 VALUES
 (102, "ENGLISH"),
 (105, "MATHS"),
 (103, "SCIENCE"),
 (107, "COMPUTER SCIENCE");
 
 
 
-- --------------
-- INNER_JOIN   |
-- --------------
SELECT *
FROM student AS s
INNER JOIN course AS c
ON s.id = c.id;



-- -----------------
-- LEFT_JOIN       |
-- -----------------
SELECT *
FROM student AS s
LEFT JOIN course AS c
ON s.id = c.id;


-- ---------------
-- RIGHT_JOIN    |
-- ---------------
SELECT *
FROM student AS s
RIGHT JOIN course AS c
ON s.id = c.id;



-- -----------------
-- FULL_JOIN       |
-- -----------------
SELECT *
FROM student AS s
LEFT JOIN course AS c
ON s.id = c.id
UNION
SELECT *
FROM student AS s
RIGHT JOIN course AS c
ON s.id = c.id;