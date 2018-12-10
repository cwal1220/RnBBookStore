<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="../include/header.jsp"%>
<title> </title> 
<head> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	$('#btn').click(function(){
		alert("테스트");
		alert($('#data').val());
		$.ajax({
		  type:'POST', 
		  dataType:'json',
		  url:'search.do?data='+$('#data').val(),
	       success:function(res) {
             
	    	   
	    	   $('#first').remove();  
	        alert("성공");
	        
	        $('#wrap').append('<table><tr><th>번호</th><th>제목</th><th>보유도서현황</th></tr></table>');

	       
	        
	        for (var i = 0; i < res.length; i++) {

            
	    		if(res[i].b_stat==0){ 
	    			 $('#wrap table').append('<tr><td>'+res[i].b_num+'</td><td>'+res[i].b_title+'</td><td>대출중</td></tr>');
	    		  
    			}else if(res[i].b_stat==1){     
    				 $('#wrap table').append('<tr><td>'+res[i].b_num+'</td><td><a href="booksPage.do?b_num='+res[i].b_num+'">'+res[i].b_title+'</a></td><td>대출가능</td></tr>');
    		    		 
    			}  
	    		 
	    		
            }

	        
	        	
	         
	 
	        
	        }
	
	});
});
});
 

</script>
</head> 
<body>

<div class="container">

 <span>검색이름</span>
	<input type="text" name="data" id="data" />
	<input type="button" value="commit" id="btn" /> 
	<div id="wrap">
	
	
    </div>
  

<div id="first">

	<table id="table">  
					
						<tbody>
							 <c:forEach var="dto" items="${aList}"> 
										<tr> 
											<td class="num">${dto.b_id}</td> 
					<td> <c:url var="path" value="bookPage.do"> 				
						<c:param name="currentPage" value="${pv.currentPage}" />
							<c:param name="b_num" value="${dto.b_num}" />     
						 </c:url> <a href="${path}" onclick="bookPage.do">${dto.b_title}</a></td>
											<td class="date">${dto.b_date}</td>   
										</tr> 
							</c:forEach>
						</tbody>
						
					</table>
				
				
				
				
					<div id=page>
                          <form id="frm" method="get">	 
					<!-- 이전(prev) --> 
 
			                <c:if test="${pv.startPage>1}">
				              <span><a 
					              href="book.do?currentPage=${pv.startPage-pv.blockPage}"><img src="images/prev.gif" height="30" width="30"></a></span>
			                         </c:if>

                     			<!-- 페이지 -->  
			                        <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
				                        <span><a id="pag" href="book.do?currentPage=${i}">${i}</a></span>
                                 			</c:forEach> 
			                 <!-- 클릭한 해당되는 레코드가 출력된다. -->
  
                    			<!-- 다음 (next)-->
 			                   <c:if test="${pv.endPage<pv.totalPage}">
				                  <span><a 
					                href="book.do?currentPage=${pv.startPage+pv.blockPage}"><img src="images/next.gif" height="30" width="30"></a></span>
			                             </c:if>
                                  </form>
			                             
                     </div>  




</div>

<!-- 
<table class="table table-striped table-hover">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>
<c:forEach items="${boardList }" var="board">
<tr>
	<td>${board.board_no }</td>
	<td>
		<a href="/board/view?board_no=${board.board_no }">${board.title }</a>
	</td>
	<td>${board.writer_id }</td> 
	<td>${board.hit }</td>
	<td>${board.write_date }</td>
</tr>
</c:forEach>
</table>
<hr>

 -->
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

