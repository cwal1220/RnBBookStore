<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

</head>
<body>

<div class="container">
<h1>공지사항 상세페이지</h1>
<hr>
<div>
<table class="table table-bordered">
<tr>
<td class="info">글번호</td><td>${board.board_no }</td>
<td class="info">제목</td><td colspan="2">${board.title }</td>
</tr>


<tr><td class="info">본문</td><td colspan="4">${board.content }</td></tr>

<tr>
<td class="info">조회수</td><td>${board.hit }</td>
</tr>

<tr>
<td class="info">작성일</td><td colspan="4">${board.write_date }</td>
</tr>
</table>
</div>

<div class="text-center">	
	<button id="btnList" class="btn btn-primary">목록</button>
	
	
	<button id="btnUpdate" class="btn btn-info">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>
</div>

</body>
</html>

