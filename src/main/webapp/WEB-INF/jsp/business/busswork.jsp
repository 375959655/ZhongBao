<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int id = Integer.parseInt(request.getParameter("taskid"));
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="page/pagetool.js"></script>
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="css/userMain.css" type="text/css">
<link rel="stylesheet" href="css/site.css" type="text/css">
</head>
<body>
	<jsp:include page="../user/top.jsp"></jsp:include>

	<div class="template" style="height: 550px;margin-left:50px;margin-right:50px;">

		<div class="row reply" style="display: block;">
			<h1 class="title">	q</h1>
			<div id="taskid" style="display: none">${task.taskid}</div>
		</div>
		<div class="row reply" style="display: block;" id="main">
			<div class="col-sm-12" style="overflow: hidden; font-size: large;">
				<div class="rightinfo order" style="color: red;">0元</div>
			</div>
			<div class="col-sm-2 col-xs-2" style="font-size: medium">
				<div class="type">任务类型：</div><br/>
				<div class="deadline">截止日期：</div><br/>
				<div class="user">任务接收者：</div><br/>
				<div class="TEL">联系方式：</div><br/>
				<div class="state">完成状态：</div>
			</div>
			<div class="col-sm-6 col-xs-10">
				<div class="msgcontent" style="font-size: medium">哈你你</div>
			</div>
			<div class="col-sm-3 col-xs-10">
			<div><a class="evaluate" style="font-size: medium"></a></div>
			</div>
			<div class="col-sm-1 col-xs-10"><br/><br/><br/>
            <button class="btn1">通过</button><br/><br/><br/>
            <button class="btn2">驳回</button>
			</div>
			<div class="col-sm-12" style="overflow: hidden;">
				<div class="rightinfo time">2017-09-26</div>
			</div>
		</div>
		</div>

	<div id="showDetailTask"></div>
<script type="text/javascript">

$(function () {
	getTask();
});

function getTask(){
	$.ajax({
		type:"post",
		url:"Business/judgeTask",
		async:true,
		data:{
			taskid:<%=id%>
		},
		dataType:"json",
		success:function(data){
			console.log(data);
                var task = $(".template").clone();
                task.attr("display", "block");
                task.removeClass("template");
                task.find(".title").text(data.taskname);
                task.find(".order").text(data.taskmoney+"元");
                task.find(".type").text("任务类型:"+data.typename);
                task.find(".deadline").text("截止日期:"+getNewDay(data.createtime,data.deadline));
                task.find(".user").text("任务接收者:"+data.username);
                task.find(".TEL").text("联系方式:"+data.tel);
                task.find(".state").text("完成状态:"+showState(data.state));
                task.find(".msgcontent").text(data.taskcontents);
                if(data.evaluate!=null){
                	task.find(".evaluate").text(data.evaluate);
                	task.find(".evaluate").attr("href",
                		"./upload/"+data.evaluate);
                }
                task.find(".btn1").attr("onclick","finishState("+data.taskid+")");
                task.find(".btn2").attr("onclick","backState("+data.taskid+")");
                task.find(".time").text(formatDate(new Date(data.createtime)));
                $("#showDetailTask").append(task);
		},
		error:function(){
			console.log("请求失败");
		}
	});
}

function showState(state){
	if(state==2){
		return "已完成";
	}else if(state==0){
		return "进行中";
	}else if(state==1){
		return "审核中";
	}else if(state==-1){
		return "已删除";
	}
}
//日期转换
function formatDate(date) { 
    	    var y = date.getFullYear();  
    	    var m = date.getMonth() + 1;  
    	    m = m < 10 ? '0' + m : m;  
    	    var d = date.getDate();  
    	    d = d < 10 ? ('0' + d) : d;  
    	    /* var h = date.getHours();
    	    h = h < 10 ? ('0' + h) : h;
    	    var min = date.getMinutes();
    	    min = min < 10 ? ('0' + min) : min;
    	    var s = date.getSeconds();
    	    s = s < 10 ? ('0' + s) : s; */
    	    //+ ' '+  h +':' + min + ':' + s
    	    return y + '-' + m + '-' + d ;  
    	}
//日期加上天数得到新的日期  
//dateTemp 需要参加计算的日期，days要添加的天数，返回新的日期，日期格式：YYYY-MM-DD  
function getNewDay(dateTemp, days) {  
  var dateTemp = dateTemp.split("-");  
  var nDate = new Date(dateTemp[1] + '-' + dateTemp[2] + '-' + dateTemp[0]); //转换为MM-DD-YYYY格式    
  var millSeconds = Math.abs(nDate) + (days * 24 * 60 * 60 * 1000);  
  var rDate = new Date(millSeconds);  
  var year = rDate.getFullYear();  
  var month = rDate.getMonth() + 1;  
  if (month < 10) month = "0" + month;  
  var date = rDate.getDate();  
  if (date < 10) date = "0" + date;  
  return (year + "-" + month + "-" + date);  
}

function finishState(taskid) {
	$.ajax({
		type:"post",
		url:"Business/changeState",
		async:true,
		data:{
			"taskid":taskid,
			"state":2
		},
		dataType:"json"
		});
	$("#showDetailTask").html("");
	getTask();
}

function backState(taskid) {
	$.ajax({
		type:"post",
		url:"Business/changeState",
		async:true,
		data:{
			"taskid":taskid,
			"state":0//2再审1完成0进行
		},
		dataType:"json"
		});
	$("#showDetailTask").html("");
	getTask();
}

</script>
	<jsp:include page="../user/bottom.jsp"></jsp:include>
	
</body>
</html>