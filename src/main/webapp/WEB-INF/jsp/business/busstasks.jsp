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
    	var businessId = ${sessionScope.businessId}; 
    	var index = 1;
    	$(function(){
    		addMsg();
    	})
    	function addMsg(){
    		var pageNum = index++;
    		 $.ajax({
    			url : "Business/bussTask", 	// 请求地址
    			type : "POST",		
    			async : "false",	
    			data : {"pageNum" : pageNum,
    					"businessId" : businessId}, 	
    			dataType: 'json',
    			success : function(d) {
    				if(d=="empty"){
    					alert("已经加载到最后了！！");
    				}else{
    					$.each(d,function(a,b){
        					var msg=$(".template").clone();
        					msg.attr("display","block");
        					msg.removeClass("template"); 
        				    msg.find(".title").text(b.taskname);
        				    msg.find(".title").attr("href","Business/bussWork?taskid="+b.taskid);
        				    msg.find(".time").text(formatDate(new Date(b.createtime)));
        				    msg.find(".taskmoney").text(b.taskmoney+"元");
        				    if(b.state==0){
        				    	 msg.find(".state").text("进行中");
        				    }else if(b.state==1){
        				    	 msg.find(".state").text("审核中");
        				    }
        				    else if(b.state==2){
       				    	 msg.find(".state").text("已完成");
       				       } else if(b.state==-1){
       				    	 msg.find(".state").text("已删除");
       				       }
       				       else {
      				    	 msg.find(".state").text("未通过");
       				       }
        					$(".busstasks").append(msg);
        				})
    				}
    				
    			}
    			
    		}); 
    	}
    	function formatDate(date) { 
    	    var y = date.getFullYear();  
    	    var m = date.getMonth() + 1;  
    	    m = m < 10 ? '0' + m : m;  
    	    var d = date.getDate();  
    	    d = d < 10 ? ('0' + d) : d;  
    	    var h = date.getHours();
    	    h = h < 10 ? ('0' + h) : h;
    	    var min = date.getMinutes();
    	    min = min < 10 ? ('0' + min) : min;
    	    var s = date.getSeconds();
    	    s = s < 10 ? ('0' + s) : s;
    	    return y + '-' + m + '-' + d + ' '+  h +':' + min + ':' + s;  
    	};  
    </script>
    </head>
    <body>
    	<jsp:include page="../user/top.jsp"></jsp:include>
  
  <!--body部分-->
  	<div class="container" style="padding-top: 20px;height: 800px;">		
		<div class="row">
			<div class="col-sm-12 msgtitle"><h1>我发布的任务</h1></div>
			
		</div>
		<div class="row" style="padding-top:30px">
			<div class="col-sm-4 col-xs-8"><h2>标题</h2></div>
			<div class="col-sm-2 col-xs-4 text-center"><h2>时间</h2></div>
			<div class="col-sm-2 hidden-xs text-center"><h2>酬劳</h2></div>
			<div class="col-sm-2 hidden-xs text-center"><h2>完成情况</h2></div>
			<div class="col-sm-2 hidden-xs text-center"></div>
		</div>
		
		<div class="template row">
				<div class="col-sm-4 col-xs-8 text-limit">
					<a class="title" style="font-size:medium" href="Business/bussWork">标题标题标题标题标题标题</a>
				</div>
				<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">时间</div>
				<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2 class="taskmoney">1000元</h2></div>
				<div class="col-sm-2 hidden-xs text-center"><h4 class="state">完成情况</h4></div>
				<div class="col-sm-2 hidden-xs text-center"></div>
				<hr align=center width=1300 color=#DDDDDD size=1>
		</div>
			
		<div class="busstasks ">
		<!-- 	<div class="row">
				<div class="col-sm-4 col-xs-8 text-limit">
					<a class="title" style="font-size:medium" href="Business/bussWork">【急】谁可以帮我做团队项目呀，重金</a>
				</div>
				<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">2017.09.21</div>
				<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2>1000元</h2></div>
				<div class="col-sm-2 hidden-xs text-center"><h4>已完成</h4></div>
				<div class="col-sm-2 hidden-xs text-center"><button >删除</button></div>
			</div>
			<div class="row">
				<div class="col-sm-4 col-xs-6 text-limit">
					<a class="title" style="font-size:medium" href="Business/bussWork">找人陪吃饭</a>
				</div>
				<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">2017.09.21</div>
				<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2>1元</h2></div>
				<div class="col-sm-2 hidden-xs text-center" ><h4>未完成</h4></div>
				<div class="col-sm-2 hidden-xs text-center"><button >删除</button></div>
			</div> -->
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