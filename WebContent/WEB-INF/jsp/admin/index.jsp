<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>管理员主页</title>
<link href="${pageContext.request.contextPath}/css2/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css2/main.css" rel="stylesheet">
<style type="text/css">
	/* Border styles */
	#table-2 thead, #table-2 tr {
	border-top-width: 5px;
	border-top-style: solid;
	border-top-color: rgb(230, 189, 189);
	}
	#table-2 {
	border-bottom-width: 5px;
	border-bottom-style: solid;
	border-bottom-color: rgb(230, 189, 189);
	}
	
	/* Padding and font style */
	#table-2 td, #table-2 th {
	padding: 5px 10px;
	font-size: 30px;
	font-family: Verdana;
	color: rgb(177, 106, 104);
	}
	
	/* Alternating background colors */
	#table-2 tr:nth-child(even) {
	background: rgb(238, 211, 210)
	}
	#table-2 tr:nth-child(odd) {
	background: #FFF
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		if(${not empty requestScope.positionMsg}){
			$(".allpage").hide();
			$("#employeeMsg").show();
		}else if(${not empty requestScope.toDeptPage}){
			$(".allpage").hide();
			$("#DP").show();
		}else{
			$(".allpage").hide();
			$("#index").show();
		}
	})
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
	function DP(){
		$(".allpage").hide();
		$("#DP").fadeIn();
		return false;
	}
	function findInfoInPosition(obj){
		var uId = $(obj).attr("name");
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/findInfoInPosition",
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
				if(data.dept==null){
					$("#dept").text('无');
				}else{
					$("#dept").text(data.dept.dname+','+data.position.pname);
				}
				$("#salaryexp").text(data.salaryexp);
				$("#workyear").text(data.workyear+'年');
				$("#lastjob").text(data.lastjob);
				$("#politics").text(data.politics);
				$("#hobby").text(data.hobby);
				$(".allpage").hide();
				$("#td-invited").hide();
				$("#resumeDetails").fadeIn();
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function findInfo(obj){
		var uId = $(obj).attr("name");
		var td$read = $(obj).parent().prev().prev();
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
				if(data.dept==null){
					$("#dept").text('无');
				}else{
					$("#dept").text(data.dept.dname+','+data.position.pname);
				}
				$("#salaryexp").text(data.salaryexp);
				$("#workyear").text(data.workyear+'年');
				$("#lastjob").text(data.lastjob);
				$("#politics").text(data.politics);
				$("#hobby").text(data.hobby);
				$(".allpage").hide();
				$("#td-invited").show();
				$("#resumeDetails").fadeIn();
				$(td$read).text("已查看");
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function invitedTime(){
		$("#invitedTime").fadeIn();
	}
	function invited(){
		var uId = $("input[name=invitedUserId]").val();
		var invitedTime = $("input[name=invitedTime]").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/user/invitedAjax",
			type:"post",
			data:{uId:uId,invitedTime:invitedTime},
			dataType:"text",
			success:function(data){
				if(data=='success'){
					alert('邀请成功');
				}
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function delInfo(obj){
		var uId = $(obj).attr("name");
		$.ajax({
			url:"${pageContext.request.contextPath}/user/delInfoAjax",
			type:"post",
			data:{uId:uId},
			dataType:"text",
			success:function(data){
				if(data=='success'){
					$(obj).parent().parent().remove();
				}
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
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
            <li><a href="#" onclick="return DP()">部门职位</a></li>
            <li><a href="#" onclick="return changePSWpage()">培训管理</a></li>
            <li><a href="#">员工管理</a></li>
            <li><a href="#">奖惩管理</a></li>
            <li><a href="#">薪资管理</a></li>
            <li><a href="#">工资异议</a></li>
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
						<img src="${pageContext.request.contextPath}/images/avtar.png" alt="Stanley">
						<h1>Hi, ${sessionScope.nowUser.uName}</h1>
						<p>管理员你好！</p>
						<p>Please, consider to register to <a href="http://eepurl.com/IcgkX">our newsletter</a> to be updated with our latest themes and freebies. Like always, you can use this theme in any project freely. Share it with your friends.</p>
					</div>
					<!-- 部门职位 -->
					<div id="DP" class="allpage">
						<table id="table-2" align="center">
							<tr>
								<c:forEach items="${sessionScope.depts}" var="d">
									<th><ul><li>
										${d.dName}
										<a href="${pageContext.request.contextPath}/admin/delDept?dId=${d.dId}">[DEL]</a>
									</li></ul></th>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach items="${sessionScope.depts}" var="d">
									<td>
										<ul>
											<c:forEach items="${d.positions}" var="p">
												<li>
													<a href="${pageContext.request.contextPath}/admin/positionMsg?pId=${p.pId}">${p.pName}</a>
													<a href="${pageContext.request.contextPath}/admin/delPosition?pId=${p.pId}">[DEL]</a>
												</li>
											</c:forEach>
										</ul>
									</td>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach items="${sessionScope.depts}" var="d">
									<td>
										<form action="${pageContext.request.contextPath}/admin/addPosition">
											<input type="hidden" name="dId" value="${d.dId}">
											<input type="text" name="posiName" style="width:130px;" placeholder="添加职位" required="required">
											<input type="submit" class="btn btn-success" value="提交">
										</form>
									</td>
								</c:forEach>
							</tr>
						</table>
						<form action="${pageContext.request.contextPath}/admin/addDept">
							<h4>添加部门</h4>
							<input type="text" name="deptName" placeholder="请输入部门名" required="required">
							<input type="submit" class="btn btn-success" value="提交">
						</form>
					</div>
					<!-- 员工信息 -->
					<div id="employeeMsg" class="allpage">
						<c:choose>
							<c:when test="${empty requestScope.positionMsg.employees}">
								<h3>该职位没有员工，快去招聘</h3>
							</c:when>
							<c:otherwise>
								<table id="table-2" align="center">
									<tr>
										<c:forEach items="${requestScope.positionMsg.employees}" var="itemx" varStatus="status">
											<td>
												<a href="#" name="${itemx.uId}" onclick="findInfoInPosition(this)">${itemx.realName}</a>
											</td>
											<c:if test="${status.count%4==0}">
												</tr>
												<tr>
											</c:if>
										</c:forEach>
									</tr> 
								</table>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 应聘管理 -->
					<div id="resumeManage" class="allpage">
						<table align="center" border="soild 1px" cellpadding="10px" cellspacing="0">
							<tr>
								<th>序号</th>
								<th>应聘者ID</th>
								<th style="text-align:center;">投递时间</th>
								<th>查看状态</th>
								<th>面试状态</th>
								<th colspan="2" style="text-align:center;">操作</th>
							</tr>
							<c:forEach items="${sessionScope.interviews}" var="interview">
								<tr>
									<td>${interview.itId}</td>
									<td>${interview.uId}</td>
									<td>
										<f:formatDate value="${interview.deliverTime}" pattern="yyyy-MM-dd hh:mm"/>
									</td>
									<td>${interview.readed==1?'已查看':'未查看'}</td>
									<td>${interview.interview==1?'已面试':'未面试'}</td>
									<td><a href="#" name="${interview.uId}" onclick="findInfo(this)">查看</a></td>
									<td><a href="#" name="${interview.uId}" onclick="delInfo(this)">删除</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<!-- 简历详情 -->
					<div id="resumeDetails" class="allpage">
						<table id="table-2" align="center">
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
								<td colspan="4">
									<input type="submit" id="td-invited" class="btn btn-success" value="面试" onclick="invitedTime()">
									<input type="submit" class="btn btn-success" value="返回" onclick="mainpage()">
								</td>
							</tr>
						</table>
					</div>
					<!-- 邀请面试，预约时间 -->
					<div id="invitedTime" class="allpage">
						<input type="hidden" name="invitedUserId">
						<input type="date" name="invitedTime">
						<input type="submit" class="btn btn-success" value="邀请面试" onclick="invited()">
					</div>
				</div>
			</div>
	    </div>
	</div>
</body>
</html>