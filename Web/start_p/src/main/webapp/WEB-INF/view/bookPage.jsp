<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/noview.css" />   
</head>
<body> 
<table id="noview" border="1" width="50%"> 
		<tr>
			<th width="20%">글쓴이</th>
			<td>운영자</td>
			<th width="20%">도서코드: ${dto.b_id}</th> 
		</tr>  
 
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.b_pub}</td>
		</tr>

		<tr>
			<th>카테고리</th>
			<td colspan="3">${dto.b_title}</td>
		</tr>
 
        <tr>
			<td colspan="3"><br><br>${dto.b_auth}<br><br>
		</tr>
		
		<tr>
			<td colspan="3"><br><br><img src="${dto.b_mainpic}"/><br><br>
		</tr>
		
		<tr>
			<td colspan="3"><br><br>${dto.b_stat}<br><br><br><br><br><br><br><br><br><br><br><br></td>
		</tr>



		<tr>
			<td colspan="3"><br><br>${dto.b_date}<br><br><br><br><br><br><br><br><br><br><br><br></td>
		</tr>

	</table>
    <br>
    <br>
	<form name="frm" id="frm" method="get">   
		
	</form>
	<br>
	<br> 
	<br>
</body>
</html>