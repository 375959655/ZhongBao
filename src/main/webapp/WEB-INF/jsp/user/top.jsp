<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卓越众包</title>
</head>
<body>
	 <nav class="navbar navbar-fixed-top navbar-expand-md bg-dark navbar-dark"style="font-size: medium;">
    <div class="container">
      <a class="navbar-brand" href="#" style="font-size: x-large;">众包平台</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="User/index">首页</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="User/mymsg">站内信</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">关于我们</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="javascript:logout()">退出</a>
          </li>
        </ul>
        <form class="form-inline m-0">
        	<div class="btn-group" id = "us">
	            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="font-size: medium;" value="用户">${sessionScope.user.realname }</button>
	            <div class="dropdown-menu" style="font-size: medium;">
	              <a class="dropdown-item" href="User/center">个人中心</a>
	              <a class="dropdown-item" href="User/myworks">我的任务</a>
	              <a class="dropdown-item" href="User/allasset">所赚金额</a>
	              <a class="dropdown-item" href="User/changepwd">修改密码</a>
	            </div>
             </div>
            <div class="btn-group" id="business">
            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="font-size: medium;" value="商家"> ${business}</button>
            <div class="dropdown-menu" style="font-size: medium;">
              <a class="dropdown-item" href="Business/newTask">发布任务</a>
              <a class="dropdown-item" href="Business/bussTasks">我的任务</a>
              <a class="dropdown-item" href="Business/myEvaluate">我的评价</a>
              <a class="dropdown-item" href="Business/bussChangePwd">修改密码</a>
            </div>
          </div>
          
           <a class="button" href="User/login" style="margin-left: 180px;" id="login">登录 </a>
   		   <a class="button" href="User/register" style="margin-left: 20px;" id="regis">注册 </a>
        </form>
      </div>
    </div>
  </nav>
<script type="text/javascript">
$(function(){
	var u = "${sessionScope.user}";
	var b = "${sessionScope.business}";
	console.log(u+"//"+b);
	if(""==u){
		if(""==b){
			$('#us').hide();
			$('#business').hide();
			$('#login').show();
			$('#regis').show();
		}else{
			$('#us').hide();
			$('#business').show();
			$('#login').hide();
			$('#regis').hide();
		}
	}else{
		$('#us').show();
		$('#business').hide();
		$('#login').hide();
		$('#regis').hide();
	}
});
function logout(){
	$.ajax({
		type:"post",
		url:"User/logout",
		async:false,
		success:function(data){
			var res = JSON.parse(data);
			console.log(res);
			if(res.result==1){
				alert("您已退出");
				window.location.replace("User/index");
			}
		},
		error:function(){
			console.log("请求失败");
		}
	});
}
</script>
</body>
</html>