<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
	})
	function later(){
		if(${not empty sessionScope.interviewsByDept}){
			alert("部门有应聘者，安排一下");
		}
	}
	window.setTimeout("later();",1000);
	
	function mainpage(){
		$(".allpage").hide();
		$("#index").fadeIn();
		return false;
	}
	function interviewNotice(){
		$(".allpage").hide();
		$("#interviewNotice").fadeIn();
		return false;
	}
	function interview(obj){
		var uId = $(obj).attr("name");
		$.ajax({
			url:"${pageContext.request.contextPath}/user/findInfoAjax",
			type:"post",
			data:{uId:uId},
			dataType:"JSON",
			success:function(data){
				$("input[name=invitedUserId]").val(data.uid);
				$("#realname").text(data.realname);
				$("#age").text(data.age);
				$("#sex").text(data.sex);
				$("#edu").text(data.edu);
				$("#phone").text(data.phone);
				$("#email").text(data.email);
				$("#dept").text(data.dept.dname+','+data.position.pname);
				$("#salaryexp").text(data.salaryexp);
				$("#workyear").text(data.workyear+'年');
				$("#lastjob").text(data.lastjob);
				$("#politics").text(data.politics);
				$("#hobby").text(data.hobby);
				$(".allpage").hide();
				$("#resumeDetails").fadeIn();
				$(".allpage").hide();
				$("#resumeDetails").fadeIn();
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
		return false;
	}
	function enroll(){
		$("input[name=ifenroll]").val(1);
	}
	function notenroll(){
		$("input[name=ifenroll]").val(0);
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
	        <li><a href="#" onclick="return interviewNotice()">面试通知</a></li>
	        <li><a href="#">培训通知</a></li>
	        <li><a href="#" onclick="return changePSWpage()">效绩管理</a></li>
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
					<!-- 面试通知 -->
					<div id="interviewNotice" class="allpage">
						<table align="center" border="soild 1px" cellpadding="10px" cellspacing="0">
							<tr>
								<th>序号</th>
								<th>应聘者ID</th>
								<th>面试时间</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${sessionScope.interviewsByDept}" var="i">
								<tr>
									<td>${i.itId}</td>
									<td>${i.uId}</td>
									<td>
										<f:formatDate value="${i.deliverTime}" pattern="yyyy-MM-dd"/>
									</td>
									<td><input type="submit" name="${i.uId}" class="btn btn-success" value="面试" onclick="interview(this)"></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<!-- 简历详情 -->
					<div id="resumeDetails" class="allpage">
						<form action="${pageContext.request.contextPath}/user/ifenroll">
							<table align="center" border="soild 1px" cellpadding="10px" cellspacing="0">
								<tr>
									<th colspan="4" style="text-align:center;">简历详情</th>
								</tr>
								<tr>
									<th>姓名</th>
									<td id="realname"></td>
									<th>年龄</th>
									<td id="age"></td>
								</tr>
								<tr>
									<th>性别</th>
									<td id="sex"></td>
									<th>学历</th>
									<td id="edu"></td>
								</tr>
								<tr>
									<th>手机</th>
									<td id="phone"></td>
									<th>邮箱</th>
									<td id="email"></td>
								</tr>
								<tr>
									<th>应聘职位</th>
									<td id="dept"></td>
									<th>期望薪资</th>
									<td id="salaryexp"></td>
								</tr>
								<tr>
									<th>工作经验</th>
									<td id="workyear"></td>
									<th>上份工作</th>
									<td id="lastjob"></td>
								</tr>
								<tr>
									<th>政治面貌</th>
									<td id="politics"></td>
									<th>兴趣爱好</th>
									<td id="hobby"></td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="hidden" name="invitedUserId">
										<input type="hidden" name="ifenroll">
										<input type="submit" class="btn btn-success" value="录用" onclick="enroll()">
									</td>
									<td colspan="2">
										<input type="submit" class="btn btn-success" value="不录用" onclick="notenroll()">
									</td>
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