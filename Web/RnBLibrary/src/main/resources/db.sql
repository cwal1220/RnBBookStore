CREATE TABLE USERS
(
	u_id VARCHAR2(10),
	u_name VARCHAR2(20),
	u_tel VARCHAR2(20),
	u_addr VARCHAR2(50),
	u_dept VARCHAR2(20),
	u_rank VARCHAR2(10),
	PRIMARY KEY(u_id);
);

CREATE TABLE BOOKS
(
	b_id VARCHAR2(10),
	b_title VARCHAR2(50),
	b_auth VARCHAR2(20),
	b_pub VARCHAR2(30),
	b_cont VARCHAR2(500),
	b_genre VARCHAR2(20),
	b_stat INTEGER,
	b_date DATE,
	PRIMARY KEY(b_id)
);


ALTER TABLE BOOKS MODIFY(b_id VARCHAR2(100));
ALTER TABLE BOOKS MODIFY(b_title VARCHAR2(100));
ALTER TABLE BOOKS MODIFY(b_auth VARCHAR2(100));
ALTER TABLE BOOKS MODIFY(b_pub VARCHAR2(100));
ALTER TABLE BOOKS MODIFY(b_genre VARCHAR2(100));
ALTER TABLE BOOKS MODIFY(b_stat VARCHAR2(50));
ALTER TABLE BOOKS MODIFY(b_date VARCHAR2(50));


ALTER TABLE BOOKS MODIFY(b_cont VARCHAR2(1000));



select * from books where b_id='13';

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
	b_id VARCHAR2(10) PRIMARY KEY,
	r_date DATE,
	FOREIGN KEY(u_id) REFERENCES USERS(u_id),
	FOREIGN KEY(b_id) REFERENCES BOOKS(b_id)
);

DROP TABLE RENTALS;
select * from rentals;

select * from BOOKS where b_id = '86332ef8';
commit;


delete from BOOKS where b_num between 0 and 100;
delete from BOOKS where b_stat = 1;
select * from books;