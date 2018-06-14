<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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
	<script src="page/pagetool.js" ></script>
	<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/userMain.css" type="text/css"> 
    <link rel="stylesheet" href="css/site.css" type="text/css"> 
    <script type="text/javascript">
    function getTask() {
		alert("123");
		 var taskid=$("#taskid").text();
    	alert(taskid);
    	$.ajax({
			url : "User/getTask",
			type : "POST",
			async : "true",
			dataType : "json",
			data:{"taskid":taskid},
			success : function(data) {
				alert("123");
			if(data.res==1){
				alert("恭喜您获得这次任务");
			}
			else if(data.res==0){
				alert("您已获得这次任务，无需再抢");
			}
			else{
				alert("啊咧，任务被其他人抢走了！");
			}
			}	 
		});
	}
    </script>
    </head>
    <body>
    	<jsp:include page="top.jsp"></jsp:include>
  
  <!--body部分-->
  	<div class="container" style="height: 510px;">
		
		<div class="row reply" style="display: block;">
			<h1>${task.taskname }</h1>
			<div id="taskid" style="display: none" >${task.taskid}</div>
		</div>
		<div class="row reply" style="display: block;">
			<div class="col-sm-12" style="overflow: hidden; font-size: large;">
				<div class="rightinfo order" style="color: red;">${task.taskmoney}元</div>
			</div>
			<div class="col-sm-2 col-xs-2" style="font-size:medium">
				<div class="author" ><a href="User/sendmsg" style="color:#FFC107">公司名：${bussiness.bussinessname }</a></div>
				<div class="level">星级：${bussiness.level }</div>
				<div class="type">任务类型：${type.typename }</div>
				<div class="deadline">任务期限：${task.deadline }天</div>
			</div>
			<div class="col-sm-10 col-xs-10">
				<div class="msgcontent" style="font-size:medium">${task.taskcontents }</div>
			</div>
			<div class="col-sm-12" style="overflow: hidden;">
				<div class="rightinfo time">${task.createtime}</div>
			</div>
		</div>		
	</div>
  		
  		
	<jsp:include page="bottom.jsp"></jsp:include>
 	</body>
</html>