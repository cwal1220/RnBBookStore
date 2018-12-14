<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty admin }">
<%@ include file="../include/header.jsp"%>
</c:if>

<c:if test="${admin }">
<%@ include file="../include/headerAdmin.jsp"%>
</c:if>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		$(location).attr("href", "/noticeList.do");
	});
});
</script>
</head>
<body>

<div class="container">

<h3 class="font-weight-bold" style="margin-top:30px;">공지사항</h3>
<hr>
<div>
<table class="table table-bordered">
<tr>
<td class="info">글번호</td><td>${notice.n_id }</td>
<td class="info">제목</td><td colspan="3">${notice.n_title }</td>
</tr>

<tr>
<td class="info">작성자</td><td>관리자</td>
<td class="info">작성일</td><td><fmt:formatDate value="${notice.n_date}" pattern="yyyy-MM-dd"/></td>
<td class="info">조회수</td><td>${notice.n_count }</td>
</tr>

<tr><td class="info">본문</td><td colspan="5">${notice.n_cont }</td></tr>

</table>
</div>

<div class="text-center">	
	<button id="btnList" class="btn btn-primary">목록</button>
</div>
</div>

</body>
</html>
