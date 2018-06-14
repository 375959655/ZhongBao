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
			url : "Admin/getBusiness",
			type : "POST",
			dataType : "json",
			data : {"curPage" : curPage},
			success : function(data){
				setPage(curPage, data.totalPage, "getTask");
 				$.each(data.data,function(a,b){
 					var msg=$(".template").clone();
   					msg.attr("display","block");
   					msg.removeClass("template");
   					msg.find("#businessid").text(b.bussinessid);
   					msg.find("#businessname").text(b.bussinessname);
   					msg.find("#level").text(b.level);
   					$("#taskList").append(msg);
 				});
			}
		});
 				$("#taskList").empty(); 
 	}
</script>
</head>
<body>
	<table width="100%" height="1" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td valign="top" bgcolor="#F7F8F9">
				<div align="center">
					<table id="table2" class="line_table"style="width: 100%; margin: 0; padding: 0" cellSpacing="0" cellPadding="0">
						<tbody style="margin: 0; padding: 0">
							<tr>
								<td class="line_table" align="center" colspan="11" height="20">
								<span class="left_bt2">商家信息列表</span></td>
							</tr>
							<tr >
								<td class="line_table" align="center"><span
									class="left_bt2" >商家id</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2" >商家名</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2" >信誉积分</span></td>
								<td class="line_table" align="center"><span
									class="left_bt2">&nbsp;</span></td>
							</tr>
							<tbody id="taskList">
							
							</tbody>
							<tr class="template">
								<td class="line_table" align="center"> 
								<a href="menus_update.jsp?"id = "businessid">1 </td>
								<td class="line_table" align="center">
								<span class="left_txt"id = "businessname"> hhh</td>
								<td class="line_table" align="center">
								<span class="left_txt"id = "level"> 100</td>
								<td class="line_table" align="center"><button >删除</button></td>
							</tr>
							<tr>
								<td class="line_table" align="center" colspan="12" height="20">
									 <span class="left_bt2">
									 	<jsp:include page="/page/pagetool.jsp"></jsp:include>
						        	</span>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
