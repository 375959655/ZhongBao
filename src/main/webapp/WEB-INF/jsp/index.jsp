<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="css/userMain.css" type="text/css">
<title>Insert title here</title>
<script type="text/javascript">
	var pageIndex1 = 1;
	var pageIndex2 = 1;
	var pageIndex3 = 1;
	var pageSize = 5;
	var theme = "";

	function init() {
		theme = $("#theme").val();
		pageIndex1 = 1;
		pageIndex2 = 1;
		pageIndex3 = 1;
		
	}

	function getAllTheme() {
		$.ajax({
			url : "User/getAllTheme",
			type : "POST",
			async : "true",
			data : {
				"theme" : theme
			},
			dataType : "json",
			success : function(data) {
				$("#theme").append($("<option value=''>未选择</option>"));
				$.each(data, function(index, Item) {
					$("#theme").append(
							$("<option value='"+Item.typename+"'>"
									+ Item.typename + "</option>"));
				});
			}
		});
	}

	function getAllTask() {
		$(".msglist").html("");
		$("#loadmore").show();
		$.ajax({
			url : "Task/getAllTask",
			type : "POST",
			data : {
				pageIndex : pageIndex1,
				pageSize : pageSize,
				"theme" : theme
			},
			dataType : "json",
			success : function(data) {
				// 遍历数组内容
				if (data.res == 1) {
					//$(".msglist").html("");
					$.each(data.data, function(index, msgItem) {

						var msg = $(".template").clone();
						msg.show();
						msg.removeClass("template");
						msg.find(".msgtitle").text(msgItem.taskname);
						msg.find(".msgtitle").attr("href",
								"Task/work?taskid=" + msgItem.taskid);
						$(".msglist").append(msg);
					});
					pageIndex1++;
					$("#loadmore").html("加载更多！");
				} else {
					
				}
			}
		});
	}
	$(function() {
		getAllTask();
		getAllTheme();
	})
	function getMoneyTask() {
		$(".msglist").html("");
		$("#loadmore").hide();
		$.ajax({
			url : "Task/getMoneyTask",
			type : "POST",
			data : {
				pageIndex : pageIndex2,
				pageSize : pageSize,
				"theme" : theme
			},
			dataType : "json",
			success : function(data) {
				// 遍历数组内容
				if (data.res == 1) {
					$(".msglist").html("");
					$.each(data.data, function(index, msgItem) {

						var msg = $(".template").clone();
						msg.show();
						msg.removeClass("template");

						msg.find(".msgtitle").text(msgItem.taskname);
						msg.find(".msgtitle").attr("href",
								"Task/work?taskid=" + msgItem.taskid);
						$(".msglist").append(msg);
					});
					pageIndex2++;
				} else {
					
				}
			}
		});
	}

	function getNewTask() {
		$(".msglist").html("");
		$("#loadmore").hide();
		$.ajax({
			url : "Task/getNewTask",
			type : "POST",
			data : {
				pageIndex : pageIndex3,
				pageSize : pageSize,
				"theme" : theme
			},
			dataType : "json",
			success : function(data) {
				// 遍历数组内容
				if (data.res == 1) {
					$(".msglist").html("");
					$.each(data.data, function(index, msgItem) {

						var msg = $(".template").clone();
						msg.show();
						msg.removeClass("template");

						msg.find(".msgtitle").text(msgItem.taskname);
						msg.find(".msgtitle").attr("href",
								"Task/work?taskid=" + msgItem.taskid);

						$(".msglist").append(msg);
					});
					pageIndex++;
				} else {
					$("#loadmore").html("已是最新！");
				}
			}
		});
	}
</script>
<body>
	<jsp:include page="user/top.jsp"></jsp:include>

	<!--bodyé¨å-->
	<div class="py-5 text-center "
		style="background-image: url(image/background1.jpg); height: 500px; margin-top: 0px;">
		<div class="container py-5">
			<div class="row">
				<div class="col-md-12 text-white">
					<h1 class="display-3 mb-4">众包平台</h1>
					<p class="lead mb-5" style="font-size: large;">
						Crowdsourcing<br />To all those who love freelancing <br>An
						innovative crowdsourcing platform and a light social platform
						based on tasks
					</p>
					<form class="form-inline m-0" action="User/fadeworklist"
						style="padding-right: 400px;" id="form1">
						<input class="form-control mr-3" type="text" placeholder="问题搜索">
						<button class="btn btn-lg btn-outline-light mx-1" name="msg"
							type="submit">Search</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-4 column">
				<h2 style="color: #FFC107;">平面设计</h2>
				<p>
					平面设计的常见用途包括标识（商标和品牌）、出版物（杂志，报纸和书籍）、平面广告，海报，广告牌，网站图形元素、标志和产品包装。</p>
				<p>
					<a class="btn" href="Task/tasklist?typeid=1">更多»</a>
				</p>
			</div>
			<div class="col-md-4 column">
				<h2 style="color: #FFC107;">网站开发</h2>
				<p>
					网站开发是制作一些专业性强的网页，网站开发字面意思比制作有更深层次的进步，它不仅仅是网站美工和内容，它可能涉及到域名注册查询、网站的一些功能的开发。
				</p>
				<p>
					<a class="btn" href="Task/tasklist?typeid=2">更多»</a>
				</p>
			</div>
			<div class="col-md-4 column">
				<h2 style="color: #FFC107;">跑腿兼职</h2>
				<p>
					兼职是指在不脱离本职工作的情况下，利用业余时间从事的第二职业。工作时间有很大的自由性。兼职也是为第三方提供体力或脑力劳动支出，是一种利益关系
				</p>
				<p>
					<a class="btn" href="Task/tasklist?typeid=3">更多»</a>
				</p>
			</div>
		</div>
	</div>
	<br />

	<div class="container" style="background-color: #FFE8A1">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-11 row">
					<ul class="nav nav-tabs " style="font-size: medium;">
						<li class="active"><input type="button"
							style="width: 80px; background: snow; font-size: medium; border-radius: 10px;"
							onclick="getAllTask()" value="全部任务"></li>
						<li><input type="button"
							style="width: 80px; background: snow; font-size: medium; border-radius: 10px;"
							onclick="getNewTask()" value="最新任务"></li>
						<li><input type="button"
							style="width: 80px; background: snow; font-size: medium; border-radius: 10px;"
							onclick="getMoneyTask()" value="多金任务 "></li>
					</ul>
				</div>
				<div class="col-md-1 row">
					<button type="button" class="btn " data-toggle="modal"
						data-target="#search"
						style="width: 80px; background: snow; font-size: medium; border-radius: 10px;">筛选</button>
				</div>
			</div>
		</div>
		<ul>
			<li class="template list-group-item "
				style="display: none; list-style: none"><a
				class="msgtitle text-limit" href=""></a></li>
		</ul>
		<ul class="list-group msglist" style="font-size: medium;">


		</ul>
		<button id="loadmore" type="button"
			class="btn btn-default btn-lg btn-block" onclick="getAllTask();">没有更多了...</button>

	</div>

	<div class="modal fade" id="search" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modalcenter">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" data-toggle="modal" data-target="#search">&times;</button>

				</div>
				<div class="modal-body">
					<form role="form">
						<div class="form-group">
							<label for="theme">主题</label> <select class="form-control"
								id="theme">
							</select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="init()">搜索</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	<jsp:include page="user/bottom.jsp"></jsp:include>
</body>
</html>