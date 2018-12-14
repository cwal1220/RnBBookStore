<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/headerAdmin.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
	$("#btnWrite").click(function() {
		$("form").submit();	
	});
});

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
	}
});
</script>

</head>

<body>

	<div class="container">
	 
	<h2 class="font-weight-bold" style="margin-top:30px; margin-bottom:30px; margin-left:10px; text-align:center">도서등록</h2>

	<form action="bookwrite.do" method="post" enctype="multipart/form-data">
	
	<table class="table table-bordered border-secondary">
	<tbody>
		<tr>
			<th class="text-center align-middle bg-secondary">도서코드(RFID 태그)</th>
			<td><input type="text" class="ml-1 mr-1" id="b_id" name="b_id"/></td>
			<th class="text-center align-middle bg-secondary">제목</th>
			<td><input id="b_title" name="b_title" type="text"/></td>
			<th class="text-center align-middle bg-secondary">작가</th>
			<td><input id="b_auth" name="b_auth" type="text"/></td>
		</tr>
		<tr>
			<th class="text-center align-middle bg-secondary">장르</th>
			<td>
				<select style="width: 100px; height: 25px" id="b_genre" name="b_genre">
					<option value="0">선택</option>
					<option value="소설">소설</option>
					<option value="에세이">에세이</option>
					<option value="수필">수필</option>
					<option value="고전">고전</option>
					<option value="IT">IT</option>
					<option value="교육">교육</option>
					<option value="아동">아동</option>
					<option value="의학">의학</option>
					<option value="기타">기타</option>
				</select>
			</td>
			<th class="text-center align-middle bg-secondary">출판사</th>
			<td><input id="b_pub" name="b_pub" type="text"/></td>
			<th class="text-center align-middle bg-secondary">출판일</th>
			<td><input id="b_date" name="b_date" type="date" style="height:30px;"/></td>
		</tr>
		<tr>
			<th class="text-center align-middle bg-secondary">사진등록</th>
			<td colspan="5"><input type="file" id="b_mainpic_file" name="b_mainpic_file" onchange="openFile(event)"/></td>
		</tr>
	</tbody>
	</table>
	
	<div class="form-group">
		<label for="content" style="font-size:15px;">줄거리</label>
		<textarea rows="10" name="b_cont"
			class="form-control"></textarea>
	</div>
	<div class="text-center">
		<input type="button" id="btnWrite" value="도서등록" />
	</div>
	</form>
	
	<br><br><br>
    </div> <!-- /container -->

</body>

</html>