<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

<title>도서관리시스템 - 대여 오류</title>
</head>
<body>
<h3>대여중 오류가 발생하였습니다.</h3>
존재하지 않는 책이거나 이미 대출중입니다.
<div id="Timer"></div>
</body>
</html>