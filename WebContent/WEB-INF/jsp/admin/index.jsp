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
		border-left-width: 5px;
		border-left-style: solid;
		border-left-color: rgb(230, 189, 189);
		border-right-width: 5px;
		border-right-style: solid;
		border-right-color: rgb(230, 189, 189);
		border-bottom-width: 5px;
		border-bottom-style: solid;
		border-bottom-color: rgb(230, 189, 189);
	}
	
	/* Padding and font style */
	#table-2 td, #table-2 th {
		border-left-width: 3px;
		border-left-style: solid;
		border-left-color: rgb(230, 189, 189);
		border-right-width: 3px;
		border-right-style: solid;
		border-right-color: rgb(230, 189, 189);
		padding: 5px 10px;
		font-size: 15px;
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
		$("#year").find("option[value='"+${sessionScope.year}+"']").attr("selected",true);
		$("#month").find("option[value='"+${sessionScope.month}+"']").attr("selected",true);
		$("#yearb").find("option[value='"+${sessionScope.yearb}+"']").attr("selected",true);
		$("#monthb").find("option[value='"+${sessionScope.monthb}+"']").attr("selected",true);
		$("#yearc").find("option[value='"+${sessionScope.yearc}+"']").attr("selected",true);
		$("#monthc").find("option[value='"+${sessionScope.monthc}+"']").attr("selected",true);
		$("#emp").find("option[value='"+${sessionScope.emp}+"']").attr("selected",true);
		if(${not empty requestScope.positionMsg}){
			$(".allpage").hide();
			$("#employeeMsg").show();
		}else if(${not empty requestScope.toWages}){
			$(".allpage").hide();
			$("#wages").show();
		}else if(${not empty requestScope.toBonus}){
			$(".allpage").hide();
			$("#bfManage").show();
		}else if(${not empty requestScope.toObjection}){
			$(".allpage").hide();
			$("#objection").show();
		}else if(${not empty requestScope.toClockEmp}){
			$(".allpage").hide();
			$("#clockEmp").show();
		}else if(${not empty requestScope.toEMP}){
			$(".allpage").hide();
			$("#employeeManage").show();
		}else if(${not empty requestScope.toEMPMsg}){
			$(".allpage").hide();
			$("#empMsg").show();
		}else if(${not empty requestScope.toDeptPage}){
			$(".allpage").hide();
			$("#DP").show();
		}else if(${not empty requestScope.toRecruitment}){
			$(".allpage").hide();
			$("#recruitment").show();
		}else{
			$(".allpage").hide();
			$("#index").show();
		}
		run();
	})
	function mainpage(){
		$(".allpage").hide();
		$("#index").fadeIn();
		return false;
	}
	function bfManage(){
		$(".allpage").hide();
		$("#bfManage").fadeIn();
		return false;
	}
	function Train(){
		$(".allpage").hide();
		$("#train").fadeIn();
		return false;
	}
	function bonus(obj){
		var uId = $(obj).attr("name");
		$("input[name=bonusuId]").val(uId);
		$("#bonus").fadeIn();
		return false;
	}
	function employeeManage(){
		$(".allpage").hide();
		$("#employeeManage").fadeIn();
		return false;
	}
	function wages(){
		$(".allpage").hide();
		$("#wages").fadeIn();
		return false;
	}
	function objection(){
		$(".allpage").hide();
		$("#objection").fadeIn();
		return false;
	}
	function resumeManage(){
		$(".allpage").hide();
		$("#resumeManage").fadeIn();
		return false;
	}
	function recruitment(){
		$(".allpage").hide();
		$("#recruitment").fadeIn();
		return false;
	}
	function DP(){
		$(".allpage").hide();
		$("#DP").fadeIn();
		return false;
	}
	function addTrainTable(){
		$("#addTrainTable").fadeIn();
		return false;
	}
	function returnTrainsByAdd(){
		$("#addTrainTable").fadeOut();
		var tName = $("input[name=tName]").val('');
		var tTime = $("input[name=tTime]").val('');
		var traindId = $("select[name=traindId]").val('');
		return false;
	}
	function returnTrainsByEdit(){
		$("#editTrainTable").fadeOut();
		$(".a-del").fadeIn();
		return false;
	}
	function editDeptName(obj){
		var dId = $(obj).attr("name");
		$("input[name=editDeptdId]").val(dId);
		$("#editDeptName").fadeIn();
		return false;
	}
	function editPositionName(obj){
		var pId = $(obj).attr("name");
		$("input[name=editPositionpId]").val(pId);
		$("#editPositionName").fadeIn();
		return false;
	}
	function dismissObjection(obj){
		var wId = $(obj).attr("name");
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/wagesMsgByObjection",
			type:"post",
			data:{wId:wId},
			dataType:"JSON",
			success:function(data){
				$("#obj-uId").text(data.uid);
				$("#obj-realwages").text(data.realwages);
				$("#obj-basicwages").text(data.basicwages);
				$("#obj-performance").text(data.performance);
				$("#obj-overtimewages").text(data.overtimewages);
				$("#obj-bonus").text(data.bonus);
				$("#obj-forfiet").text(data.forfiet);
				$("#obj-social").text(data.social);
				$("#obj-month").text(data.year+"-"+data.month+1);
				$("#obj-a").attr("href","${pageContext.request.contextPath}/admin/dismissObjection?wId="+data.wid);
				$("#wagesMsgByObjecion").fadeIn();
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
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
	function addTrain(){
		var tName = $("input[name=tName]").val();
		var tTime = $("input[name=tTime]").val();
		if(tName=="" || tTime==""){
			alert('内容日期不能为空');
			return;
		}
		var traindId = $("select[name=traindId]").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/addTrain",
			type:"post",
			data:{tName:tName,tTime:tTime,traindId:traindId},
			dataType:"text",
			success:function(data){
				if(data=='addTrain'){
					alert('发布成功');
				}
				$("#addTrainTable").fadeOut();
				$("#ul-trains").append(
					"<li><a href='#' name="+data+
						" onclick='return editTrainTable(this)'>"+$("input[name=tName]").val()+
						"</a><a href='#' name="+data+
						" onclick='return delTrain(this)'>[D]</a></li>"
				)
				var tName = $("input[name=tName]").val('');
				var tTime = $("input[name=tTime]").val('');
				var traindId = $("select[name=traindId]").val('');
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function editTrain(){
		var tId = $("input[name=edit_tId]").val();
		var tName = $("input[name=edit_tName]").val();
		var tTime = $("input[name=edit_tTime]").val();
		if(tName=="" || tTime==""){
			alert('内容日期不能为空');
			return;
		}
		var traindId = $("select[name=edit_traindId]").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/editTrainAjax",
			type:"post",
			data:{tId:tId,tName:tName,tTime:tTime,traindId:traindId},
			dataType:"text",
			success:function(data){
				if(data=='editTrain'){
					$("#editTrainTable").hide();
					$("#ul-trains").find("a[class='"+$("input[name=edit_tId]").val()+"']").text($("input[name=edit_tName]").val());      
				}
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function editTrainTable(obj){
		var tId = $(obj).attr("name");
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/findTrainAjax",
			type:"post",
			data:{tId:tId},
			dataType:"JSON",
			success:function(data){
				$("input[name=edit_tId]").val(data.tid);
				$("input[name=edit_tName]").val(data.tname);
				
				var now = new Date(data.ttime);
				//格式化日，如果小于9，前面补0  
				var day = ("0" + now.getDate()).slice(-2);  
				//格式化月，如果小于9，前面补0  
				var month = ("0" + (now.getMonth() + 1)).slice(-2);  
				//拼装完整日期格式  
				var today = now.getFullYear()+"-"+(month)+"-"+(day) ;  
				//完成赋值  
				$('input[name=edit_tTime]').val(today);  
				
				$("#edit_traindId").find("option[value='"+data.department.did+"']").attr("selected",true);      
				$("#editTrainTable").fadeIn();
				$(".a-del").fadeOut();
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function delTrain(obj){
		var tId = $(obj).attr("name");
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/delTrainAjax",
			type:"post",
			data:{tId:tId},
			dataType:"text",
			success:function(data){
				if(data=='success'){
					$(obj).parent().remove();
				}
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function invited(){
		var uId = $("input[name=invitedUserId]").val();
		var invitedTime = $("input[name=invitedTime]").val();
		if(uId=="" || invitedTime==""){
			alert('日期不能为空');
			return;
		}
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
	function transfer(obj){
		var uId = $(obj).attr("name");
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/transfer",
			type:"post",
			data:{uId:uId},
			dataType:"JSON",
			success:function(data){
				$("#transfer-uId").text(uId);
				$("input[name=transfer-uId]").val(uId);
				$("#transfer-uName").text(data.realname);
				$("#transfer-dId").find("option[value='"+data.dept.did+"']").attr("selected",true);
				$("select[name=transfer-pId]").empty();
				$("select[name=transfer-pId]").append(
					"<option value="+data.position.pid+">"+data.position.pname+"</option>"
				)
				$("#transfer").fadeIn();
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
		return false;
	}
	function doTransfer(){
		var uId = $("input[name=transfer-uId]").val();
		var dId = $("select[name=transfer-dId]").val();
		var pId = $("select[name=transfer-pId]").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/doTransfer",
			type:"post",
			data:{uId:uId,dId:dId,pId:pId},
			dataType:"text",
			success:function(data){
				alert(data);
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
	function transferChoiceDept(obj){
		var $dId = $("select[name=transfer-dId]").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/user/choiceDept",
			type:"get",
			data:{deptId:$dId},
			dataType:"JSON",
			success:function(data){
				$("select[name=transfer-pId]").empty();
				$.each(data,function(idx,item){
					$("select[name=transfer-pId]").append(
						"<option value="+item.pid+">"+item.pname+"</option>"
					)
				})
			},
			error:function(x,msg,obj){
				alert(msg);
			}
		})
	}
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
	function checkBonus(){
		var money = $("input[name=bonusMoney]").val();
		if(money<0){
			alert("金额不能为负");
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
		    	<li><a class="navbar-brand" href="#" onclick="return mainpage()">人力资源管理系统-管理员页面</a></li>
		    </ul>
	    </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" onclick="return resumeManage()">应聘管理</a></li>
            <li><a href="#" onclick="return recruitment()">招聘信息</a></li>
            <li><a href="#" onclick="return DP()">部门职位</a></li>
            <li><a href="#" onclick="return Train()">培训管理</a></li>
            <li><a href="#" onclick="return employeeManage()">员工管理</a></li>
            <li><a href="#" onclick="return bfManage()">奖惩管理</a></li>
            <li><a href="#" onclick="return wages()">薪资管理</a></li>
            <li><a href="#" onclick="return objection()">工资异议</a></li>
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
						<h1 id="h1"></h1>
						<h1 id="h2"></h1>
						<h1 id="txt"></h1>
					</div>
				
					
					<div id="wagesMsgByObjecion" class="allpage">
						<table id="table-2" align="center">
							<tr>
								<th>异议员工编号</th>
								<th>总工资</th>
								<th>基本工资</th>
								<th>绩效工资</th>	
								<th>加班工资</th>	
								<th>奖励工资</th>	
								<th>惩罚工资</th>	
								<th>社保工资</th>	
								<th>异议月份</th>	
								<th>操作</th>	
							</tr>
							<tr>
								<td id="obj-uId"></td>
								<td id="obj-realwages"></td>
								<td id="obj-basicwages"></td>
								<td id="obj-performance"></td>
								<td id="obj-overtimewages"></td>
								<td id="obj-bonus"></td>
								<td id="obj-forfiet"></td>
								<td id="obj-social"></td>
								<td id="obj-month"></td>
								<td><a href="#" id="obj-a">驳回</a></td>
							</tr>
						</table>
					</div>
					<!-- 工资异议 -->
					<div id="objection" class="allpage">
						<table id="table-2" align="center">
							<tr>
								<th>异议员工编号</th>
								<th>异议缘由</th>
								<th>详情</th>	
							</tr>
							<c:forEach items="${sessionScope.objections}" var="o">
								<tr>
									<td>${o.uId}</td>
									<td>${o.msg}</td>
									<td><a href="#" name="${o.wId}" onclick="return dismissObjection(this)">详情</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<!-- 奖惩管理 -->
					<div id="bfManage" class="allpage">
						<form action="${pageContext.request.contextPath}/admin/findBonus" method="post">
							<select name="yearb" id="yearb">
								<option value="2018">2018</option>
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
						<table id="table-2" align="center">
							<tr>
								<th>编号</th>
								<th>奖惩员工ID</th>
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
										<td>${b.uId}</td>
										<td>${b.msg}</td>
										<td>${b.year}-${b.month+1}-${b.day}</td>
										<td>${b.money}</td>
										<td>${b.type==0?'罚':'奖'}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
										
					<!-- 简历详情 -->
					<div id="empMsg" class="allpage">
						<table id="table-2" align="center">
							<tr>
								<th colspan="4" style="text-align:center;">员工信息</th>
							</tr>
							<tr>
								<th>姓名</th>
								<td id="realname2">${sessionScope.empMsg.realName}</td>
								<th>性别</th>
								<td id="sex2">${sessionScope.empMsg.sex}</td>
							</tr>
							<tr>
								<th>年龄</th>
								<td id="age2">${sessionScope.empMsg.age}</td>
								<th>学历</th>
								<td id="edu2">${sessionScope.empMsg.edu}</td>
							</tr>
							<tr>
								<th>联系方式</th>
								<td id="phone2">${sessionScope.empMsg.phone}</td>
								<th>邮箱</th>
								<td id="email2">${sessionScope.empMsg.email}</td>
							</tr>
							<tr>
								<th>入职时间</th>
								<td id="entryTime2">
									<f:formatDate value="${sessionScope.empMsg.entryTime}" pattern="yyyy-MM-dd"/>	
								</td>
								<th>职位</th>
								<td id="dp2">${sessionScope.empMsg.dept.dName}&nbsp;&nbsp;${sessionScope.empMsg.position.pName}</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
									<input type="submit" class="btn btn-success" name="${sessionScope.empMsg.uId}" value="奖励" onclick="bonus(this)">
									<input type="submit" class="btn btn-success" value="返回" onclick="employeeManage()">
								</td>
							</tr>
						</table>
					</div>
					
					<!-- bonus -->
					<div id="bonus" class="allpage">
						<form action="${pageContext.request.contextPath}/admin/bonus" method="post" onsubmit="return checkBonus()">
							<table id="table-2" align="center">
								<tr>
									<th colspan="2" style="text-align:center;">奖励</th>
								</tr>
								<tr>
									<td>奖励理由：</td>
									<td>
										<input type="hidden" name="bonusuId">
										<input type="text" name="bonusReason" placeholder="输入奖励理由" required="required">
									</td>
								</tr>
								<tr>
									<td>金额：</td>
									<td><input type="number" name="bonusMoney" placeholder="输入奖励金额" required="required"></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;">
										<input type="submit"class="btn btn-success" value="确认">
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<!-- 员工管理 -->
					<div id="employeeManage" class="allpage">
						<form action="${pageContext.request.contextPath}/admin/changeEmp" method="post">
							<select id="emp" name="emp" onchange="changeEMP()">
								<option value="1">在职员工</option>
								<option value="2">离职员工</option>
							</select>
							<input type="submit" class="btn btn-success" value="查询">
						</form>
						<c:if test="${sessionScope.emp==1}">
							<table id="table-2" align="center">
								<tr>
									<th style="text-align:center;">编号</th>
									<th style="text-align:center;">姓名</th>
									<th colspan="4" style="text-align:center;">操作</th>
								</tr>
								<c:forEach items="${sessionScope.infos}" var="i">
									<tr>
										<td>${i.uId}</td>
										<td><a href="${pageContext.request.contextPath}/admin/findEmpMsg?uId=${i.uId}">${i.realName}</a></td>
										<td><a href="#" name="${i.uId}" onclick="return transfer(this)">人事调动</a></td>
										<td><a href="${pageContext.request.contextPath}/admin/clockEmp?uId=${i.uId}">考勤</a></td>
										<td><a href="#">工资发放</a></td>
										<td><a href="#">开除</a></td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
						<c:if test="${sessionScope.emp==2}">
							<c:if test="${empty sessionScope.infos}">
								<table id="table-2" align="center">
									<tr>
										<th style="text-align:center;">编号</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center;">操作</th>
									</tr>
									<tr>
										<td style="text-align:center;" colspan="3">暂无离职员工</td>
									</tr>
								</table>
							</c:if>
							<c:if test="${not empty sessionScope.infos}">
								<table id="table-2" align="center">
									<tr>
										<th style="text-align:center;">编号</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center;">操作</th>
									</tr>
									<tr>
										<c:forEach items="${sessionScope.infos}" var="i">
											<td>${i.uId}</td>
											<td>${i.realName}</td>
											<td><a href="#">其他</a></td>
										</c:forEach>
									</tr>
								</table>
							</c:if>
						</c:if>
					</div>
							
					<!-- 考勤记录 -->
					<div id="clockEmp" class="allpage">
						<table align="center">
							<tr>
								<td>
									<form action="${pageContext.request.contextPath}/admin/clockEmp" method="post">
										<select name="yearc" id="yearc">
											<option value="2018">2018</option>
										</select>年
										<select name="monthc" id="monthc">
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
						<table id="table-2" align="center">
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
							<tr>
								<td colspan="4">
									<input type="submit" class="btn btn-success" value="返回" onclick="employeeManage()">
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 人事调动 -->
					<div id="transfer" class="allpage">
						<table id="table-2" align="center">
							<tr>
								<th colspan="4" style="text-align:center;">请选择调动的部门和职位</th>
							</tr>
							<tr>
								<td id="transfer-uId"></td>
								<td id="transfer-uName"></td>
								<td>
									<input type="hidden" name="transfer-uId">
									<select name="transfer-dId" id="transfer-dId" onchange="transferChoiceDept()">
										<c:forEach items="${sessionScope.depts}" var="d">
											<option value="${d.dId}">${d.dName}</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<select name="transfer-pId" id="transfer-pId">
									</select>
								</td>
							</tr>
							<tr>
								<th colspan="4" style="text-align:center;">
									<input type="submit" onclick="doTransfer()" class="btn btn-success" value="确认调动">
								</th>
							</tr>
						</table>
					</div>
					
					<!-- 薪资管理 -->
					<div id="wages" class="allpage">
						<form action="${pageContext.request.contextPath}/admin/findWages" method="post">
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
							<input type="submit" class="btn btn-success" value="查询">
						</form>
						<table id="table-2" align="center">
							<tr>
								<th>编号</th>
								<th>员工编号</th>
								<th>总工资</th>
								<th>基本工资</th>
								<th>绩效工资</th>
								<th>加班工资</th>
								<th>奖励工资</th>
								<th>惩罚工资</th>
								<th>社保</th>
							</tr>
							<c:if test="${empty sessionScope.wages}">
								<tr>
									<td colspan="9">暂无工资记录</td>
								</tr>
							</c:if>
							<c:if test="${not empty sessionScope.wages}">
								<c:forEach items="${sessionScope.wages}" var="w">
									<tr>
										<td>${w.wId}</td>
										<td>${w.uId}</td>
										<td>${w.realwages}</td>
										<td>${w.basicwages}</td>
										<td>${w.performance}</td>
										<td>${w.overtimewages}</td>
										<td>${w.bonus}</td>
										<td>${w.forfiet}</td>
										<td>${w.social}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					
					<!-- 培训管理 -->
					<div id="train" class="allpage">
						<table id="table-2">
							<tr>
								<td>
									<ul id="ul-trains">
										<c:forEach items="${sessionScope.trains}" var="t">
											<li>
												<a href="#" name="${t.tId}" class="${t.tId}" onclick="return editTrainTable(this)">${t.tName}</a>
												<a href="#" name="${t.tId}" class="a-del" onclick="return delTrain(this)">[D]</a>
											</li>
										</c:forEach>
									</ul>
									<input type="submit" class="btn btn-success" value="+" onclick="addTrainTable()">
								</td>
								<td id="editTrainTable" class="allpage">
									<table>
										<tr>
											<th>培训--修改</th>
										</tr>
										<tr>
											<td>
												培训名称：
												<input type="hidden" name="edit_tId">
												<input type="text" name="edit_tName" placeholder="培训内容" required="required">
											</td>
										</tr>
										<tr>
											<td>
												培训时间：<input type="date" name="edit_tTime" required="required">
											</td>
										</tr>
										<tr>
											<td>
												培训部门：
												<select name="edit_traindId" id="edit_traindId">
													<c:forEach items="${sessionScope.depts}" var="d">
														<option value="${d.dId}">${d.dName}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td>
												<input type="submit" class="btn btn-success" value="修改" onclick="editTrain()">
												<input type="submit" class="btn btn-success" value="取消" onclick="returnTrainsByEdit()">
											</td>
										</tr>
									</table>
								</td>
								<td id="addTrainTable" class="allpage">
									<table>
										<tr>
											<th>培训--新增</th>
										</tr>
										<tr>
											<td>
												培训名称：<input type="text" name="tName" placeholder="培训内容" required="required">
											</td>
										</tr>
										<tr>
											<td>
												培训时间：<input type="date" name="tTime" required="required">
											</td>
										</tr>
										<tr>
											<td>
												培训部门：
												<select name="traindId">
													<c:forEach items="${sessionScope.depts}" var="d">
														<option value="${d.dId}">${d.dName}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td>
												<input type="submit" class="btn btn-success" value="发布培训" onclick="addTrain()">
												<input type="submit" class="btn btn-success" value="取消" onclick="returnTrainsByAdd()">
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 招聘 -->
					<div id="recruitment" class="allpage">
						<table id="table-2" width="800">
							<tr>
								<th colspan="5" style="text-align:center;">招聘信息</th>
							</tr>
							<tr>
								<th style="text-align:center;">部门</th>
								<th style="text-align:center;">职位</th>
								<th style="text-align:center;">详情</th>
								<th style="text-align:center;">发布时间</th>
								<th style="text-align:center;">删除</th>
							</tr>
							<c:forEach items="${sessionScope.employments}" var="e">
								<tr>
									<td style="text-align:center;">${e.department.dName}</td>
									<td style="text-align:center;">${e.position.pName}</td>
									<td style="text-align:center;">${e.requirement}</td>
									<td style="text-align:center;">
										<f:formatDate value="${e.deliverTime}" pattern="yyyy-MM-dd HH:mm"/>
									</td>
									<td style="text-align:center;"><a href="${pageContext.request.contextPath}/admin/delRecruitment?eId=${e.eId}">DEL</a></td>
								</tr>
							</c:forEach>
						</table>
						<form action="${pageContext.request.contextPath}/admin/addEmployment" method="post">
							<table id="table-2" width="800">
								<tr>
									<th style="text-align:center;">
										添加招聘信息
										<select name="dId" onchange="choiceDept()">
											<option value="0" class="de">--部门--</option>
											<c:forEach items="${sessionScope.depts}" var="d">
												<option value="${d.dId}">${d.dName}</option>
											</c:forEach>
										</select>
										<select name="pId">
											<option value="0">--职位--</option>
										</select>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;">
										详情:<input type="text" name="requirement">
									</th>
								</tr>
								<tr>
									<td>
										<input type="submit" value="发布">
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<!-- 部门职位 -->
					<div id="DP" class="allpage">
						<form id="editDeptName" class="allpage" action="${pageContext.request.contextPath}/admin/editDeptName">
							<h4>修改部门名</h4>
							<input type="hidden" name="editDeptdId">
							<input type="text" name="deptName" placeholder="请输入部门名" required="required">
							<input type="submit" class="btn btn-success" value="提交">
						</form>
						<form id="editPositionName" class="allpage" action="${pageContext.request.contextPath}/admin/editPositionName">
							<h4>修改部门名</h4>
							<input type="hidden" name="editPositionpId">
							<input type="text" name="positionName" placeholder="请输入职位名" required="required">
							<input type="submit" class="btn btn-success" value="提交">
						</form>
						<table id="table-2" align="center">
							<c:forEach items="${sessionScope.depts}" var="d">
								<tr>
									<th>
										${d.dName}
										<a href="#" name="${d.dId}" onclick="return editDeptName(this)">[E]</a>
										<a href="${pageContext.request.contextPath}/admin/delDept?dId=${d.dId}">[D]</a>
									</th>
									<td>
										<ul>
											<c:forEach items="${d.positions}" var="p">
												<li>
													<a href="${pageContext.request.contextPath}/admin/positionMsg?pId=${p.pId}">${p.pName}</a>
													<a href="#" name="${p.pId}" onclick="return editPositionName(this)">[E]</a>
													<a href="${pageContext.request.contextPath}/admin/delPosition?pId=${p.pId}">[D]</a>
												</li>
											</c:forEach>
										</ul>
									</td>
									<td>
										<form action="${pageContext.request.contextPath}/admin/addPosition">
											<input type="hidden" name="dId" value="${d.dId}">
											<input type="text" name="posiName" style="width:130px;" placeholder="添加职位" required="required">
											<input type="submit" class="btn btn-success" value="提交">
										</form>
									</td>
								</tr>
							</c:forEach>	
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