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
		<script src="js/jquery-2.2.4.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<script type="text/javascript">
	$(function(){
		getAllType();
	});
	
	function getAllType(){
		$.ajax({
			url:"Admin/getAllType",
			type:"POST",
			dataType:"json",
			success:function(data){
				$(".template").hide();
				$.each(data.list, function(index, re){
					var tr = $(".template").clone();
					tr.show();
					tr.removeClass("template");
					tr.find(".typeid").text(re.typeid);
					tr.find(".typename").text(re.typename);
					tr.find(".update").attr("href", "Admin/type_update?typeid="+re.typeid);
					tr.find(".delete").attr("href", "Admin/deleteType?typeid="+re.typeid);
					$(".itemlist").append(tr);
				})
				
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
						<tbody style="margin: 0; padding: 0" class="itemlist">
							<tr>
								<td class="line_table" align="center" colspan="8" height="20">
									<span class="left_bt2">类别信息列表</span>
								</td>
							</tr>
							<tr >
								<td class="line_table" align="center" width="30%"><span
									class="left_bt2">类别ID</span></td>
								<td class="line_table" align="center" width="30%"><span
									class="left_bt2">类别名称</span></td>
								<td class="line_table" align="center" width="20%"></td>
								<td class="line_table" align="center" width="20%"></td>
							</tr>
						
						
							
							<tr class="template" >
								<td class="line_table " align="center" width="30%"><span
									class="left_txt typeid"></span></td>
								<td class="line_table " align="center" width="30%"><span
									class="left_txt typename"></span></td>
								<td class="line_table" align="center" width="20%"><a
									href="Admin/update" target="main" class="update">修改</a></td>
								<td class="line_table" align="center" width="20%"><a
									href="#" target="main" class="delete">删除</a></td>
							</tr>
							
							
					</table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
