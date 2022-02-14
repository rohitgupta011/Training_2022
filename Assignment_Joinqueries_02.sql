--BOOKS TABLE CRAETED 

CREATE TABLE BOOKS
(
id	INT CONSTRAINT PK_BOOK_ID  PRIMARY KEY,
title VARCHAR(30) NOT NULL,
type VARCHAR(20),
author_id INT NOT NULL,
editor_id INT NOT NULL,
translator_id INT 
);

--AUTHORS TABLE CRAETED 

CREATE TABLE AUTHORS
(
id	INT CONSTRAINT PK_AUTHORS_ID  PRIMARY KEY,
first_name	VARCHAR(20)  NOT NULL,
last_name VARCHAR(20)  NOT NULL
);

--EDITORS TABLE CRAETED 

CREATE TABLE EDITORS
(
id	INT CONSTRAINT PK_EDITORS_ID  PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL
);

--TRANSLATORS TABLE CRAETED 

CREATE TABLE TRANSLATORS
(
Id	INT CONSTRAINT PK_TRANSLATORS_ID  PRIMARY KEY,
first_name	VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL
);

--data inserted into table BOOKS   
INSERT INTO BOOKS VALUES (1,'Time to Grow Up!','original',11,21,null);
INSERT INTO BOOKS VALUES(2,'Your Trip','translated',15,22,32);
INSERT INTO BOOKS VALUES(3,'Lovely Love','original' ,14,24,NULL);
INSERT INTO BOOKS VALUES(4,'Dream Your Life','original',11,24,NULL);
INSERT INTO BOOKS VALUES(5,'Oranges','translated',12,25,31);
INSERT INTO BOOKS VALUES(6,'Your Happy Life','translated',15,22,33);
INSERT INTO BOOKS VALUES(7,'Applied AI','translated',13,23,34);
INSERT INTO BOOKS VALUES(8,'My Last Book','original',11,28,NULL);

--data inserted into table AUTHORS  

INSERT INTO AUTHORS VALUES(11,'Ellen','Writer');
INSERT INTO AUTHORS VALUES(12,'Olga','Savelieva');
INSERT INTO AUTHORS VALUES(3,'Jack','Smart');
INSERT INTO AUTHORS VALUES(14,'Donald','Brain');
INSERT INTO AUTHORS VALUES(15,'Yao','Dou');

--data inserted into table EDITORS

INSERT INTO EDITORS VALUES(21,'Daniel','Brown');
INSERT INTO EDITORS VALUES(22,'Mark','Johnson');
INSERT INTO EDITORS VALUES(23,'Maria','Evans');
INSERT INTO EDITORS VALUES(24,'Cathrine','Roberts');
INSERT INTO EDITORS VALUES(25,'Sebastian','Wright');
INSERT INTO EDITORS VALUES(26,'Barbara','Jones');
INSERT INTO EDITORS VALUES(27,'Matthew','Smith');


--data inserted into table TRANSLATORS   

INSERT INTO TRANSLATORS VALUES(31,'Ira','Davies');
INSERT INTO TRANSLATORS VALUES(32,'Ling','Weng');
INSERT INTO TRANSLATORS VALUES(33, 'Kristian','Green');
INSERT INTO TRANSLATORS VALUES(34,'Roman','Edwards');


--feching all record once 
SELECT * FROM BOOKS;
SELECT * FROM AUTHORS;
SELECT * FROM EDITORS;
SELECT * FROM TRANSLATORS;

--Let�s say we want to show book titles along with their authors
SELECT b.id , b.title , a.first_name , a.last_name FROM
BOOKS b
INNER JOIN AUTHORS a --> common data will display 
ON 
b.author_id=a.id
ORDER BY b.id;
--Example #2
--In our second example, we�ll be displaying books along with their translators

SELECT b.id ,b.title, t.first_name , t.last_name
FROM BOOKS b
INNER JOIN 
TRANSLATORS t
ON 
b.translator_id = t.ID 
ORDER BY b.id;
--Example #3
--For instance, let�s say that we want to display information about each book�s authors and translator,
--We also want to keep the basic information about each book (i.e., id, title, and type).

SELECT b.id, b.title , b.type , a.id , a.first_name , a.last_name, t.id , t.first_name , t.last_name
FROM BOOKS b
LEFT JOIN AUTHORS a 
ON b.author_id= a.id 
LEFT JOIN TRANSLATORS t
ON 
b.translator_id = t.ID
ORDER BY b.id;
--Example #4
--This time, we want to show the basic book information (i.e., ID and title) 
--along with the last names of the corresponding editors
--Again, we want to keep all of the books in the result set. So, what would be the query?

SELECT b.id , b.title  , e.last_name 
FROM BOOKS b
LEFT JOIN  EDITORS e 
ON 
b.editor_id =  e.id 
ORDER BY b.id;


--Example #5
--We want to show the ALL basic EDITORS information (i.e., FIRST and LAST NAME ) 
--along with the BOOKS INFORMATION
SELECT e.id , e.first_name , e.last_name , b.id , b.title , b.type , b.author_id , b.editor_id , b.translator_id
FROM EDITORS e
LEFT JOIN  BOOKS b 
ON 
e.id = b. editor_id
ORDER BY b.id;

--Example #6
--let�s again join the books and editors tables, but this time, 
--we�ll be keeping all records from both tables.

SELECT e.id , e.first_name , e.last_name , b.id , b.title , b.type , b.author_id , b.editor_id , b.translator_id
FROM EDITORS e
FULL JOIN  BOOKS b 
ON 
e.id = b. editor_id
ORDER BY b.id;


--Example #7
--we want to join all four tables to get information about all of the books, 
--DISPLAY ALL authors, editors, and translators in one table

SELECT e.id , e.first_name , e.last_name , b.id , b.title , b.type , b.author_id , b.editor_id , b.translator_id ,t.ID,
t.first_name ,t.last_name
FROM EDITORS e
FULL JOIN  BOOKS b 
ON 
e.id = b. editor_id
FULL JOIN  TRANSLATORS t 
ON 
e.id = t. ID 
FULL JOIN  AUTHORS a 
ON 
e.id = a. ID 
ORDER BY b.id;

