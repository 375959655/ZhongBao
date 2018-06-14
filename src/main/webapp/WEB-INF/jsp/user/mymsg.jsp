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
<script src="page/pagetool.js"></script>
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="css/userMain.css" type="text/css">
<script type="text/javascript">
	Date.prototype.Format = function(fmt) { 
		var o = {
			"M+" : this.getMonth() + 1, //月份   
			"d+" : this.getDate(), //日   
			"H+" : this.getHours(), //小时   
			"m+" : this.getMinutes(), //分   
			"s+" : this.getSeconds(), //秒   
			"q+" : Math.floor((this.getMonth() + 3) / 3),
			"S" : this.getMilliseconds()
		//毫秒   
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	}

	var index = 1;
	var num = 5;
	$(function() {
		getSiteMsg();
	})

	function getSiteMsg() {
		$.ajax({
			url : "Message/messageList",
			type : "POST",
			data : {
				
				"index" : index,
				"num" : num
			},
			dataType : "json",
			success : function(data) {
				if (data != null&&data!="") {
					$.each(data, function(index, msgItem) {

						var msg = $(".template").clone();
						msg.attr("style", "display:block");
						msg.removeClass("template");
						msg.find(".sender").text(msgItem.bussinessname);

						msg.find(".sminfo").html(msgItem.msgcontents); 
						msg.find(".sminfo").attr("href", "User/message?msgid="+msgItem.msgid);
						var msgtime = new Date(msgItem.msgtime);
						var time = msgtime.Format("yyyy-MM-dd HH:mm:ss");
						msg.find(".smtime").text(msgItem.msgtime);
						$(".msglist").append(msg);
					});
					index++;
				} else $("#loadmore").text("暂无更多");

			}
		});

	}
</script>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>

	<!--这个是主体部分-->
	<div class="container" style="height: 520px;">
		<div class="row">
			<div class="col-sm-12">
				<h3>
					<div class="col-sm-12 msgtitle">
						<h1>我的消息</h1>
					</div>
				</h3>
			</div>
		</div>
		<div class="row msglist1 "
			style="font-size: medium; padding-top: 10px;">
			<div class="col-sm-2 col-xs-4 text-center sender1">发件人</div>
			<div class="col-sm-8 col-xs-12 text-limit">
				<a class="sminfo1">内容</a>
			</div>
			<div
				class="col-sm-2 col-sm-offset-0 col-xs-offset-6 col-xs-6 text-center smtime1">时间</div>
		</div>
		<div class="msglist"></div>
		<div class="row  template"
			style="font-size: medium; padding-top: 10px;">
			<div class="col-sm-2 col-xs-4 text-center sender"></div>
			<div class="col-sm-8 col-xs-12 text-limit ">
				<a class="sminfo" ></a>
			</div>
			<!-- href="User/message" -->
			<div
				class="col-sm-2 col-sm-offset-0 col-xs-offset-6 col-xs-6 text-center smtime"></div>
		</div>
		<div class="row p">
			<div class="col-sm-12">
				<br />
				<button id="loadmore" type="button"
					class="btn btn-default btn-lg btn-block"
					onclick="javascript:getSiteMsg();">加载更多...</button>
			</div>
		</div>
	</div>



	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>