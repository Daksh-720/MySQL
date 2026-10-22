create database practical;
use practical;

create table stud(
id INT PRIMARY KEY,
name VARCHAR(20),
location VARCHAR(10),
dob DATE
);

INSERT INTO stud (id, name, location, dob) value (1, "Daksh", "Mumbai", "2009-05-20");
INSERT INTO stud (id, name, location, dob) VALUES
(2, 'Aditi', "Mumbai", '2009-01-07'),
(3, 'Rahul', 'Pune', '2005-08-15'),
(4, 'Amit', 'Thane', '2006-01-10'),
(5, 'Priya', 'Nashik', '2005-11-25'),
(6, 'Sneha', 'Mumbai', '2006-03-12'),
(7, 'Rohit', 'Pune', '2005-07-25'),
(8, 'Priya', 'Thane', '2006-09-18'),
(9, 'Aarav', 'Nashik', '2005-12-05'),
(10, 'Neha', 'Nagpur', '2006-02-14'),
(11, 'Karan', 'Mumbai', '2005-04-22'),
(12, 'Anjali', 'Navi Mumbai', '2006-06-30'),
(13, 'Vishal', 'Pune', '2005-10-11'),
(14, 'Pooja', 'Thane', '2006-08-09'),
(15, 'Aditya', 'Kolhapur', '2005-01-17');

ALTER TABLE stud MODIFY name VARCHAR(100);
ALTER TABLE stud MODIFY location VARCHAR(100);

SELECT * from stud;

SELECT name from stud where location="Mumbai";

DELETE FROM stud WHERE name = "Karan"; 
SET SQL_SAFE_UPDATES = 0;   -- SAFE UPDATES TURNED OFF

SELECT * FROM stud WHERE location <> "Mumbai";   -- selects all the data that are not in mumbai can also use !=


create table marks(
m_id INT(10) PRIMARY KEY,
mark INT(100),
foreign key (m_id) references stud(id)
); 

INSERT INTO marks (m_id, mark)
VALUES
(1, 85),
(2, 92),
(3, 76),
(4, 88),
(5, 67),
(6, 95),
(7, 73),
(8, 84),
(9, 70),
(10, 89),
(12, 91),
(13, 64),
(14, 82),
(15, 96);

SELECT * FROM stud
JOIN marks ON stud.id = marks.m_id;

UPDATE marks SET mark = 100 where m_id=1;

SELECT DISTINCT location FROM stud;       -- selects unique loactions

Select * from stud ORDER BY name ASC;
SELECT * FROM stud ORDER BY id DESC LIMIT 5;
SELECT * FROM stud ORDER BY id ASC limit 5 OFFSET 2;   -- offset skips the number of elements entered, its only used after limit clause

SELECT * FROM stud WHERE location = "Mumbai" AND id > 5;

SELECT * FROM stud WHERE location IN ('Mumbai', 'Pune');

Select id, name FROM stud WHERE id BETWEEN 3 AND 10;

SELECT * FROM stud WHERE name like 'D%';    -- name starts with D;

SELECT stud.name, stud.id, marks.mark FROM stud INNER JOIN marks ON stud.id = marks.m_id;

SELECT location, COUNT(name) AS TOTAL_STUDENTS FROM stud GROUP BY location;

SELECT COUNT(*) AS TOTAL_REC, SUM(mark) AS TOTAL_MARKS, AVG(mark) AS AVERAGE, max(mark) AS MAXIMUM_MARKS FROM marks;

SELECT stud.location, AVG(marks.mark) FROM stud INNER JOIN marks ON stud.id = marks.m_id GROUP BY stud.location;

SELECT location, count(*) as total from stud group by location having count(*) >=2;

SELECT location, count(*) as total from stud where id >5 group by location having count(*)>=2 order by total;

SELECT mark from marks where mark > (select AVG(mark) from marks);

Select stud.id, stud.name, marks.mark from stud Inner Join marks ON stud.id = marks.m_id where marks.mark > (SELECT AVG(mark) from marks); 

Select name, UPPER(name) from stud;
SELECT name, LOWER(name) from stud;

SELECT name, LENGTH(name), CHAR_LENGTH(name) from stud;

SELECT name, left(name, 4), right(name, 2) from stud;

SELECT name, substring(name, 2, 4) from stud;

SELECT CONCAT(name, ' lives in ', location) AS DETAILS FROM stud;

SELECT name, replace(name, 'a', '@') from stud;

SELECT name,
       CHAR_LENGTH(LOWER(name)) -
       CHAR_LENGTH(
           REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
               LOWER(name), 'a', ''), 'e', ''), 'i', ''),
               'o', ''), 'u', '')
       ) AS vowel_count
FROM stud;

select ROUND(AVG(mark),4) from marks;

select * from stud;

select max(mark)-min(mark) from marks;

SELECT id, name FROM stud WHERE location = 'Mumbai'
UNION
SELECT id, name FROM stud WHERE location = 'Navi Mumbai';

INSERT INTO stud (id, name, location, dob) VALUE (16, 'Shreeya', 'Mumbai', '2009-08-05');
INSERT INTO marks (m_id, mark) VALUE (16, NULL);

SELECT stud.id, stud.name, marks.m_id FROM stud INNER JOIN marks ON stud.id = marks.m_id WHERE mark IS NULL;

SELECT name, LPAD(name,length(name)+1, '*') from stud;

select concat(name, " is in ", location) from stud;

select name, lpad(name, 1, '*') from stud;

select name, LEFT(name,1), ASCII(LEFT(name,1)) from stud;

SELECT name, REVERSE(name) FROM stud;

SELECT * FROM stud LEFT JOIN marks ON stud.id = marks.m_id;

SELECT name, CHAR_LENGTH(LOWER(name)) - CHAR_LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')) AS VOWEL_COUNT FROM stud;

SELECT location, COUNT(name) from stud GROUP BY location HAVING COUNT(name) <5;

SELECT *, COALESCE(mark, 'NOT GIVEN') FROM marks;  -- returns the given text in place of null

SELECT *, ISNULL(mark) FROM marks;    -- returns 1 if null value is present

SELECT *, IFNULL(mark, 369) FROM marks;  -- returns the given value in place of null