<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/headerAdmin.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href="/admin/insertUser.do";
	});
});
</script>

<body>

<div class="container">

<h3 class="font-weight-bold" style="margin-top:20px; margin-left:10px;">회원관리</h3>

<c:if test="${admin }">
<button id="btnWrite" class="btn btn-primary pull-right"
 style="margin-top: 20px;">회원등록</button>
 </c:if>
<div class="clearfix"></div>
<hr>
<table class="table table-striped table-hover">
<tr>
<!-- 	<th>번호</th> -->
	<th class="text-center">이름</th>
	<th class="text-center">전화번호</th>
	<th class="text-center">주소</th>
	<th class="text-center">부서</th>
	<th class="text-center">직급</th>
	<th class="text-center">대출점수</th>
	<th class="text-center">회원관리</th>
</tr>
<c:forEach items="${userList}" var="userList">
<tr>
	<td class="text-center">${userList.u_name}</td>
	<td class="text-center">${userList.u_tel}</td>
	<td class="text-center">${userList.u_addr}</td>
	<td class="text-center">${userList.u_dept}</td>
	<td class="text-center">${userList.u_rank}</td>
	<c:if test="${userList.u_score > -10}"><td class="text-center">${userList.u_score}점</td></c:if>
	<c:if test="${userList.u_score <= -10}"><td class="text-center" style="color:#ff0000">${userList.u_score}점</td></c:if>
	<td class="text-center"><a href="/admin/deleteUser.do?u_id=${userList.u_id }">회원제명</a></td>
</tr>
</c:forEach>
</table>
<hr>
</div>

<jsp:include page="../util/paging.jsp" />

<br>
</body>
</html>

