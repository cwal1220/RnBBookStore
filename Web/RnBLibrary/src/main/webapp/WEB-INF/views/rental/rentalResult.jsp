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

	var time_sec = 5;		// ���� ���� �ð�
	function msg_time() {	// 1�ʾ� ī��Ʈ
		
		var msg = "<font size='20' color='red'>" + time_sec + "</font>�� �ڿ� �α����������� ���ư��ϴ�.";
		document.all.Timer.innerHTML = msg;		// div ������ ������ 
		time_sec--;					// 1�ʾ� ����
		if (time_sec < 0) {			// �ð��� ���� �Ǿ�����..
			clearInterval(tid);		// Ÿ�̸� ����
			window.location.href = 'login.do';
		}
		
	}
	
	window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

</script>

<body>

<%
	RentalInfoDto book = (RentalInfoDto) request.getAttribute("book");
%>

<h3>�뿩 �Ϸ�!</h3>
åID : <%=book.getB_id() %><br>
���� : <%=book.getB_title() %><br>
���� : <%=book.getB_auth()%><br>
���ǻ� : <%=book.getB_pub() %><br>
�뿩�Ͻ� : <%=book.getR_date()%><br>

<div id="Timer"></div>

</body>
</html>