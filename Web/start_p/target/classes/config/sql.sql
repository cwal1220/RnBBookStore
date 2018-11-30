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