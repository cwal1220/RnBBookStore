<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 타이틀에 있는 value의 속성을 출력한다. -->
<title><tiles:getAsString name="title"/></title>

<style>
* {
	margin: 0px;
}

header {
	width: 100%;
	height: 100px;
	background-color: aqua;
}
 
menu {
	height: 100px;
    background-color: teal;
    width: 100%;
    float: right; 
}

section {
	background-color: skyblue;
	width: 100%; 
	height: 670px;
	float: right;
}

footer {
	background-color: #ffffff;
	clear: both;
}
</style>


</head>
<body>


<header>
<!-- jsp 경로가 되어있는 것을 참조한다. -->
<p>
 <tiles:insertAttribute name="header"/>
</p>
</header>


<menu>
<tiles:insertAttribute name="menu"/>
</menu>

<section>
<p>
<tiles:insertAttribute name="body"/>
</p>
</section>

<footer>
<p>
<tiles:insertAttribute name="footer"/>
</p>
</footer>

</body>
</html>