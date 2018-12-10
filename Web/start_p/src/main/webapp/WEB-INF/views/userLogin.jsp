<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});
</script>
</head>
<body>
<div class="container">
<h1>게시판 - 로그인</h1>
<hr>
<div>
<form action="/member/loginProc" method="POST" class="form-horizontal">
	<div class="form-group">
		<label for="id" class="col-sm-2 control-label">아이디</label>
		<div class="col-sm-6">
		<input type="text" id="id" name="id" 
			class="form-control"/>
		</div>
	</div>
	<div class="form-group">
		<label for="pw" class="col-sm-2 control-label">패스워드</label>
		<div class="col-sm-6">
		<input type="text" id="pw" name="pw" 
			class="form-control"/>
		</div>
	</div>

	<div class="col-sm-offset-2">
		<button id="btnLogin" class="btn btn-primary">로그인</button>
		<button id="btnCancel" class="btn btn-danger">취소</button>
	</div>
</form>
</div>
</div>

</body>
</html>
