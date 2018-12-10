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
	<table class="table table-striped table-hover">
<tr>
	<th>제목</th>
	<th>작가</th>
	<th>출판사</th>
	<th>출판일</th>
	<th>반납날짜</th>
</tr>
<c:forEach items="${boardList }" var="board">
<tr>
	<td>${board.board_title }</td>
	<td>${board.writer_id }</td>
	<td>${board.writer_company }</td>
	<td>${board.write_date }</td>
	<td>${board.return_date }</td>
</tr>
</c:forEach>
</table>

	<div class="col-sm-offset-2">
		<button id="btnLogin" class="btn btn-primary">반납</button>
		<button id="btnCancel" class="btn btn-danger">취소</button>
	</div>
</form>
</div>
</div>

</body>
</html>
