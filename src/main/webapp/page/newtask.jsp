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
    <script type="text/javascript">
    function getAllTheme(){
    		$.ajax({
    			url : "User/getAllTheme",
    			type : "POST",
    			async : "true",
    			dataType : "json",
    			success : function(data) {
    				$("#theme").append($("<option value=''>未选择</option>"));
    			    $.each(data, function(index, Item) {
    				$("#theme").append($("<option value='"+Item.typename+"'>"+Item.typename+"</option>"));
    				});		 
    			}
    		});
    	}
    $(function () {
		getAllTheme();
	})
    </script>
    </head>
    <body>
  
  		<!--这个是主体部分-->
  		<div class="container" style="height: 520px; padding-top: 30px;">
		<div class="row">
			<div class="col-sm-offset-3 col-sm-6 text-center">
				<h1>发布任务</h1>
			</div>
		</div>
		<form action="Business/addTask"  method="post" class="form-horizontal col-sm-offset-3"  id="sendform" style="font-size: medium;">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="sender">标题：</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" " name="taskTopic" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="realname">酬劳：</label>
				<div class="col-sm-6">
					<input type="text" class="form-control"  name="money" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="realname">任务类别：</label>
				<div class="col-sm-6">
					<select class="form-control" id="theme">
								<option>未选择</option>
								<option>平面设计</option>
								<option>网站开发</option>
								<option> 跑腿任务</option>
							</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="realname">任务天数：</label>
				<div class="col-sm-6">
					<input type="date" class="form-control"  name="deadLine" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="sminfo">内容：</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="8" name="taskinfo"></textarea>
				</div>
			</div>
			<div class="form-group has-error">
				<div class="col-sm-offset-2 col-sm-6 col-xs-6 ">
					<span class="text-warning"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-6 col-xs-12">
					<button type="submit" class="btn btn-success btn-block" >发布</button>
				</div>
			</div>
		</form>
	</div>

	
 	</body>
</html>