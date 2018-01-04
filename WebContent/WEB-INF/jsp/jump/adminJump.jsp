<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.7.2.js"></script>
<script type="text/javascript">
	function changeSec(){ 
		document.getElementById("myspan").innerText = 
			parseInt(document.getElementById("myspan").innerText) - 1; 
	} 
	var mytime = setInterval("changeSec()",1000); 
	function ok(){
	   $("form").submit();
	}
	window.setTimeout("ok();",5000);
</script>
</head>
<body>
	登陆成功 <span id = "myspan">5</span> 秒钟后自动跳转... 
	<form action="${pageContext.request.contextPath}/user/toAdmin" method="post"></form>
</body>
</html>