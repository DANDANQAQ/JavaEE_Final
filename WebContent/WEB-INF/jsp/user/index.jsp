<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>用户主页</title>
<link href="${pageContext.request.contextPath}/css/css1/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/css1/main.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.7.2.js"></script>
<script type="text/javascript">
	function resume(){
		$(".allpage").hide();
		$("#resume").fadeIn();
		return false;
	}
	function mainpage(){
		$(".allpage").hide();
		$("#index").fadeIn();
		return false;
	}
	function changePSWpage(){
		$(".allpage").hide();
		$("#changePSWpage").fadeIn();
		return false;
	}
	function feedback(){
		$(".allpage").hide();
		$("#feedback").fadeIn();
		return false;
	}
	function pswValidate(){
		var newpsw = $("input[name=newpsw]").val();
		var newpsw2 = $("input[name=newpsw2]").val();
		if(newpsw==newpsw2){
			$(".twicePSWmsg").text("通过");
			$("button[name=changePSWbutton]").attr("disabled",false);
		}else{
			$(".twicePSWmsg").text("两次输入不一致");
			$("button[name=changePSWbutton]").attr("disabled",true);
		}
	}
	function changepsw(){
		var oldpsw = $("input[name=oldpsw]").val();
		var newpsw = $("input[name=newpsw]").val();
		var newpsw2 = $("input[name=newpsw2]").val();
		if(oldpsw==""||newpsw==""||newpsw2==""){
			return;
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/user/changePSW",
			type:"post",
			data:{oldpsw:oldpsw,newpsw:newpsw},
			dataType:"text",
			success:function(data){
				$(".changePSWmsg").text(data);
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	$(function(){
		$(".allpage").hide();
		$("#index").show();
	})
	function later(){
		if(${not empty sessionScope.interviewFeedback}){
			alert("通知：您有一份面试通知，请在 反馈 中查看");
		}
	}
	window.setTimeout("later();",1000);
	function choiceDept(obj){
		var $dId = $("select[name=dId]").val();
		$("option[class=de]").remove();
		$.ajax({
			url:"${pageContext.request.contextPath}/user/choiceDept",
			type:"get",
			data:{deptId:$dId},
			dataType:"JSON",
			success:function(data){
				$("select[name=pId]").empty();
				$.each(data,function(idx,item){
					$("select[name=pId]").append(
						"<option value="+item.pid+">"+item.pname+"</option>"
					)
				})
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function validate(){
		var reg = new RegExp("^[0-9]*$");
		var age = $("input[name=age]").val();
		if(age<0){
			alert("年龄不合法，请重新输入");
			return false;
		}
		var phone = $("input[name=phone]").val();
		if(phone.length != 11){
			alert("手机号不正确，请重新输入");
			return false;
		}
		var email = $("input[name=email]").val();
		if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){
			alert("邮箱格式错误，请重新输入");
			return false;
		}
		var workYear = $("input[name=workYear]").val();
		if(workYear<0){
			alert("工作经验不合法，请重新输入");
			return false;
		}
		return true;
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
            <li><a href="#" onclick="return resume()">查看/修改简历</a></li>
            <li><a href="#" onclick="return feedback()">反馈</a></li>
            <li><a href="#" onclick="return changePSWpage()">修改密码</a></li>
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
						<img src="${pageContext.request.contextPath}/images/user.png" alt="Stanley">
						<h1>Hi, ${sessionScope.nowUser.uName}</h1>
						<p>欢迎登录人力资源管理系统，在这里，你可以投递简历，应聘你喜欢的职位！</p>
						<p>Please, consider to register to <a href="http://eepurl.com/IcgkX">our newsletter</a> to be updated with our latest themes and freebies. Like always, you can use this theme in any project freely. Share it with your friends.</p>
					</div>
					
					<!-- 反馈 -->
					<div id="feedback" class="allpage">
						<c:choose>
							<c:when test="${empty sessionScope.interviewFeedback}">
								<table align="center" border="soild 1px" cellpadding="10px" cellspacing="0">
									<tr>
										<th colspan="5" style="text-align:center;">当前没有反馈信息</th>
									</tr>
								</table>
							</c:when>
							<c:otherwise>
								<table align="center" border="soild 1px" cellpadding="10px" cellspacing="0">
									<tr>
										<th colspan="5" style="text-align:center;">反馈信息</th>
									</tr>
									<tr>
										<td>投递时间</td>
										<td>是否查看</td>
										<td>面试日期</td>
										<td>面试时间</td>
										<td>是否录用</td>
									</tr>
									<tr>
										<td>
											<f:formatDate value="${sessionScope.interviewFeedback.deliverTime}" pattern="yyyy-MM-dd"/>
										</td>
										<td>已查看</td>
										<td>${sessionScope.interviewFeedback.invitedTime}</td>
										<td>10:00-15:00</td>
										<td>未录用</td>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>
					</div>
					
					<!-- 修改密码 -->
					<div id="changePSWpage" class="allpage">
						<form action="#" onsubmit="return false">
							<table align="center" border="soild 1px" cellpadding="10px" cellspacing="0">
								<tr>
									<th colspan="2" style="text-align:center;">修改密码</th>
								</tr>
								<tr>
									<td>原始密码</td>
									<td><input type="password" name="oldpsw" placeholder="请输入原始密码" required="required"></td>
								</tr>
								<tr>
									<td>新密码</td>
									<td><input type="password" name="newpsw" placeholder="请输入新密码" required="required"></td>
								</tr>
								<tr>
									<td>再次输入</td>
									<td>
										<input type="password" name="newpsw2" placeholder="请再次输入" required="required" onchange="pswValidate()">
										<h5 class="twicePSWmsg"></h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" class="btn btn-success" value="SUBMIT" name="changePSWbutton" onclick="changepsw()"><br/>
										<h5 class="changePSWmsg"></h5>
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<!-- 简历表 -->
					<div id="resume" class="allpage">
						<form action="${pageContext.request.contextPath}/user/saveInterview" method="post" onsubmit="return validate()">
							<table align="center" border="soild 1px" cellpadding="10px" cellspacing="0">
								<tr>
									<th colspan="4" style="text-align:center;">个人简历</th>
								</tr>
								<tr>
									<td>真实姓名</td>
									<td><input type="text" name="realName" placeholder="请输入真实姓名" required="required" value="${sessionScope.info.realName}"></td>
									<td>性别</td>
									<c:choose>
										<c:when test="${sessionScope.info.sex=='女'}">
											<td>
												<input type="radio" name="sex" value="男">男
												<input type="radio" name="sex" value="女" checked="checked">女
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<input type="radio" name="sex" value="男" checked="checked">男
												<input type="radio" name="sex" value="女">女
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<td>年龄</td>
									<td><input type="number" name="age" placeholder="请输入年龄" required="required" value="${sessionScope.info.age}"></td>
									<td>学历</td>
									<td>
										<select name="edu">
											<c:choose>
												<c:when test="${empty sessionScope.info.edu}">
													<option value="">学历</option>
												</c:when>
												<c:otherwise>
													<option value="${sessionScope.info.edu}">${sessionScope.info.edu}</option>
												</c:otherwise>
											</c:choose>
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
									<td><input type="number" name="phone" placeholder="请输入联系方式" required="required" value="${sessionScope.info.phone}"></td>
									<td>e-mail</td>
									<td><input type="email" name="email" placeholder="请输入邮箱" required="required" value="${sessionScope.info.email}"></td>
								</tr>
								<tr>
									<td>应聘职位</td>
									<td>
										<c:choose>
											<c:when test="${empty sessionScope.info.dept}">
												<select name="dId" onchange="choiceDept()">
													<option value="0" class="de">--部门--</option>
													<c:forEach items="${sessionScope.depts}" var="d">
														<option value="${d.dId}">${d.dName}</option>
													</c:forEach>
												</select>
												<select name="pId">
													<option value="0">--职位--</option>
												</select>
											</c:when>
											<c:otherwise>
												<select name="dId" onchange="choiceDept()">
													<c:forEach items="${sessionScope.depts}" var="d">
														<c:choose>
															<c:when test="${sessionScope.info.dept.dId==d.dId}">
																<option value="${d.dId}" selected="selected">${d.dName}</option>
															</c:when>
															<c:otherwise>
																<option value="${d.dId}">${d.dName}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
												<select name="pId">
													<option value="${sessionScope.info.position.pId}">${sessionScope.info.position.pName}</option>
												</select>
											</c:otherwise>
										</c:choose>
									</td>
									<td>政治面貌</td>
									<td>
										<select name="politics">
											<c:if test="${not empty sessionScope.info.politics}">
												<option value="${sessionScope.info.politics}">${sessionScope.info.politics}</option>
											</c:if>
											<option value="普通群众">普通群众</option>
											<option value="共青团员">共青团员</option>
											<option value="共产党员">共产党员</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>上份工作</td>
									<td><input type="text" name="lastJob" placeholder="请输入工作名称" required="required" value="${sessionScope.info.lastJob}"></td>
									<td>工作经验</td>
									<td><input type="number" name="workYear" placeholder="请输入几年工作经验" required="required" value="${sessionScope.info.workYear}"></td>
								</tr>
								<tr>
									<td>期望薪资</td>
									<td>
										<select name="salaryExp">
											<c:if test="${not empty sessionScope.info.salaryExp}">
												<option value="${sessionScope.info.salaryExp}">${sessionScope.info.salaryExp}</option>
											</c:if>
											<option value="2000-3000">2000-3000</option>
											<option value="3000-4000">3000-4000</option>
											<option value="4000-6000">4000-6000</option>
											<option value="6000-8000">6000-8000</option>
											<option value="8000+">8000+</option>
										</select>
									</td>
									<td>兴趣爱好</td>
									<td><input type="text" name="hobby" placeholder="请输入兴趣爱好" value="${sessionScope.info.hobby}"></td>
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