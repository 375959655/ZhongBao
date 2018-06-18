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
    </head>
    <body>
    	<jsp:include page="../user/top.jsp"></jsp:include>
  
  <!--body部分-->
  	<div class="container" style="height: 510px;">
			
		<div class="row reply" style="display: block;">
			<h1>我的评价</h1>
		</div>
		<div class="row reply" style="display: block;">
			<div class="col-sm-2 col-xs-2" style="font-size:medium">
				<div class="author" ><a href="User/sendmsg" style="color:#FFC107">condy1</a></div>
				<div class="sex">男</div>
				<div class="lever">打分：5</div>
			</div>
			<div class="col-sm-10 col-xs-10">
				<div class="msgcontent" style="font-size:medium">testtest</div>
			</div>
			<div class="col-sm-12" style="overflow: hidden;">
				<div class="rightinfo time">2018-6-10 16:34:20</div>
			</div>
		</div>
		
		<div class="row p">
			<div class="col-sm-12">
				<br/>
				<button id="loadmore" type="button" class="btn btn-default btn-lg btn-block" 
				onclick="addMsg()">更多...</button>
			</div>
		</div>
	</div>
  		
  		
	<jsp:include page="../user/bottom.jsp"></jsp:include>
 	</body>
</html>