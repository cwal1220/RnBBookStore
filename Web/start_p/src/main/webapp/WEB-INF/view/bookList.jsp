<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

</head>
<body>

<div class="container">

<h1 class="pull-left">도서목록 조회</h1>
<div class="clearfix"></div>
<hr>
<table class="table table-striped table-hover">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>
<c:forEach items="${boardList }" var="board">
<tr>
	<td>${board.board_no }</td>
	<td>
		<a href="/board/view?board_no=${board.board_no }">${board.title }</a>
	</td>
	<td>${board.writer_id }</td>
	<td>${board.hit }</td>
	<td>${board.write_date }</td>
</tr>
</c:forEach>
</table>
<hr>
</div>

<jsp:include page="../util/paging.jsp" />

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

