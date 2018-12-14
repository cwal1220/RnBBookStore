<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/headerAdmin.jsp"%>

<style>
.cols {
	width: 50%;
	margin-top : 50px;

</style>

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
		$('#u_id').val(data); //sendMsg
// 		$('#login_form').submit();
	}
	
	$("#saveBtn").click(function() {
		
		console.log("회원등록 버튼 클릭");
		
		var u_id = $("#u_id").val();
		var u_name = $("#u_name").val();
		var u_tel = $("#u_tel").val();
		var u_addr = $("#u_addr").val();
		var u_dept = $("#u_dept").val();
		var u_rank = $("#u_rank").val();
		
		if(u_id == "") {
			alert("RFID 카드를 인식하시오");
		} else if(u_name == "") {
			alert("이름을 입력하세요");
		} else if(u_tel == "") {
			alert("전화번호를 입력하세요");
		} else if(u_addr == "") {
			alert("주소를 입력하세요");
		} else if(u_dept == "") {
			alert("부서를 입력하세요");
		} else if(u_rank == "") {
			alert("직급을 입력하세요");
		} else {
			console.log("데이터 입력 완료");
			$("#login_form").submit();
		}
		
	})
		
 });
</script>

</head>

<body>

	<div class="cols container">
	 
	<h2 class="font-weight-bold" style="margin-bottom:30px; margin-left:10px; text-align:center">회원등록</h2>

           
      <form id="login_form" action="/admin/insertUser.do" method="post" class="form-horizontal">
      
	      <div style="margin-bottom:15px;">
	        <label>RFID번호(회원카드 인식)</label>
	        <input type="text" id="u_id" name="u_id"class="form-control">
	      </div>
	      
	      <div style="margin-bottom:15px;">
	        <label>이름</label>
	        <input type="text" id="u_name" name="u_name" class="form-control">
	      </div>
	      
	      <div style="margin-bottom:15px;">
	        <label>전화번호</label>
	        <input type="text" id="u_tel" name="u_tel" class="form-control">
	      </div>
	      
	      <div style="margin-bottom:15px;">
	        <label>주소</label>
	        <input type="text" id="u_addr" name="u_addr" class="form-control">
	      </div>
	      
	      <div style="margin-bottom:15px;">
	        <label>부서</label>
	        <input type="text" id="u_dept" name="u_dept" class="form-control">
	      </div>
	      
	      <div style="margin-bottom:15px;">
	        <label>직급</label>
	        <input type="text" id="u_rank" name="u_rank" class="form-control">
	      </div>
	      <br>
	      <div style="height:35px;">
	      	<input class="btn btn-lg btn-primary btn-block" type="button" id="saveBtn" value="회원등록"/>
	      </div>
      <br><br><br><br><br><br><br><br>
      </form>

    </div> <!-- /container -->
    

</body>
</html>