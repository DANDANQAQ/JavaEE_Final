<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>员工主页</title>
<link href="${pageContext.request.contextPath}/css4/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css4/main.css" rel="stylesheet">
<style type="text/css">
	/* Table Head */
	#table-5 thead th {
		background-color: rgb(156, 186, 95);
		color: #fff;
		border-bottom-width: 0;
	}
	
	/* Column Style */
		#table-5 td {
		color: #000;
	}
	/* Heading and Column Style */
	#table-5 tr, #table-5 th {
		border-width: 1px;
		border-style: solid;
		border-color: rgb(156, 186, 95);
	}
	
	/* Padding and font style */
	#table-5 td, #table-5 th {
		padding: 5px 10px;
		font-size: 12px;
		font-family: Verdana;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#year").find("option[value='"+${sessionScope.year}+"']").attr("selected",true);
		$("#month").find("option[value='"+${sessionScope.month}+"']").attr("selected",true);
		$("#yearw").find("option[value='"+${sessionScope.yearw}+"']").attr("selected",true);
		$("#monthw").find("option[value='"+${sessionScope.monthw}+"']").attr("selected",true);
		$("#yearb").find("option[value='"+${sessionScope.yearb}+"']").attr("selected",true);
		$("#monthb").find("option[value='"+${sessionScope.monthb}+"']").attr("selected",true);
		if(${sessionScope.canClockin==false}){
			$("button[name=clockin]").attr("disabled",true);
		}else{
			$("button[name=clockin]").attr("disabled",false);
		}
		if(${sessionScope.canClockout==false}){
			$("button[name=clockout]").attr("disabled",true);
		}else{
			$("button[name=clockout]").attr("disabled",false);
		}
		run();
		if(${not empty requestScope.toClockRecords}){
			$(".allpage").hide();
			$("#clockRecord").show();
		}else if(${not empty requestScope.toWages}){
			$(".allpage").hide();
			$("#wages").show();
		}else if(${not empty requestScope.toBonus}){
			$(".allpage").hide();
			$("#bfManage").show();
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
	function personalInformation(){
		$(".allpage").hide();
		$("#personalInformation").fadeIn();
		return false;
	}
	function changePSWpage(){
		$(".allpage").hide();
		$("#changePSWpage").fadeIn();
		return false;
	}
	function wages(){
		$(".allpage").hide();
		$("#wages").fadeIn();
		return false;
	}
	function bfManage(){
		$(".allpage").hide();
		$("#bfManage").fadeIn();
		return false;
	}
	function DP(){
		$(".allpage").hide();
		$("#DP").fadeIn();
		return false;
	}
	function clock(){
		$(".allpage").hide();
		$("#clock").show();
		return false;
	}
	function clockRecord(){
		$(".allpage").hide();
		$("#clockRecord").show();
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
	function objection(obj){
		var wId = $(obj).attr("name");
		$("input[name=wId]").val(wId);
		$("#objection").fadeIn();
		return false;
	}
	function objectionAjax(){
		var wId = $("input[name=wId]").val();
		var msg = $("input[name=objectionMsg]").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/employee/objectionAjax",
			type:"post",
			data:{wId:wId,msg:msg},
			dataType:"text",
			success:function(data){
				alert(data);
				$("#objection").hide();
				$("input[name=wId]").val('');
				$("input[name=objectionMsg]").val('');
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})	
	}
	function clockin(){
		var clockin = $("button[name=clockin]");
		var clockout = $("button[name=clockout]");
		$.ajax({
			url:"${pageContext.request.contextPath}/employee/clockin",
			type:"post",
			dataType:"text",
			success:function(data){
				if(data == 1){
					clockin.attr("disabled",true);
					clockout.attr("disabled",false);
					alert('打卡成功');
				}else{
					alert('打卡失败');
				}
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})	
	}
	function clockout(){
		var clockin = $("button[name=clockin]");
		var clockout = $("button[name=clockout]");
		$.ajax({
			url:"${pageContext.request.contextPath}/employee/clockout",
			type:"post",
			dataType:"text",
			success:function(data){
				if(data == 1){
					clockout.attr("disabled",true);
					alert('打卡成功');
				}else{
					alert('打卡失败');
				}
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})	
	}
	function startTime(){
		var today=new Date();
		var h=today.getHours();
		var m=today.getMinutes();
		var s=today.getSeconds();
		// add a zero in front of numbers<10
		m=checkTime(m);
		s=checkTime(s);
		document.getElementById('txt').innerHTML=h+":"+m+":"+s;
		t=setTimeout('startTime()',500);
	}
	function checkTime(i){
		if(i<10){
			i="0"+i;
		}
		return i;
	}

	function run(){
		var date = new Date();
		var hour = date.getHours();
		if(hour>=8 && hour<12){
			document.getElementById("h1").innerHTML="早上好！欢迎登录主页";
		}else if(hour>=12 && hour<14){
			document.getElementById("h1").innerHTML="中午好！该休息了";
		}else if(hour>=14 && hour<18){
			document.getElementById("h1").innerHTML="下午好！欢迎登录主页";
		}else if(hour>=18 && hour<24){
			document.getElementById("h1").innerHTML="晚上好！夜生活开始了！";
		}else{
			document.getElementById("h1").innerHTML="嚯！";
		}
		var week = getWeek(date);
		document.getElementById("h2").innerHTML="今天是"+week;

		startTime();
	}
	function getWeek(date){
		var str = "";  
		var week = date.getDay();  
		if (week == 0) {  
				str = "星期日";  
		} else if (week == 1) {  
				str = "星期一";  
		} else if (week == 2) {  
				str = "星期二";  
		} else if (week == 3) {  
				str = "星期三";  
		} else if (week == 4) {  
				str = "星期四";  
		} else if (week == 5) {  
				str = "星期五";  
		} else if (week == 6) {  
				str = "星期六";  
		}
		return str;
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
		return true;
	}
</script>
</head>
<body>
	<div class="navbar navbar-inverse navbar-static-top">
	  <div class="container">
	    <div class="navbar-header">
		    <ul class="nav navbar-nav navbar-right">
		    	<li><a class="navbar-brand" href="#" onclick="return mainpage()">人力资源管理系统-员工主页</a></li>
		    </ul>
	    </div>
	    <div class="navbar-collapse collapse">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#" onclick="return personalInformation()">个人信息</a></li>
	        <li><a href="#" onclick="return clock()">考勤</a></li>
	        <li><a href="#" onclick="return clockRecord()">考勤记录</a></li>
	        <li><a href="#" onclick="return changePSWpage()">修改密码</a></li>
	        <li><a href="#" onclick="return bfManage()">我的奖惩</a></li>
	        <li><a href="#" onclick="return DP()">部门职位</a></li>
	        <li><a href="#" onclick="return wages()">我的薪资</a></li>
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
						<img src="${pageContext.request.contextPath}/images/char_nappybear.png" alt="Stanley">
						<h1>Hi, ${sessionScope.nowUser.uName}</h1>
						<h1 id="h1"></h1>
						<h1 id="h2"></h1>
						<h1 id="txt"></h1>
					</div>
					
					<!-- 我的奖惩 -->
					<div id="bfManage" class="allpage">
						<form action="${pageContext.request.contextPath}/employee/findBonus" method="post">
							<select name="yearb" id="yearb">
								<option value="2018">2018</option>
								<option value="2017">2017</option>
							</select>年
							<select name="monthb" id="monthb">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>月
							<input type="submit" class="btn btn-success" value="查询">
						</form>
						<table id="table-5" align="center">
							<tr>
								<th>编号</th>
								<th>奖惩缘由</th>
								<th>奖惩时间</th>
								<th>奖惩金额</th>
								<th>奖惩类型</th>
							</tr>
							<c:if test="${empty sessionScope.bFsByMonth}">
								<tr><td colspan="6">本月暂无奖惩记录</td></tr>
							</c:if>
							<c:if test="${not empty sessionScope.bFsByMonth}">
								<c:forEach items="${sessionScope.bFsByMonth}" var="b">
									<tr>
										<td>${b.bfId}</td>
										<td>${b.msg}</td>
										<td>${b.year}-${b.month+1}-${b.day}</td>
										<td>${b.money}</td>
										<td>${b.type==0?'罚':'奖'}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					
					<!-- 考勤 -->
					<div id="clock" class="allpage">
						<button type="submit" class="btn btn-success" style="width:300px;height:100px;margin: 0 0 20px 0" name="clockin" onclick="clockin()">打卡上班</button><br/>
						<button type="submit" class="btn btn-success" style="width:300px;height:100px;margin: 0 0 20px 0" name="clockout" onclick="clockout()">打卡下班</button>
					</div>
					
					<!-- 个人信息 -->
					<div id="personalInformation" class="allpage">
						<form action="${pageContext.request.contextPath}/employee/personalInformation" method="post" onsubmit="return validate()">
							<table align="center" id="table-5">
								<tr>
									<th colspan="4" style="text-align:center;">个人信息</th>
								</tr>
								<tr>
									<td>真实姓名</td>
									<td><input type="text" name="realName" placeholder="请输入真实姓名" required="required" value="${sessionScope.info.realName}"></td>
									<td>性别</td>
									<td>${sessionScope.info.sex}</td>
								</tr>
								<tr>
									<td>年龄</td>
									<td><input type="number" name="age" placeholder="请输入年龄" required="required" value="${sessionScope.info.age}"></td>
									<td>学历</td>
									<td>${sessionScope.info.edu}</td>
								</tr>
								<tr>
									<td>手机号</td>
									<td><input type="number" name="phone" placeholder="请输入联系方式" required="required" value="${sessionScope.info.phone}"></td>
									<td>e-mail</td>
									<td><input type="email" name="email" placeholder="请输入邮箱" required="required" value="${sessionScope.info.email}"></td>
								</tr>
								<tr>
									<td>职位</td>
									<td>${sessionScope.info.dept.dName}&nbsp;&nbsp;${sessionScope.info.position.pName}</td>
									<td>政治面貌</td>
									<td>${sessionScope.info.politics}</td>
								</tr>
								<tr>
									<td>入职时间</td>
									<td>
										<f:formatDate value="${sessionScope.info.entryTime}" pattern="yyyy-MM-dd"/>	
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
					
					<!-- 我的薪资 -->
					<div id="wages" class="allpage">
						<table align="center">
							<tr>
								<td>
									<form action="${pageContext.request.contextPath}/employee/findWages" method="post">
										<select name="year" id="yearw">
											<option value="2018">2018</option>
											<option value="2017">2017</option>
										</select>年
										<select name="month" id="monthw">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>月
										<input type="submit" class="btn btn-success" value="查询">
									</form>
								</td>
							</tr>
							<tr>
								<td>
									<div id="objection" class="allpage">
										<input type="hidden" name="wId">
										<input type="text" name="objectionMsg"  placeholder="输入异议理由" required="required">
										<input type="submit" class="btn btn-success" value="提交" onclick="objectionAjax()">
									</div>
								</td>
							</tr>
						</table>
						<table id="table-5" align="center">
							<tr>
								<th>总工资</th>
								<th>基本工资</th>
								<th>绩效工资</th>
								<th>加班工资</th>
								<th>奖励工资</th>
								<th>惩罚工资</th>
								<th>社保</th>
								<th>是否异议</th>
							</tr>
							<c:if test="${empty sessionScope.wages}">
								<tr>
									<td colspan="8">暂无工资记录</td>
								</tr>
							</c:if>
							<c:if test="${not empty sessionScope.wages}">
								<tr>
									<td>${sessionScope.wages.realwages}</td>
									<td>${sessionScope.wages.basicwages}</td>
									<td>${sessionScope.wages.performance}</td>
									<td>${sessionScope.wages.overtimewages}</td>
									<td>${sessionScope.wages.bonus}</td>
									<td>${sessionScope.wages.forfiet}</td>
									<td>${sessionScope.wages.social}</td>
									<td><a href="#" name="${sessionScope.wages.wId}" onclick="return objection(this)">异议</a></td>
								</tr>
							</c:if>
						</table>
					</div>
					
					<!-- 考勤记录 -->
					<div id="clockRecord" class="allpage">
						<table align="center">
							<tr>
								<td>
									<form action="${pageContext.request.contextPath}/employee/clockRecord" method="post">
										<select name="year" id="year">
											<option value="2018">2018</option>
											<option value="2017">2017</option>
										</select>年
										<select name="month" id="month">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>月
										<input type="submit" class="btn btn-success" value="查询">
									</form>
								</td>
								<td>
									<c:if test="${not empty sessionScope.absenteeismDays}">
										这个月缺勤${sessionScope.absenteeismDays}天
									</c:if>
								</td>
							</tr>
						</table>
						<table id="table-5" align="center">
							<tr>
								<th>上班时间</th>
								<th>下班时间</th>
								<th>迟到时间(小时)</th>
								<th>早退时间(小时)</th>
							</tr>
							<c:choose>
								<c:when test="${empty sessionScope.clockRecords}">
									<tr>
										<td colspan="4">暂无考勤</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${sessionScope.clockRecords}" var="c">
										<tr>
											<td>
												<f:formatDate value="${c.clockin}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>
												<f:formatDate value="${c.clockout}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td>${c.late}</td>
											<td>${c.early}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
							<!-- 修改密码 -->
					<div id="changePSWpage" class="allpage">
						<form action="#" onsubmit="return false">
							<table id="table-5" align="center">
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
					
					<!-- 部门职位 -->
					<div id="DP" class="allpage">
						<table id="table-5" align="center">
							<tr>
								<c:forEach items="${sessionScope.depts}" var="d">
									<th style="text-align:center;">${d.dName}</th>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach items="${sessionScope.depts}" var="d">
									<td>
										<ul>
											<c:forEach items="${d.positions}" var="p">
												<li>${p.pName}</li>
											</c:forEach>
										</ul>
									</td>
								</c:forEach>
							</tr>
						</table>
					</div>
					
				</div>
			</div>
	    </div>
	</div>
</body>
</html>