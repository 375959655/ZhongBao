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
	</script>
    <body>
    	<jsp:include page="../user/top.jsp"></jsp:include>
  
  		<!--这个是主体部分-->
  			<div class="py-5" >
    <div class="container" style="height: 510px;">
      <div class="row" style="padding-top: 75px;">
        <div class="align-self-center col-md-3 text-white"></div>
        <div class="col-md-6" id="book">
          <div class="card">
            <div class="card-body p-5">
              <h3 class="pb-3">修改密码</h3>
            	<form action="Business/changeBussPwd" method="post">
                <div class="form-group"> <label>旧密码:</label>
                  <input class="form-control" placeholder="请输入旧密码" name="oldpassword"> </div>
                <div class="form-group"> <label>新密码:</label>
                  <input type="text" class="form-control" placeholder="请输入新密码" name="newpassword"> </div>
                <button type="submit" class="btn mt-2 btn-outline-dark" onclick="login()">提&nbsp&nbsp&nbsp&nbsp&nbsp交</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	
	<!--这是尾部，可单独拿出来-->
	
	<jsp:include page="../user/bottom.jsp"></jsp:include>
 	</body>
</html>