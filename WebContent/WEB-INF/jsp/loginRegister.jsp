<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>人力资源管理系统登录注册页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.7.2.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<h1>人力资源管理系统登录注册</h1>
	<div class="container">
		<div class="login">
			<h2>登 录</h2>
			<h5 style="color:white;">${requestScope.loginMsg}</h5>
			<form action="${pageContext.request.contextPath}/user/login" method="post">
				<input type="text" Name="uName" placeholder="用户名" required="required">
				<input type="password" Name="password" placeholder="密码" required="required">
				<ul class="tick">
					<li>
						<input type="checkbox" id="brand1" value="">
						<label for="brand1"><span></span>记住我</label>
					</li>
				</ul>
				<div class="send-button">
					<input type="submit" value="登 录">
				</div>
			</form>
			<a href="#">记住密码?</a>
			<div class="social-icons">
				<p>- 其他方式登录 -</p>
				<ul>
					<li class="qq"><a href="#">
					<span class="icons"></span>
					<span class="text">QQ</span></a></li>
					<li class="weixin"><a href="#">
					<span class="icons"></span>
					<span class="text">微信</span></a></li>
					<li class="weibo"><a href="#">
					<span class="icons"></span>
					<span class="text">微博</span></a></li>
				</ul>
			</div>
		</div>
		<div class="copyrights"></div>
		<div class="register">
			<h2>注 册</h2>
			<h5 style="color:white;">${requestScope.registerMsg}</h5>
			<form action="${pageContext.request.contextPath}/user/register" method="post">
				<input type="text" Name="uName" placeholder="用户名" required="required">
				<input type="password" Name="password" placeholder="密码" required="required">
				<div class="send-button">
					<input type="submit" value="注册">
				</div>
			</form>
			<p></p>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>

</body>
</html>