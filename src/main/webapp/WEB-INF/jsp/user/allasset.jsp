<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE html>
<html>
    <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/popper.min.js" ></script>
	<script src="js/bootstrap.js" ></script>
	<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/userMain.css" type="text/css"> 
    <link rel="stylesheet" href="css/site.css" type="text/css"> 
    </head>
    <body>
    	<jsp:include page="top.jsp"></jsp:include>
  
  <!--body部分-->
  	<div class="container" style="padding-top: 20px;height: 550px;">		
		<div class="row">
			<div class="col-sm-12 msgtitle"><h1>我完成的任务</h1></div>
		</div>
		<div class="row" style="padding-top:30px">
			<div class="col-sm-8 col-xs-8"><h2>标题</h2></div>
			<div class="col-sm-2 col-xs-4 text-center"><h2>时间</h2></div>
			<div class="col-sm-2 hidden-xs text-center"><h2>酬劳</h2></div>
		</div>
		
		<div class="template row">
				<div class="col-sm-8 col-xs-8 text-limit">
					<a class="title" style="font-size:medium" href="user/message.jsp">标题标题标题标题标题标题</a>
				</div>
				<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">时间</div>
				<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2>1000元</h2></div>
				<hr align=center width=1300 color=#DDDDDD size=1>
		</div>
			
		<div class="msglist ">
			<c:forEach items="${requestScope.myallasset}" var="item">
				<div class="row">
					<div class="col-sm-8 col-xs-8 text-limit">
						<a class="title" style="font-size:medium" href="Task/mywork?taskid=${item.taskid }">${item.taskname}</a>
					</div>
					<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">${item.createtime}</div>
					<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2>${item.taskmoney}元</h2></div>
				</div>
					
			</c:forEach>
			<!-- <div class="row">
				<div class="col-sm-8 col-xs-8 text-limit">
					<a class="title" style="font-size:medium" href="Task/work">【急】谁可以帮我做团队项目呀，重金</a>
				</div>
				<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">2017.09.21</div>
				<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2>1000元</h2></div>
			</div>
			<div class="row">
				<div class="col-sm-8 col-xs-8 text-limit">
					<a class="title" style="font-size:medium" href="Task/work">需家装设计师出一套图纸</a>
				</div>
				<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">2017.09.21</div>
				<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2>1500元</h2></div>
			</div>
			<div class="row">
				<div class="col-sm-8 col-xs-6 text-limit">
					<a class="title" style="font-size:medium" href="Task/work">找人陪吃饭</a>
				</div>
				<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">2017.09.21</div>
				<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2>1元</h2></div>
			</div> -->
		</div>
		
		<div class="row " style="font-size: large; padding-top: 30px;">
				<div class="col-sm-12 ">我依靠努力一共赚了：${requestScope.sumMoney}元</div>
		</div>
		</div>
	</div>
  		
  		<jsp:include page="bottom.jsp"></jsp:include>
	
 	</body>
</html>