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
    </head>
    <body>
    	<jsp:include page="top.jsp"></jsp:include>
  
  		<!--这个是主体部分-->
  	<div class="py-5" >
    <div class="container" style="height: 510px;">
      <div class="row">
        <div class="align-self-center col-md-3 text-white"></div>
        <div class="col-md-6" id="book">
          <div class="card">
            <div class="card-body p-5">
              <h3 class="pb-3">个人中心</h3>
            	<form method="post">
                <div class="form-group"> <label>用户名:</label>
                  <input class="form-control" placeholder="${sessionScope.user.username }" name="username"> </div>
                <div class="form-group"> <label>真实姓名:</label>
                  <input class="form-control" placeholder="${sessionScope.user.realname }" name="realname"> </div>
                <div class="form-group"> <label>性别:</label>&nbsp;&nbsp;&nbsp;&nbsp;
		          <input type="radio" name="sex" value="男" checked> 男
		          <input type="radio" name="sex" value="女" class = "women"> 女
                </div>
                <div class="form-group"> <label>年龄:</label>
                  <input type="text" class="form-control" name="age" placeholder = "${sessionScope.user.age }"> </div>
                <div class="form-group"> <label>TEL:</label>
                  <input class="form-control" name="tel" placeholder = "${sessionScope.user.tel }"> </div>
                  <div class="form-group"> <label>信誉积分:</label>
                  <input type="text" class="form-control" name="level" readonly="readonly" value = "${sessionScope.user.level }"></div>
                <button type="button" class="btn mt-2 btn-outline-dark" onclick="updateInfo()" >提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	
	<jsp:include page="bottom.jsp"></jsp:include>
	<script type="text/javascript">
	$(function(){
		showInfo();
	});
	//显示男女
	function showInfo(){
		var sex = "${sessionScope.user.sex}";
		var compare = "女";
		if(sex == compare){
			$('.women').checked = true;
		}
	}
	//判断商家还是用户
	var URL;
	var val = "${sessionScope.user}";
	if(null!=val){
		URL = "User/updUser";
	}else{
		URL = "Business/updBus"
	}
	function updateInfo(){
		$.ajax({
			type:"post",
			url:URL,
			async:true,
			data:{
				username:$("input[name='username']").val(),
		        realname:$("input[name='realname']").val(),
		        sex:$('input:radio:checked').val(),
		        age:$("input[name = 'age']").val(),
		        tel:$("input[name = 'tel']").val()
			},
			success:function(data){
				var res = JSON.parse(data);
				if(res.result == 1){
					alert("更新个人信息成功！");
				}else{
					console.log("更新个人信息失败");
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