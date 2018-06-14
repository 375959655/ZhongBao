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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	var curPage = 1;
	$(function(){
		getList(curPage);
	})
	
	
	function getList(curPage) {
		$.ajax({
			url : "Admin/getUser",
			type : "POST",
			dataType : "json",
			data : {"curPage" : curPage},
			success : function(data){
				setPage(curPage, data.totalPage, "getList");
 				$.each(data.data,function(a,b){
   					var msg=$(".template").clone();
   					msg.attr("display","block");
   					msg.removeClass("template");
   					msg.find("#userid").text(b.userid);
   					msg.find("#username").text(b.username);
   					msg.find("#realname").text(b.realname);
   					msg.find("#sex").text(b.sex);
   					msg.find("#age").text(b.age);
   					msg.find("#tel").text(b.tel);
   					msg.find("#level").text(b.level);
   					if(b.state==-1){
   						msg.find("#delete").text("恢复");
   			   		 }else{
   			    	 	msg.find("#delete").text("删除");
   			   		 }
   					msg.find("#delete").attr("onclick","deleteUser("+b.userid+")");
   					$("#taskList").append(msg);
 				});
			}
		});
 		$("#taskList").empty(); 
	}
	
	function deleteUser(userid){
		 $.ajax({
	  			url : "Admin/deleteUser", 	// 请求地址
	  			type : "POST",		
	  			async : "false",	
	  			data : {"userid" : userid}, 	
	  			dataType: 'json',
	  			success : function(data) {
	  				getList(curPage);
	  			}
	  		}); 
	}
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
						<tbody style="margin: 0; padding: 0">
							<tr>
								<td class="line_table" align="center" colspan="11" height="20"><span
									class="left_bt2">用户信息列表</span></td>
							</tr>
							<tr>
								<td class="line_table" align="center"><span
									class="left_bt2">用户id</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">用户名</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">真实姓名</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">性别</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">年龄</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">电话</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">信誉积分</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">&nbsp;</span></td>
							</tr>
							
							<tbody id="taskList">
								
							</tbody>
						
								<tr class="template">
									<td class="line_table" align="center">
									<span class="left_txt" id = "userid"> hhh</span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id = "username"> anqianqi</span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id = "realname"> realname</span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id = "sex"> 女</span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id = "age"> 18</span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id = "tel">13444</span></td>
									<td class="line_table" align="center">
									<span class="left_txt" id = "level"> 100</span></td>
									<td class="line_table" align="center">
									<button id="delete" onclick="deleteUser()">删除</button></td>
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
