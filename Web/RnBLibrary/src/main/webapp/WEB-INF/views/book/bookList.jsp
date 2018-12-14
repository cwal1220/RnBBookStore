<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty admin }">
<%@ include file="../include/header.jsp"%>
</c:if>

<c:if test="${admin }">
<%@ include file="../include/headerAdmin.jsp"%>
</c:if>

<style type="text/css">
hr#hr2 {
	border-top: 3px double #8c8b8b;
}
#second{
}
#page{
  	 position:relative; 
 
}


#paggg {
    margin-left: 500px;
} 

</style>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btn').click(function(){
		$.ajax({
		  type:'POST', 
		  dataType:'json',
		  url:'search.do?data='+$('#data').val(),
	       success:function(res) {
              
	    	   $('#wrap table').remove();
	    	   $('#wrap h1').remove(); 	    	   
	    	   $('#first').remove();
	    	   
	        $('#wrap').append('<h1>도서 검색 결과</h1>');
	        $('#wrap').append('<br><br><table class="table table-striped"><tr> <th>번호</th> <th>제목</th> <th>작가</th> <th>출판사</th><th>대출현황</th></tr></table>');

	       
	        
	        for (var i = 0; i < res.length; i++) {

            
	    		if(res[i].b_stat==0){ 
	    			 $('#wrap table').append('<tr><td>'+res[i].b_num+
	    					 				'</td><td><a href="booksPage.do?b_num='+res[i].b_num+'">'+res[i].b_title+
	    					 				 '</td><td>'+res[i].b_auth+
	    					 				 '</td><td>'+res[i].b_pub+
	    					 				 '</td><td>대출중</td></tr>');
	    		  
    			}else if(res[i].b_stat==1){        
    				 $('#wrap table').append(	'<tr><td>'+res[i].b_num+
    						 					'</td><td><a href="booksPage.do?b_num='+res[i].b_num+'">'+res[i].b_title+
			 				 					'</td><td>'+res[i].b_auth+
			 				 					'</td><td>'+res[i].b_pub+
			 				 					'</td><td>대출가능</td></tr>');
    		    		 
    			}  
	    		 
	    		
            }

	        
	        	
	         
	 
	        
	        }
	
	});
});
	
	$("#btnWrite").click(function() {
		location.href="/register.do";
	});
});

</script>
</head>

<body>

	<div class="container" style="margin-top:40px;">


<!-- 		<div id="wrap"></div> -->
		<div class="form-inline my-2 my-lg-0 pull-right" style="margin-bottom:20px;">
			<input class="form-control mr-sm-2" style="width:300px;" type="search"
				placeholder="Search" aria-label="Search" name="data" id="data">
			<button class="btn btn-outline-success my-2 my-sm-0" value="commit"
				id="btn">Search</button>
			<c:if test="${admin }">
			<button id="btnWrite" class="btn btn-primary pull-right"
			 style="margin-left: 10px;">도서등록</button>
			 </c:if>
		</div>
		<div id="wrap"></div>
	
	
	
		<div id="first">

			<table id="table">

				<table class="table table-striped">
					<thead>
						<tr>
							
							<th scope="col" class="text-center">장르</th>
							<th scope="col" class="text-center" style="width:300px;">제목</th>
							<th scope="col" class="text-center">작가</th>
							<th scope="col" class="text-center">출판사</th>
							<th scope="col" class="text-center">출판일</th>
							<th scope="col" class="text-center">대출 상태</th>
						</tr>
					</thead>
					<c:forEach var="dto" items="${aList}">
						<tr>
							
							<td class="b_genre text-center">${dto.b_genre}</td>
							<td class="text-center"><c:url var="path" value="bookPage.do">
									<c:param name="currentPage" value="${pv.currentPage}" />
									<c:param name="b_num" value="${dto.b_num}" />
								</c:url> <a href="${path}" onclick="bookPage.do">${dto.b_title}</a></td>
							<td class="b_auth text-center">${dto.b_auth}</td>
							<td class="b_pub text-center">${dto.b_pub}</td>
							<td class="date text-center">${dto.b_date}</td>
							<td class="b_stat text-center"><c:if test="${dto.b_stat eq 1}">대출 가능</c:if>
											   <c:if test="${dto.b_stat eq 0}">대출 불가능</c:if>
							</td>
						</tr>

					</c:forEach>
					</tbody>
				</table>
			</table>




	<div id=second> 
			</div>
			<div id=page >
				<form id="frm" method="get">
					<!-- 이전(prev) -->

					<c:if test="${pv.startPage>1}">
						<span><a
							href="book.do?currentPage=${pv.startPage-pv.blockPage}"><img
								src="images/prev.gif" height="30" width="30"></a></span>
					</c:if>

					<!-- 페이지 -->
		<div id="paggg">		 	
			<nav aria-label="Page navigation example">		
			<ul class="pagination">
					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
						
						
				
					<li class="page-item"><a class="page-link" href="book.do?currentPage=${i}">${i}</a></li>
			
			
					</c:forEach>
						</ul>  
			</nav>
		</div>	  		
					<!-- 클릭한 해당되는 레코드가 출력된다. -->

					<!-- 다음 (next)-->
					<c:if test="${pv.endPage<pv.totalPage}">
						<span><a
							href="book.do?currentPage=${pv.startPage+pv.blockPage}"><img
								src="images/next.gif" height="30" width="30"></a></span>
					</c:if>
				</form>

			</div>


	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>

