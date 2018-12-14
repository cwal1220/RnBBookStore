<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/headerAdmin.jsp"%>

<script type="text/javascript" src="/resources/smarteditor/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
	$("#btnWrite").click(function() {
		$("form").submit();	
	});
});
</script>

<style type="text/css">
#content {
	width: 99%;
}
</style>

</head>
<body>

<div class="container">
<h3 class="font-weight-bold" style="margin-top:30px;">공지사항</h3>
<hr>
<div>
<form action="/admin/noticeWrite.do" method="post">
	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" id="title" name="n_title" 
			class="form-control" />
	</div>
	<div class="form-group">
		<label for="content">본문</label>
		<textarea rows="10" id="content" name="n_cont"
			class="form-control"></textarea>
	</div>

	<div class="text-center">
		<button id="btnWrite" class="btn btn-primary">작성</button>
		<button id="btnCancel" class="btn btn-danger">취소</button>
	</div>
</form>

</div>
</div>


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
    htParams : {
    	bUseToolbar: true, // 툴바 사용여부
    	bUseVerticalResizer: false, //입력창 크기 조절바
    	bUseModeChanger: true //모드 탭
    }
});


//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("ir1").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) {}
}

$(document).ready(function() {
	$("#btnWrite").click(function() {
		submitContents($(this));
	});
});
</script>

</body>
</html>


