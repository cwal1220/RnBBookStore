<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<title>���������ý��� - �ݳ�����</title>
</head>
<body>
<h3>�ݳ��� ������ �߻��Ͽ����ϴ�.</h3>
�������� �ʰų� �������� å�� �ƴմϴ�.
<div id="Timer"></div>
</body>
</html>