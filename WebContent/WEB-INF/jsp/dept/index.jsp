<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>部门主页</title>
<link href="${pageContext.request.contextPath}/css3/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css3/main.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.7.2.js"></script>
<script type="text/javascript">
$(function(){
	$(".allpage").hide();
	$("#index").show();
	if(){
		
	}
});
function mainpage(){
	$(".allpage").hide();
	$("#index").fadeIn();
	return false;
}
function resumeManage(){
	$(".allpage").hide();
	$("#resumeManage").fadeIn();
	return false;
}


</script>
</head>
<body>
<div class="navbar navbar-inverse navbar-static-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" onclick="return mainpage()">人力资源管理系统</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" onclick="return resumeManage()">应聘管理</a></li>
        <li><a href="#">部门职位</a></li>
        <li><a href="#" onclick="return changePSWpage()">培训管理</a></li>
        <li><a href="#">员工管理</a></li>

        <li><a href="${pageContext.request.contextPath}/user/toLogin">退出登录</a></li>
      </ul>
    </div>
  </div>
</div>

<div id="ww">
    <div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 centered">
			
				<!-- 主界面 -->
				<div id="index" class="allpage">
					<img src="${pageContext.request.contextPath}/images/Service1.png" alt="Stanley">
					<h1>Hi, ${sessionScope.nowUser.uName}</h1>
					<p>部门管理</p>
					<p>Please, consider to register to <a href="http://eepurl.com/IcgkX">our newsletter</a> to be updated with our latest themes and freebies. Like always, you can use this theme in any project freely. Share it with your friends.</p>
				</div>
		

			</div>
		</div>
    </div>
</div>
</body>
</html>