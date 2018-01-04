<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>用户主页</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.7.2.js"></script>
<script type="text/javascript">
	function resume(){
		$(".allpage").fadeOut();
		$("#resume").fadeIn();
		return false;
	}
	$(function(){
		$(".allpage").hide();
		$("#index").show();
	})
	
	function choiceDept(){
		
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
          <a class="navbar-brand" href="#">人力资源管理系统</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" onclick="return resume()">查看/修改简历</a></li>
            <li><a href="#">反馈</a></li>
            <li><a href="#">修改密码</a></li>
            <li><a href="#">退出登录</a></li>
          </ul>
        </div>
      </div>
    </div>
	
	<div id="ww">
	    <div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 centered">
					<div id="index" class="allpage">
						<img src="${pageContext.request.contextPath}/images/user.png" alt="Stanley">
						<h1>Hi, ${sessionScope.nowUser.uName}</h1>
						<p>欢迎登录人力资源管理系统，在这里，你可以投递简历，应聘你喜欢的职位！</p>
						<p>Please, consider to register to <a href="http://eepurl.com/IcgkX">our newsletter</a> to be updated with our latest themes and freebies. Like always, you can use this theme in any project freely. Share it with your friends.</p>
					</div>
					<div id="resume" class="allpage">
						<form action="" method="post">
							<table align="center" border="soild 1px" cellpadding="10px" cellspacing="0">
								<tr>
									<th colspan="4" style="text-align:center;">个人简历</th>
								</tr>
								<tr>
									<td>真实姓名</td>
									<td><input type="text" name="realName" placeholder="请输入真实姓名" required="required"></td>
									<td>性别</td>
									<td>
										<input type="radio" name="sex" value="男" checked="checked">男
										<input type="radio" name="sex" value="女">女
									</td>
								</tr>
								<tr>
									<td>年龄</td>
									<td><input type="number" name="age" placeholder="请输入年龄" required="required"></td>
									<td>学历</td>
									<td>
										<select name="edu">
											<option value="">学历</option>
											<option value="中专">中专</option>
											<option value="高中">高中</option>
											<option value="大专">大专</option>
											<option value="本科">本科</option>
											<option value="硕士">硕士</option>
											<option value="博士">博士</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>手机号</td>
									<td><input type="number" name="phone" placeholder="请输入联系方式" required="required"></td>
									<td>e-mail</td>
									<td><input type="text" name="email" placeholder="请输入邮箱" required="required"></td>
								</tr>
								<tr>
									<td>应聘职位</td>
									<td>
										<select name="dId" onchange="choiceDept()">
											<option value="0">--部门--</option>
											<c:forEach items="${requestScope.depts}" var="d">
												<option value="${d.dId}">${d.dName}</option>
											</c:forEach>
										</select>
										<select name="pId">
											<option value="0">--职位--</option>
										</select>
									</td>
									<td>政治面貌</td>
									<td>
										<select name="politics">
											<option value="普通群众">普通群众</option>
											<option value="共青团员">共青团员</option>
											<option value="共产党员">共产党员</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>上分工作</td>
									<td><input type="text" name="lastJob" placeholder="请输入工作名称"></td>
									<td>工作经验</td>
									<td><input type="number" name="workYear" placeholder="请输入几年工作经验"></td>
								</tr>
								<tr>
									<td>期望薪资</td>
									<td>
										<select name="salaryExp">
											<option value="2000-3000">2000-3000</option>
											<option value="3000-4000">3000-4000</option>
											<option value="4000-6000">4000-6000</option>
											<option value="6000-8000">6000-8000</option>
											<option value="8000+">8000+</option>
										</select>
									</td>
									<td>兴趣爱好</td>
									<td><input type="text" name="hobby" placeholder="请输入兴趣爱好"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" class="btn btn-success" value="SUBMIT"></td>
									<td colspan="2"><button type="submit" class="btn btn-success">RETURN</button></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
	    </div>
	</div>
</body>
</html>