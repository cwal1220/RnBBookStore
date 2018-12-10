CREATE TABLE mems (
   memNum NUMBER NOT NULL, 
   memId VARCHAR2(20), 
   memPass VARCHAR2(50), 
   memEmail VARCHAR2(100) 
);
 


create sequence mem_seq 
start with 1 
increment by 1
nocache
nocycle;

select * from mems;

select * from users;

CREATE TABLE BOOKS
(
   b_id VARCHAR2(10),
   b_title VARCHAR2(50),
   b_auth VARCHAR2(20),
   b_pub VARCHAR2(30),
   b_cont VARCHAR2(500),
   b_genre VARCHAR2(20),
   b_img VARCHAR2(50), 
   b_stat INTEGER,
   b_date DATE,
   PRIMARY KEY(b_id)
); 

alter table books add(b_img varchar(50)); 
