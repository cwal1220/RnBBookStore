<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

</head>
<body>
<div class="container">
<h1>로그인</h1>
<hr>
<div>
<form action="/member/loginProc" method="POST" class="form-horizontal">
	<div class="form-group">
		<label for="id" class="col-sm-2 control-label">대여도서 코드번호</label>
		<div class="col-sm-6">
		<input type="text" id="id" name="id" 
			class="form-control"/>
		</div>
	</div>

	<div class="col-sm-offset-2">
		<button id="btnLogin" class="btn btn-primary">대여</button>
		<button id="btnCancel" class="btn btn-danger">취소</button>
	</div>
</form>
</div>
</div>

</body>
</html>
