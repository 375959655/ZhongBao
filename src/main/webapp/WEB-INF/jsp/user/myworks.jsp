<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
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
    
	 var index = 1;//"${requestScope.pageNum}";
	var userid = "${requestScope.userid}"; 
     function sethidden(taskid) {
        $("#hidden").val(taskid);
    }; 
    
    function giveup(taskid) {
    	  if(confirm("你确定要放弃这个任务吗？放弃任务可能降低您的信用评价并扣除违约金！"))
    	    {
    		  alert(taskid);
    		  alert("降低信用、删除任务userid，更改任务state");
    	       $.ajax({
    	    	url : "User/giveup", 	// 请求地址
      			type : "POST",		
      			async : "false",	
      			data : {"taskid" : taskid
      					}, 	
      			dataType: 'json'
    	      });  
    	       index=0;
    	       $(".msglist").html("");
    	       addMsg();
    	     }
    	    else
    	    {
    	      alert("您选择了继续任务！！");
    	    }
	};
    	function addMsg(){
    		var pageNum = ++index;
    		 $.ajax({
    			url : "User/myworkload", 	// 请求地址
    			type : "POST",		
    			async : "false",	
    			data : {"pageNum" : pageNum,
    					"userid" : userid}, 	
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
        				    msg.find(".btn1").text("放弃");
        				    msg.find(".btn1").attr("onclick","giveup("+b.taskid+")");
        				    msg.find(".btn2").text("提交");
        				   msg.find(".btn2").attr("onclick","sethidden("+b.taskid+")");
        				    msg.find(".time").text(formatDate(new Date(b.createtime)));
        				    msg.find(".contents").text(b.taskmoney+"元");
        				    if(b.state==0){
        				    	 msg.find(".state").text("进行中");
        				    }else if(b.state==1){
        				    	 msg.find(".state").text("审核中");
        				    }
        				    else if(b.state==2){
       				    	 msg.find(".state").text("已完成");
       				       }else {
      				    	 msg.find(".state").text("未通过");
       				    }
        					$(".msglist").append(msg);
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
    	<jsp:include page="top.jsp"></jsp:include>
  
  <!--body部分-->
  	<div class="container" style="padding-top: 20px;height: 550px;">		
		<div class="row">
			<div class="col-sm-12 msgtitle"><h1>我的任务</h1></div>
			
		</div>
		<div class="row" style="padding-top:30px">
			<div class="col-sm-4 col-xs-8"><h2>标题</h2></div>
			<div class="col-sm-2 col-xs-4 text-center"><h2>时间</h2></div>
			<div class="col-sm-2 hidden-xs text-center"><h2>酬劳</h2></div>
			<div class="col-sm-2 hidden-xs text-center"><h2>完成情况</h2></div>
			<div class="col-sm-2 hidden-xs text-center"><h2>操作</h2></div>
		</div>
		
		<div class="row template">
				<div class="col-sm-4 col-xs-8 text-limit">
					<a class="title" style="font-size:medium" href="Task/work">标题标题标题标题标题标题</a>
				</div>
				<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">时间</div>
				<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2 class="contents">1000元</h2></div>
				<div class="col-sm-2 hidden-xs text-center"><h4 class="state">完成情况</h4></div>
			    <div class="col-md-1 row ">
			    <button type="button" class="btn1 "  
			    style="width: 80px; background: snow; font-size: medium;border-radius: 10px; " >放弃</button>
				</div>
			    	<div class="col-md-1 row " >
					<button type="button" class="btn2" data-toggle="modal" 
							data-target="#upload" style="width: 80px; background: snow; font-size: medium;border-radius: 10px; " >上传</button>
				</div>
				<hr align=center width=1300 color=#DDDDDD size=1>
		</div>
		<div class="msglist">
			<c:forEach items="${requestScope.mywork}" var="item">
				<div class="row">
					<div class="col-sm-4 col-xs-8 text-limit">
						<a class="title" style="font-size:medium" href="Task/mywork?taskid=${item.taskid }">${item.taskname}</a>
					</div>
					<div class="col-sm-2 col-xs-4 text-center time" style="font-size:medium">${item.createtime}</div>
					<div class="col-sm-2 hidden-xs text-center" style="color: red;"><h2>${item.taskmoney}元</h2></div>
					<c:choose>
					   <c:when test="${item.state==0}">  
						    <div class="col-sm-2 hidden-xs text-center"><h4>进行中</h4></div>     
					   </c:when>
					   <c:when test="${item.state==2}">  
						    <div class="col-sm-2 hidden-xs text-center"><h4>审核中</h4></div>     
					   </c:when>
					   <c:when test="${item.state==1}">  
						    <div class="col-sm-2 hidden-xs text-center"><h4>已完成</h4></div>     
					   </c:when>
					   <c:otherwise> 
					   	 <div class="col-sm-2 hidden-xs text-center"><h4>未通过</h4></div>
					   </c:otherwise>
					</c:choose>
					<!--  <div class="col-sm-1 hidden-xs text-center">
			    <a href="javascript:put()" >放弃</a>
			    </div> -->
			<!--     <div class="col-sm-1 hidden-xs text-center">
			    <a href="User/startUpTask">提交</a>
			    
			    </div> -->
			    <div class="col-md-1 row">
			    <button type="button" class="btn1"  onclick=" giveup(${item.taskid });"
			    style="width: 80px; background: snow; font-size: medium;border-radius: 10px; " >放弃</button>
				</div>
			    	<div class="col-md-1 row">
					<button type="button" class="btn2" data-toggle="modal" onclick="sethidden(${item.taskid })"
							data-target="#upload" style="width: 80px; background: snow; font-size: medium;border-radius: 10px; " >上传</button>
				</div>
					<hr align=center width=1300 color=#DDDDDD size=1>
				</div>
			</c:forEach>
		</div>
			
		<div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content modalcenter">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" data-toggle="modal"
							data-target="#upload"></button>
	               
	            </div>
	            <div class="modal-body">
					<form action="User/upload"  role="form" method="post"  enctype="multipart/form-data" >
						<div class="form-group">
							<label for="file">上传文件</label>
							<input type="hidden" id="hidden" value=""  name="hidden">
							<input type="file" name="file" /><input type="submit" value="上传" >
							</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
		
			
		<div class="row p">
			<div class="col-sm-12">
				<br/>
				<button id="loadmore" type="button" class="btn btn-default btn-lg btn-block" 
				onclick="addMsg()">更多...</button>
			</div>
		</div>
	</div>
  		
  		
<jsp:include page="bottom.jsp"></jsp:include>
 	</body>
</html>