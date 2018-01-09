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
		if(${not empty requestScope.positionMsg}){
			$(".allpage").hide();
			$("#employeeMsg").show();
		}else if(${not empty requestScope.toWages}){
			$(".allpage").hide();
			$("#wages").show();
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
	})
	function mainpage(){
		$(".allpage").hide();
		$("#index").fadeIn();
		return false;
	}
	function Train(){
		$(".allpage").hide();
		$("#train").fadeIn();
		return false;
	}
	function wages(){
		$(".allpage").hide();
		$("#wages").fadeIn();
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
            <li><a href="#">员工管理</a></li>
            <li><a href="#">奖惩管理</a></li>
            <li><a href="#" onclick="return wages()">薪资管理</a></li>
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
							<input type="submit" id="td-invited" class="btn btn-success" value="查询">
						</form>
						<table id="table-2">
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
									<input type="submit" id="td-invited" class="btn btn-success" value="+" onclick="addTrainTable()">
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
												<input type="submit" id="td-invited" class="btn btn-success" value="修改" onclick="editTrain()">
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
												<input type="submit" id="td-invited" class="btn btn-success" value="发布培训" onclick="addTrain()">
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