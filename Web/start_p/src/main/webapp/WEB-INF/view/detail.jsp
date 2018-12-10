<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
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
        
		 $('#frm').attr('action',"join.do").submit();	
	});  
   
	
});

</script>


<body> 


<div id="container"> 
  
<form name="frm" id="frm" method="post"> 
  
		  <p></p>  
		    <h5 id="lo">아이디</h5>
			<input type="text"  name="memId" />
		 
		    
		  <p></p> 
		  <h5 id="lo">비밀번호</h5>
           <input type="text" name="memPass" />
          
          
          <p></p>
          <h5 id="lo">이메일</h5>
           <input type="text" name="memEmail" />
       	     
       	    
	 <div id="but">
	  <!-- 
	   <a href="join.do">회원가입</a>
	   <a href="index.do">취소</a>
	 -->	    
	    <input type="button" id="btnSave" value="회원가입" />
		<input type="button" id="btnList" value="취소" /> 
	 
	 </div> 
	  
	</form>
	  
	</div>

</body>
</html>