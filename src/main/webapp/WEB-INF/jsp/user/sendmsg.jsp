<%@page import="com.bysj.zhongbao.pojo.User"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 

<%-- <%
String taskid=request.getParameter("userid");
if(taskid==null||taskid==""){
	taskid="1";
}
%> --%>
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
      <script type="text/javascript">
   
	var time;
	
	 $(function() {
		 getNowFormatDate();
		 time=getNowFormatDate();
		
 	})
function getNowFormatDate() {
	var date = new Date();
	var seperator1 = "-";
	var seperator2 = ":";
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = date.getFullYear() + seperator1 + month + seperator1
			+ strDate + " " + date.getHours() + seperator2
			+ date.getMinutes() + seperator2 + date.getSeconds();
	return currentdate;
}

var bussinessid=1;
var userid=${sessionScope.usernamea.userid};

	function sendMsg() {
		 var textarea=$("#textarea").val();
		
		$.ajax({
			url : "Message/sendMsg",
			type : "POST",
			async : "true",
			data : {
				"textarea" : textarea,
				"userid" : userid,
				"bussinessid" : bussinessid,
				"time" : time
			},
			dataType : "json",
			success : function(data) {
				if (data.res > 0) {
					alert("回复成功");
					window.location.replace();
				} else {
					alert("回复失败");
				}

			}
		});
		return false;
	}  
     
    </script>
    </head>
    <body>
    	<jsp:include page="top.jsp"></jsp:include>
  		<!--这个是主体部分-->
  		<div class="container" style="height: 520px; padding-top: 30px;">
		<div class="row">
			<div class="col-sm-offset-3 col-sm-6 text-center">
				<h1>发送消息</h1>
			</div>
		</div>
		<form class="form-horizontal col-sm-offset-3" id="sendform" style="font-size: medium;">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="sender">发件人：</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" readonly="readonly" name="realname" value=${sessionScope.usernamea.realname}>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="realname">收件人：</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" readonly="readonly" name="sender" value=${sessionScope.business}>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="sminfo">内容：</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="8" name="sminfo" id="textarea"></textarea>
				</div>
			</div>
			<div class="form-group has-error">
				<div class="col-sm-offset-2 col-sm-6 col-xs-6 ">
					<span class="text-warning"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-6 col-xs-12">
					<button class="btn btn-success btn-block" onclick=" return sendMsg();">发送</button>
				</div>
			</div>
		</form>
	</div>

	
	<jsp:include page="bottom.jsp"></jsp:include>
 	</body>
</html>