<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/sockjs-0.3.min.js"></script>
<script type="text/javascript">
 var webSocket;
 var i=0;
 var j
 $(document).ready(function(){	
	/*49.236.136.179:8080/hehe/broadcasting*/
	websocket = new WebSocket("ws://49.236.136.179:8080/hehe/broadcasting");
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;  
		websocket.onclose = onClose;
		
		
		function onMessage(evt){
			//서버가 전송한 메시지 가져오기
			var data = evt.data;
			//메세지를 출력
			$('#chatMessageArea').append(data+"<br/>");  //sendMsg
			
		}//end onMessage	
		
		
 });
		</script>

</head>
<body>
<form name="frm" method="post" action="logpro.do">
		<p>
			<label for="id">아이디</label>
			<input type="text"  name="id" />
		</p>

       <p>
        <label for="pass">비밀번호</label>
        <input type="text" name="pass" />
       </p>
       
       <p>
       <input type="text" name="returnUrl" 
                value="${param.returnUrl }" />
        <input type="submit" value="로그인" />
       </p>
	</form>
	
	
	
	
</body>
</html>