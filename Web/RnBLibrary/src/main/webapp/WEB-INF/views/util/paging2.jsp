<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
<nav>
  <ul class="pagination">
  
  
  	<!-- 이전 페이지 -->
  	<!-- 첫 페이지라면 금지 표시 -->
  	<c:if test="${paging.curPage eq 1 }"><!-- 첫페이지일때 -->
  	<li class="disabled">
      <a href="/board/list"
       aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  	</c:if>
  	<c:if test="${paging.curPage ne 1 }"><!-- 첫페이지가아닐때 -->
  	<li>
      <a href="/noticeList.do?curPage=${paging.curPage-1 }"
       aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    
    
    
    
    <!-- 페이징 번호 -->
    <c:forEach begin="${paging.startPage }"
    	end="${paging.endPage }"
    	var="page">
    	
    	<c:if test="${paging.curPage eq page }">
	   	<li class="active">
	   	</c:if>
	   	<c:if test="${paging.curPage ne page }">
	   	<li>
	   	</c:if>
	   	
	   	<a href="/noticeList.do?curPage=${page }">
	   		${page }
	   	</a>
	   	</li>
    </c:forEach>
    
    


    <!-- 다음 페이지 -->
  	<!-- 마지막 페이지라면 금지 표시 -->
  	<c:if test="${paging.curPage eq paging.totalPage }"><!-- 마지막 페이지일때 -->
  	<li class="disabled">
      <a href="/noticeList.do?curPage=${paging.totalPage }"
       aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  	</c:if>
  	<c:if test="${paging.curPage ne paging.totalPage }"><!-- 마지막 페이지가아닐때 -->
  	<li>
      <a href="/noticeList.do?curPage=${paging.curPage+1 }"
       aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
    
  </ul>
</nav>
</div>



