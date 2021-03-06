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

INSERT INTO USERS VALUES('7b4f470b', 'Dog', '010-9932-8791', 'Seoul', 'Development', 'Staff');
INSERT INTO USERS VALUES('7b4f470c', 'Cat', '010-9932-8791', 'Busan', 'HR', 'Manager');

INSERT INTO BOOKS VALUES('d528f396', 'Python Tutorial', 'Chan', 'RNBSOFT', 'Python is very very very funny language', 'IT', 1, '2018-09-23');
INSERT INTO BOOKS VALUES('d528f395', 'Fucking JAVA', 'TaeKyun', 'NCSOFT', 'Java... Fucking.... I hate java language', 'IT', 0, '2018-11-01');


