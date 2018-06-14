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
	<script src="js/jquery-2.2.4.min.js"></script>
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
 String id = request.getParameter("typeid");
%>
<script type="text/javascript">

var typeid = <%=id%>;
function updateType(){
var typename=$("input[name='name']").val();


$.ajax({
	url:"Admin/updateType",
	type:"POST",
	async : "true",
	dataType:"json",
	data:{
		"typeId":typeid,
		"typeName":typename,
		
	},
	success:function(data){
		
			if(data.res==1){
			alert("修改成功");
			window.location.replace("Admin/type");
			}else{
				alert("修改失败");
			}		
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
				<p>修改类别</p>

				<div align="center">
					<form action="" method="post"
						name="form1" onSubmit="return check11()">
						<table id="table2" class="line_table"
							style="width: 100%; margin: 0; padding: 0" cellSpacing="0"
							cellPadding="0">
							
							<tr>
								<td class="line_table" height="25" align="right" width="40%"><span
									class="left_bt2">类别：</span></td>
								<td class="line_table" height="25" width="60%"><input
									type="text" name="name" size="45"/>
									
							</tr>

							<tr>
								<td class="line_table" height="25" align="center" colspan="2">
									<input type="button" value="修改" onclick="updateType();"/>
								</td>
							</tr>
						</table>
					</form>
				</div>

			</td>
		</tr>
	</table>
</body>
</html>
