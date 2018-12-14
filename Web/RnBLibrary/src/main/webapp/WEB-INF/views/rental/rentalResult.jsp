<%@page import="Library.dto.RentalInfoDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<script type="text/javascript">

	var time_sec = 5;		// 최초 설정 시간
	function msg_time() {	// 1초씩 카운트
		
		var msg = "<font size='20' color='red'>" + time_sec + "</font>초 뒤에 로그인페이지로 돌아갑니다.";
		document.all.Timer.innerHTML = msg;		// div 영역에 보여줌 
		time_sec--;					// 1초씩 감소
		if (time_sec < 0) {			// 시간이 종료 되었으면..
			clearInterval(tid);		// 타이머 해제
			window.location.href = 'login.do';
		}
		
	}
	
	window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

</script>

<body>

<%
	RentalInfoDto book = (RentalInfoDto) request.getAttribute("book");
%>

<h3>대여 완료!</h3>
책ID : <%=book.getB_id() %><br>
제목 : <%=book.getB_title() %><br>
저자 : <%=book.getB_auth()%><br>
출판사 : <%=book.getB_pub() %><br>
대여일시 : <%=book.getR_date()%><br>

<div id="Timer"></div>

</body>
</html>