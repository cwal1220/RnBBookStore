<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

</head>
<body>
<div class="container">
<h1>마이페이지</h1>
<hr>
<div>
<form action="/member/loginProc" method="POST" class="form-horizontal">

	<div class="col-sm-offset-2">
		<button id="btnLogin" class="btn btn-primary">대여</button>
		<button id="btnCancel" class="btn btn-info">반납</button>
	</div>
</form>
</div>
</div>

</body>
</html>
