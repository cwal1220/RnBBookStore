select * from users;

select * from books;

select * from rentals where u_id='7b4f470b';


select 
	* 
from 
	RENTALS r join BOOKS b on r.b_id = b.b_id; 
	
	
	
select * from books;



DELETE 
FROM 
	RENTALS
WHERE
	b_id='86332ef8';
	

SELECT * FROM USERS;


SELECT * FROM RENTALS;

SELECT * FROM BOOKS;

UPDATE
	USERS
SET
	u_score = -10
WHERE u_name='백승범';