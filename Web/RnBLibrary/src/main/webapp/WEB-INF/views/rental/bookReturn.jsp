<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리시스템 - 책 반납</title>

<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
</script>
    
    
<script type="text/javascript">
 var webSocket;

 $(document).ready(function(){	
	websocket = new WebSocket("ws://49.236.136.179:8080/hehe/broadcasting");
	websocket.onmessage = onMessage;  
		
	function onMessage(event){
		//서버가 전송한 메시지 가져오기
		var data = event.data;
		console.log('hehe');
		//메세지를 출력
		$('#b_id').val(data); //sendMsg
		$('#return_form').submit();
	}
		
		
 });
</script>

</head>
<body>

<h3>반납할 책을 인식시켜주세요</h3>

	<form id="return_form" method="post" action="returnProg.do">
		<p>
			<label for="id">아이디</label>
			<input type="text" name="b_id" id="b_id"/>
		</p>
	</form>
	<img src="resources/images/book_recog.gif">
	
</body>
</html>