<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		$(location).attr("href", "/book.do");
	});
});
</script>
</head>

<body> 
<div class="container" style="margin-top:50px;">

	<div class="d-flex justify-content-center">
			<table class="table table-striped table-hover" style="border-bottom: 1px solid lightgrey">
				<tr>
					<td>카테고리</td><td>${dto.b_genre}</td>
					<td>제목</td><td colspan="3">${dto.b_title}</td>
				</tr>
				<tr>
					<td>작가</td><td>${dto.b_auth}</td>
					<td>출판사</td><td>${dto.b_pub}</td>
					<td>출판일</td><td>${dto.b_date}</td>
				</tr>
			</table>
	</div>

		<div class="py-5" style="margin-top:30px;">
			<div class="container">
				<div class="row">
					<div class="col-md-3" style="width:auto;">
						<img class="img-fluid d-block mx-auto" style="width:300px; height:400px;" src="${dto.b_mainpic}"/>
					</div>
					<div class="col-md-3" style="width:50%;">
						<h3>${dto.b_cont}</h3>
					</div>
				</div>
			</div>
		</div>

	<div class="text-center">
		<input type="button" id="btnList" value="목록" />
	</div>
	
</div>
</body>
</html>