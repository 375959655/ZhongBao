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
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<link href="css/site.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="page/pagetool.js" type="text/javascript"></script>
<script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <script type="text/javascript">
 	var curPage = 1;
 	$(function(){
		getTask(curPage);
 	})
 	function getTask(curPage){
 		 $.ajax({
 			url : "Admin/taskList", 	// 请求地址
 			type : "POST",		
 			async : "false",	
 			data : {"curPage" : curPage}, 	
 			dataType: 'json',
 			success : function(data) {
 				setPage(curPage, data.totalPage, "getTask");
 				setMsg(data);
 			}
 		}); 
 		$("#taskList").empty(); 
 	}
 	function setMsg(data){
 		$.each(data.data,function(a,b){
				var msg=$(".template").clone();
				msg.attr("display","block");
				msg.removeClass("template"); 
			    msg.find("#title").text(b.taskname);
			 	msg.find("#taskcontents").text(b.taskcontents);
			 	msg.find("#createtime").text(formatDate(new Date(b.createtime)));
				msg.find("#endtime").text('2018-6-30');
			    msg.find("#typeid").text(b.typename);
			    msg.find("#userid").text(b.userid);
			    msg.find("#bussinessid").text(b.bussinessname);
				msg.find("#evaluate").text(b.evaluate);
			 	msg.find("#taskmoney").text(b.taskmoney+"元");
				if(b.state==-1){
					msg.find("#delete").text("恢复");
		   		 }else{
		    	 	msg.find("#delete").text("删除");
		   		 }
				msg.find("#delete").click(function() {deleteTask(b.taskid)});
				$("#taskList").append(msg); 
			})
 	}
 	function deleteTask(taskid){
 		 $.ajax({
  			url : "Admin/deleteTask", 	// 请求地址
  			type : "POST",		
  			async : "true",	
  			data : {"curPage" : curPage,
  					"taskid" : taskid}, 	
  			dataType: 'json',
  			success : function(data) {
  				getTask(curPage);
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
	<table width="100%" height="1" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td valign="top" bgcolor="#F7F8F9">
				<div align="center">
					<table id="table2" class="line_table"
						style="width: 100%; margin: 0; padding: 0" cellSpacing="0"
						cellPadding="0">
						<thead style="margin: 0; padding: 0">
							<tr>
								<td class="line_table" align="center" colspan="11" height="20"><span
									class="left_bt2">任务信息列表</span></td>
							</tr>
							<tr>
								<td class="line_table" align="center"><span
									class="left_bt2">任务标题</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">内容</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">开始时间</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">结束时间</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">类型</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">发布者</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">接受者</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">成果</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">酬劳</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">&nbsp;</span></td>
							</tr>
						</thead>
						
							<tbody id="taskList">
							
							</tbody>
								
								<tr class="template">
									<td class="line_table" align="center"> 
									<a href="menus_update.jsp?" id="title"></a></td>
									<td class="line_table" align="center">
									<span class="left_txt" id="taskcontents"></span> </td>
									<td class="line_table" align="center">
									<span class="left_txt" id="createtime"></span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id="endtime"></span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id="typeid"></span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id="bussinessid"></span> </td>
									<td class="line_table" align="center">
									<span class="left_txt" id="userid" ></span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id="evaluate"></span> </td>
									<td class="line_table" align="center">
									<span class="left_txt" id="taskmoney"></span></td>
									<td class="line_table" align="center">
									<button id="delete" onclick="deleteTask()">删除</button></td>
								</tr>
													
							<tr>
								<td class="line_table" align="center" colspan="12" height="20">
									 <span class="left_bt2">
									 	<jsp:include page="/page/pagetool.jsp"></jsp:include>
						        	</span>
								</td>
							</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
