-- This is my first SQL project.
CREATE DATABASE LIBRARY_INFORMATION;
USE LIBRARY_INFORMATION;

CREATE TABLE BOOKS(
book_id INT AUTO_INCREMENT PRIMARY KEY,
book_title VARCHAR(50) NOT NULL,
year_of_publication INT NOT NULL
);
CREATE TABLE AUTHOR(
author_name VARCHAR(80) NOT NULL,
place_of_residence VARCHAR(40) NOT NULL,
author_id INT NOT NULL ,
FOREIGN KEY(author_id) REFERENCES BOOKS(book_id)
);
CREATE TABLE BORROWER(
student_id INT NOT NULL PRIMARY KEY,
student_name VARCHAR(45) NOT NULL,
place_of_residence VARCHAR(90) NOT NULL,
book_borrowed_id INT NOT NULL
);
CREATE TABLE TRANSACTIONS(
date_of_borrow VARCHAR(50) NOT NULL,
date_of_return VARCHAR(50) NOT NULL,
fine_charges FLOAT ,
borrower_id INT NOT NULL,
FOREIGN KEY(borrower_id) REFERENCES BORROWER(student_id)
);
ALTER TABLE AUTHOR
ADD age INT NOT NULL;

INSERT INTO BOOKS(book_title,year_of_publication)
VALUES (' The Maiden','2011'),
	    ('Jezebel',2018),
        ('Computer Architecture',2021 ),
        ('Goat Matata' , 2011),
        ('Siku Njema' , 2016),
        ('Spiritual Growth', 2018),
        ('Market Business', 2023),
        ('Slave Trade' , 1993),
        ('Money Heist' , 1999);
INSERT INTO AUTHOR( author_name, place_of_residence, author_id,age)
VALUES ('Maria Gevezuela', 'Mexico', 1,27),
       ('Francis Hula' , 'Phillipians' , 2,67),
       ('Dan Watura' , 'UK', 3,45),
       ('Dan Watura' , 'UK', 3,45),
       ('Ken Walibora','Kenya', 5,61),
       ('Lexy Ariana', 'Italy', 6,19),
       ('Oyugi Nyanjong', 'China' , 7,34),
       ('Mariata Kamara', 'Zimbabwe', 8,27),
       ('Maria Gevezuela', 'Mexico', 1,27);

SELECT * FROM BOOKS AS B LEFT JOIN AUTHOR AS A
ON B.book_id = A.author_id;

/*FROM AUTHOR AS b LEFT JOIN ALBUM3 AS d on b.id = d.band_id
group by b.id
having num_albums = 0;
 SELECT DISTINCT author_name
 from AUTHOR
 WHERE author_id > 0;*/
 UPDATE AUTHOR
 SET age = 35
 WHERE author_id = 1;
 
 SELECT * FROM AUTHOR
 WHERE author_name LIKE '%ri_%';
 -- THE ABOVE CLAUSE IS A WILDCARD.
/* DELETE  FROM AUTHOR WHERE author_id>=9 OR age =0;*/
INSERT INTO BORROWER(student_name,place_of_residence,student_id,book_borrowed_id)
   VALUES( 'Victor Kimathi', 'Victoria',201,1),
		( 'Amy Mutheu', 'L.Turkana',206,2),
		 ( 'James Brian', 'Tatton',202,3),
         ( 'Magaret Akinyi', 'Mau Hills',204,6),
         ( 'Elvis Marube', 'Elementaita',205,7),
		 ( 'Cessina Muchoki', 'R.Tana',203,9);
SELECT * FROM BOOKS AS B INNER JOIN BORROWER AS A
ON B.book_id = A.book_borrowed_id;   

SELECT *
FROM BORROWER
WHERE place_of_residence IN ('Victoria','Mau Hills','Elementaita') AND
 ( student_id > 201);
-- THE IN CLAUSE REDUCES DATA REDUNDACY. 
INSERT INTO TRANSACTIONS(date_of_borrow,date_of_return,fine_charges,borrower_id)
    VALUES('28/02/2024', '20/03/2024', 45 , 201),
          ('10/01/2024', '27/06/2024', 450, 206),
          ('09/04/2024', '15/04/2024', 0, 204),
          ('20/01/2024', '17/03/2024', 75, 205),
          ('15/02/2024', '27/02/2024', 0, 203),
          ('01/03/2024', '13/05/2024', 150, 202);

SELECT student_name,book_borrowed_id,student_id,borrower_id,fine_charges
FROM BORROWER AS w LEFT JOIN TRANSACTIONS AS t
ON w.student_id = t.borrower_id;

SELECT *
FROM AUTHOR
LIMIT 5;
SELECT *
FROM BORROWER
WHERE book_borrowed_id < 7
ORDER BY student_id DESC
LIMIT 4;
-- <> THIS IS SQL IS THE SAME AS A NOT OPERATOR
/* FOR EXAMPLE I CAN SAY
   WHERE STUDENT_ID <> 4; means where student id is not 4.
   OR I CAN SIMPLY USE THE 
     WHERE NOT instead of WHERE.
     
     YOU CAN ALSO USE
		WHERE STUDENT_ID BETWEEN 4 AND 7;
