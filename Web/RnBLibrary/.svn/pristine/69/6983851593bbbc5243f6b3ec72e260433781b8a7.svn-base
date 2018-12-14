<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
 
 
   
</head>  
<style type="text/css">
 
#lo {
	width: 20%;
	display:inline;	
}

</style>
<script type="text/javascript">
$(document).ready(function(){
  
	alert("테스트");
	$("#btnSave").on('click',function(){
        
		 $('#frm').attr('action',"bookwrite.do").submit();	
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


<body> 
 
 
<div id="container"> 
  
<form id="frm" class="form-mainEvent" method="post" enctype="multipart/form-data"> 
  
		  <p></p>  
		    <h5 id="lo">아이디</h5>
			<input type="text"  name="b_id" />
		 
		    
		  <p></p> 
		  <h5 id="lo">제목</h5>
           <input type="text" name="b_title" />
          
            
             <p></p> 
		  <h5 id="lo">작가</h5>
           <input type="text" name="b_auth" />
          
          
          <p></p>  
		    <h5 id="lo">출판사</h5>
			<input type="text"  name="b_pub" />
		 
		    
		  <p></p> 
		  <h5 id="lo">내용</h5>
           <input type="text" name="b_cont" />
          
             
             <p></p> 
		  <h5 id="lo">장르</h5>
           <input type="text" name="b_genre" />
          
          
          
             <p>출판일</p>
          
                <input type="date" name="b_date" />
         
              
          
           

					<input type="file" id="b_mainpic_file" name="b_mainpic_file" onchange="openFile(event)" />
					
			<div class="imgView">
						<img class='outputView'
							src="http://icons.iconarchive.com/icons/iconsmind/outline/512/Cursor-Select-icon.png" />
			</div> 	 
          
          
	</form>
   
    	 <div id="but">
	  <!-- 
	   <a href="join.do">회원가입</a>
	   <a href="index.do">취소</a>
	 -->	     
	    <input type="button" id="btnSave" value="도서등록" />
		<input type="button" id="btnList" value="취소" /> 
	 
	 </div>  
   	  
	</div>

</body>
</html>