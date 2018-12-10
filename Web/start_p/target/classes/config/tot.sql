DROP TABLE USERS;
DROP TABLE BOOKS;
DROP TABLE COMMENTS;
DROP TABLE RENTALS

CREATE TABLE USERS
(
   u_id VARCHAR2(10),
   u_name VARCHAR2(20),
   u_tel VARCHAR2(20),
   u_addr VARCHAR2(50),
   u_dept VARCHAR2(20),
   u_rank VARCHAR2(10),
   PRIMARY KEY(u_id)
);
  
select * from mems;

create sequence Event_Num_seq
start with 1
increment by 1
nocache
nocycle;


CREATE TABLE EVENTBOARD(
Event_Num number,
Event_Name varchar2(100),
Event_Mainpic varchar2(1000),
Event_Content varchar2(500),
Event_Date date
);



select * from eventboard;

CREATE TABLE books
(
   b_num number,
   b_id VARCHAR2(10),
   b_img VARCHAR2(50), 
   PRIMARY KEY(b_id)
);

create sequence book_seq 
start with 1 
increment by 1
nocache
nocycle;


CREATE TABLE BOOK
(
   b_id VARCHAR2(10),
   b_img VARCHAR2(50),
   b_title VARCHAR2(50),
   PRIMARY KEY(b_id)
);

CREATE TABLE BOOKS
(
   b_num number,
   b_id VARCHAR2(10),
   b_title VARCHAR2(50),
   b_auth VARCHAR2(20),
   b_pub VARCHAR2(20),
   b_cont VARCHAR2(20),
   b_genre VARCHAR2(20),
   b_mainpic VARCHAR2(50), 
   b_stat number default 1, 
   b_date VARCHAR2(50),   
   PRIMARY KEY(b_id)
); 

CREATE TABLE BOOKS
(
   b_id VARCHAR2(10),
   b_title VARCHAR2(50),
   b_auth VARCHAR2(20),
   PRIMARY KEY(b_id)
);

select * from books;



alter table books add(b_num number); 

CREATE TABLE COMMENTS
(
   b_id VARCHAR2(10),
   c_date DATE,
   c_cont VARCHAR2(100),
   FOREIGN KEY(b_id) REFERENCES BOOKS(b_id)
);

CREATE TABLE RENTALS
(
   u_id VARCHAR2(10),
   b_id VARCHAR2(10),
   r_date DATE,
   PRIMARY KEY(u_id, b_id),
   FOREIGN KEY(u_id) REFERENCES USERS(u_id),
   FOREIGN KEY(b_id) REFERENCES BOOKS(b_id)
);


CREATE TABLE book(
Event_Num number,
Event_Name varchar2(100),
Event_Mainpic varchar2(1000)
);

select * from book;

create sequence Event_Num_seq
start with 1
increment by 1
nocache
nocycle;

create sequence book_Num_seq
start with 1
increment by 1
nocache
nocycle;


create sequence book_seq
start with 1
increment by 1
nocache
nocycle;


book_seq.nextval

INSERT INTO USERS VALUES('7b4f470b', 'Dog', '010-9932-8791', 'Seoul', 'Development', 'Staff');
INSERT INTO USERS VALUES('7b4f470c', 'Cat', '010-9932-8791', 'Busan', 'HR', 'Manager');

INSERT INTO BOOKS VALUES('d528f396', 'Python Tutorial', 'Chan', 'RNBSOFT', 'Python is very very very funny language', 'IT', 1, '2018-09-23');
INSERT INTO BOOKS VALUES('d528f395', 'Fucking JAVA', 'TaeKyun', 'NCSOFT', 'Java... Fucking.... I hate java language', 'IT', 0, '2018-11-01');


select * from USERS;
select * from books;
select * from book;
show tables;

drop table rentals;
drop table comments;
drop table books;
drop table book;



select * from books where b_title like '%'||'sad'||'%';
        
        

