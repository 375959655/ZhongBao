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
	<title>众包后台登陆</title>
	<link  rel="stylesheet" type="text/css" href="css/login.css">
<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/popper.min.js" ></script>
	<script src="js/bootstrap.js" ></script>
	<script src="page/pagetool.js" ></script>
	<script src="bootstrapvalidator/js/bootstrapValidator.min.js" type="text/javascript"></script></head>
<body background="image/bbbba.jpg">

    <div id="login">
        <div style="font-size: 60px; color: #706E70;">众包管理系统管理员登陆</div>
    </div>
    <div id="login">
        <form method="POST">
            <div id="name">
	                       用户名:<input type="text" id="nametext" name="loginname"/><br/>
            </div>
            <div id="password" style="float: left">
	                        密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" id="passwordtext" name="password"/><br/>
            </div>
            <div id="warning" style="float: left">
                <input type="text" id="warningtext" name="warning">
            </div>
            <div>
            <button onclick="login()" type="button">登&nbsp;&nbsp;&nbsp;陆</button>
               <a href="#"><input type="button"  id="findpassword" value="忘记密码"></a>
            </div>
        </form>
    </div>
    <script type="text/javascript">
    function login(){
    	var admname = $("input[name='loginname']").val();
		var pwd = $("input[name='password']").val();
    	console.log(admname+"//"+pwd);
    	$.ajax({
        	url:"Admin/adminLogin",
        	type:"post",
    		async:"true",
    		data:{
    			name:admname,
    			password:pwd
    		},
    		dataType:"json",
    		success:function(data){
    			console.log("返回结果"+data);
    			if(data.result==1){
    				alert("登录成功");
    				window.location.replace("Admin/main");
    			}else{
    				alert("您的账号或密码不正确，请重新输入!");
    			}
    		},
    		error:function(){
    			alert("请求失败!");
    		}
        });	
    }
    </script>
</body>
</html>