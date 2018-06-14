<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String text = request.getParameter("text");
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="css/userMain.css" type="text/css">
<link rel="stylesheet" href="css/site.css" type="text/css">
<script type="text/javascript">
	var pageIndex = 1;
	var pageSize = 5;
	$(function() {
		getTask();
	})
	function getTask() {
		$.ajax({
			url : "Task/tasksearch",
			type : "POST",
			data : {
				text : '<%=text%>',
				pageIndex : pageIndex,
				pageSize : pageSize
			},
			dataType : "json",
			success : function(data) {
				// 遍历数组内容
				if (data.res == 1) {
					$.each(data.data, function(index, msgItem) {
						var msg = $(".template").clone();
						msg.show();
						msg.removeClass("template");
						msg.find(".title").text(msgItem.taskname);
						msg.find(".title").attr("href",
								"work.jsp?taskid=" + msgItem.taskid);
						msg.find(".time").text(msgItem.createtime);
						msg.find(".money").text(msgItem.taskmoney);
						$(".p").before(msg);
					});
					pageIndex++;
				} else {
					$("#loadmore").html("没有更多数据了！");
				}
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>

	<!--body部分-->
	<div class="container" style="padding-top: 20px; height: 550px;">
		<div class="row">
			<div class="col-sm-12 msgtitle">
				<h1>任务</h1>
			</div>

		</div>
		<div class="row" style="padding-top: 30px">
			<div class="col-sm-8 col-xs-8">
				<h2>标题</h2>
			</div>
			<div class="col-sm-2 col-xs-4 text-center">
				<h2>时间</h2>
			</div>
			<div class="col-sm-2 hidden-xs text-center">
				<h2>酬劳</h2>
			</div>
		</div>

		<div class="template row">
			<div class="col-sm-8 col-xs-8 text-limit">
				<a class="title" style="font-size: medium" href="user/message.jsp"></a>
			</div>
			<div class="col-sm-2 col-xs-4 text-center time"
				style="font-size: medium"></div>
			<div class="col-sm-2 hidden-xs text-center money" style="color: red;">
				<h2></h2>
			</div>
			<hr align=center width=1300 color=#DDDDDD size=1>
		</div>

		<div class="row p">
			<div class="col-sm-12">
				<br />
				<button id="loadmore" type="button"
					class="btn btn-default btn-lg btn-block" onclick="getTask()">更多...</button>
			</div>
		</div>
	</div>


	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>