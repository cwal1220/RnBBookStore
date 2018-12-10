<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script type="text/javascript"> 
 
$(document).ready(function() {
	$("#bookwrite").on('click', function() {
		
		$('#frm').attr('action', "bookwrite.do");
		$('#frm').submit(); 
		
	}); 
});




var input;
function openFile(event) {
	input = event.target;
	var reader = new FileReader();
	reader.onload = function() {
		var dataURL = reader.result;
		$(input).next().children('img').attr('src', dataURL);
		$(input).next().children('img').css('display', 'block');
	}
	reader.readAsDataURL(input.files[0]);
}; 
</script>
</head>
<body>
	<div class="container">
		<h3>이벤트 기간</h3>
 
		<form id="frm" class="form-mainEvent" method="post" enctype="multipart/form-data">
			    
			<p>아이디</p>  
		 	<input name="b_id" id="b_id" type="text" value=''><br>
		 	<p>제목</p>
		    <input name="b_title" id="b_title" type="text" value=''><br>
			<p>저자</p>
			<input name="b_auth" id="b_auth" type="text" value=''><br>
			
				<!--  	
			<p>내용</p>
			<input name="b_cont" id="b_cont" type="text"><br>
			<p>장르</p>
			<input name="b_genre" id="b_genre" type="text"><br>
			<p>대출여부</p>
			<input name="b_stat" id="b_stat" type="number"><br> 
			<p>날짜</p>
			<input name="b_date" id="date" type="date"><br>   
			 
			    	<div id="imgaa">  
					<input type="file" id="event_mainfic_file" name="event_mainfic_file" onchange="openFile(event)" />
					<div class="imgView">
						<img class='outputView'
							src="http://icons.iconarchive.com/icons/iconsmind/outline/512/Cursor-Select-icon.png" />
					</div>
				</div>
				
				  
				
				<div id="desia1"class="col-sm-10">
					<input id="Event_Name" name="event_name" value='' />
				</div>
				 <label for="main" class="col-sm-2 control-label">메인 이미지</label>
				<div class="col-sm-10">
					<input type="file" id="event_mainpic_file" name="event_mainpic_file"
						onchange="openFile(event)" />
					<div class="imgView">
						<img class='outputView'
							src="http://icons.iconarchive.com/icons/iconsmind/outline/512/Cursor-Select-icon.png" />
					</div>
				</div> 
				-->
			 </form> 
				
				
			
			</div>    
			
		
		 
		
				<div >
					<button id="bookwrite">Save</button>

				</div>
			
   	



</body>
</html> 