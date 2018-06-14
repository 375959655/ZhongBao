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
	<script src="bootstrapvalidator/js/bootstrapValidator.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/userMain.css" type="text/css"> 
    <link rel = "stylesheet" href = "bootstarpvalidator/css/bootstrapValidator.min.css">
    </head>
    <body>
    	<jsp:include page="user/top.jsp"></jsp:include>
  
  		<!--这个是主体部分-->
  			<div class="py-5" >
    <div class="container" style="height: 510px;">
      <div class="row" style="padding-top: 75px;">
        <div class="align-self-center col-md-3 text-white"></div>
        <div class="col-md-6" id="book">
          <div class="card">
            <div class="card-body p-5">
              <h3 class="pb-3">登录(Login)</h3>
            	<form action="#" method="post" class = "login-form">
                <div class="form-group"> <label>用户名:</label>
                  <input class="form-control" placeholder="请输入用户名" name="username"> </div>
                <div class="form-group"> <label>密码:</label>
                  <input type="password" class="form-control" placeholder="请输入密码" name="password"> </div>
                  <div class="form-group" style="color:#FFC107">
		          <input type="radio" name="type" value="商家" class = "business"> 我是商家&nbsp;&nbsp;&nbsp;&nbsp;
		          <input type="radio" name="type" value="用户" class = "user" checked> 我是用户
                </div>
                <button type="button" class="btn mt-2 btn-outline-dark" onclick="login()">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	
	<jsp:include page="user/bottom.jsp"></jsp:include>
     <script type="text/javascript">
     //表单验证
     $(function(){	
 		validateForm();
 	});
 	
 	function validateForm(){
 		// 验证表单
 		$(".login-form").bootstrapValidator({
 		 	message: 'This value is not valid',
             feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                 valid: 'glyphicon glyphicon-ok',
                 invalid: 'glyphicon glyphicon-remove',
                 validating: 'glyphicon glyphicon-refresh'
             },
             fields: {/*验证*/
                 username: {/*键名username和input name值对应*/
                     message: 'The username is not valid',
                     validators: {
                         notEmpty: {/*非空提示*/
                             message: '用户名不能为空'
                         },
                         regexp: {
                         	regexp: /^[a-zA-Z0-9_\.]+$/,
                         	message: '用户名不合法, 请重新输入'
                         },
                         stringLength: {/*长度提示*/
                             min: 6,
                             max: 16,
                             message: '用户名长度必须在6到16之间'
                         }/*最后一个没有逗号*/
                         
                     }
                 },
                 password: {
                 message:'密码无效',
                 validators: {
                     notEmpty: {
                         message: '密码不能为空'
                     },
                     regexp: {
                         regexp: /^[a-zA-Z0-9_\.]+$/,
                         message: '密码不合法, 请重新输入'
                     },
                     stringLength: {
                         min: 6,
                         max: 16,
                         message: '密码长度必须在6到16之间'
                     }
                 }
             }
             }
         });
 	}
 	
	//登录PS:用户
	    function login(){
		    var URL = "User/userlogin";
		    //判断登录用户还是商家
		    var u = "商家";
		    var g = $('input:radio:checked').val();
		    if(u==g){
		    	URL = "Business/Login";
		    }
		    console.log(URL);
	    	var name = $("input[name='username']").val();
			var pwd = $("input[name='password']").val();
			console.log("获取的账号密码:"+name+"和"+pwd);
	    	$.ajax({
	    	    url:URL,
	    		type:"post",
	    		async:"true",
	    		data:{
	    			username:name,
	    			password:pwd
	    		},
	    		dataType:"json",
	    		success:function(data){
	    			console.log("返回结果"+data);
	    			if(data.result==1){
	    				alert("登录成功");
	    				window.location.replace("User/index");
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