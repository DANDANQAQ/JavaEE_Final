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
	        <li><a href="#" >个人信息</a></li>
	        <li><a href="#" onclick="return clock()">考勤</a></li>
	        <li><a href="#" onclick="return clockRecord()">考勤记录</a></li>
	        <li><a href="#">修改密码</a></li>
	        <li><a href="#">我的奖惩</a></li>
	        <li><a href="#">部门职位</a></li>
	        <li><a href="#">我的薪资</a></li>
	        <li><a href="#">其他</a></li>
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
					
					<!-- 考勤 -->
					<div id="clock" class="allpage">
						<button type="submit" class="btn btn-success" style="width:300px;height:100px;margin: 0 0 20px 0" name="clockin" onclick="clockin()">打卡上班</button><br/>
						<button type="submit" class="btn btn-success" style="width:300px;height:100px;margin: 0 0 20px 0" name="clockout" onclick="clockout()">打卡下班</button>
					</div>
					
					<!-- 考勤记录 -->
					<div id="clockRecord" class="allpage">
						<table align="center">
							<tr>
								<td>
									<form action="${pageContext.request.contextPath}/employee/clockRecord" method="post">
										<select name="year" id="year">
											<option value="2018">2018</option>
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
										<input type="submit" id="td-invited" class="btn btn-success" value="查询">
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
				</div>
			</div>
	    </div>
	</div>
</body>
</html>