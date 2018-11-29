<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  var chk='${empty sessionScope.chk}'=='true'
	                ?true: false;
	  init(chk);
  });
</script>  
<h2 align="center">도서관리시스템</h2>
 

<c:if test="${sessionScope.chk != null }">
   <p id="logOutPage">
   <a href="logout.do">로그아웃</a> </p>
</c:if>

<c:if test="${sessionScope.chk == null }">
 <P id="logInPage">
<a href="login.do?returnUrl=${param.returnUrl}">
    로그인</a>
</P> 
</c:if>



