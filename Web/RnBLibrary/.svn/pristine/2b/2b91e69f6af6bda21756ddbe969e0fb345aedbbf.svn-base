<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도서관리 시스템 - 대출 제한 초과</title>
</head>
<script type="text/javascript">

	var time_sec = 3;		// 최초 설정 시간
	function msg_time() {	// 1초씩 카운트
		
		var msg = "<font size='20' color='red'>" + time_sec + "</font>초 뒤에 이전 페이지로 돌아갑니다.";
		document.all.Timer.innerHTML = msg;		// div 영역에 보여줌 
		time_sec--;					// 1초씩 감소
		if (time_sec < 0) {			// 시간이 종료 되었으면..
			clearInterval(tid);		// 타이머 해제
			//window.location.href = 'loginProg.do';
			history.back();
		}
		
	}
	
	window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

</script>


<body>
<H3>대여에 실패하였습니다 : 최대 대여 제한 초과</H3>
<div id="Timer"></div>
</body>
</html>