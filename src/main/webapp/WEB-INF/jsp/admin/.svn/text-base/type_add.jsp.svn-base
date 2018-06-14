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
<script language="JavaScript">

	 function add(){
	    	var typename = $("input[name='typename']").val();
	    	$.ajax({
	    	    url:"Admin/addType",
	    		type:"post",
	    		async:"true",
	    		data:{
	    			typename:typename,
	    		},
	    		dataType:"json",
	    		success:function(data){
	    			if(data.result==1){
	    				alert("添加成功！");
	    				window.location.replace("Admin/type_add");
	    			}else{
	    				alert("添加失败!");
	    			}
	    		},
	    		error:function(){
	    			alert("请求失败!");
	    		}
	    	});
	    }
</script>

<base href="<%=basePath%>">
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	
	<table width="100%" height="1" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td valign="top" bgcolor="#F7F8F9">
				<p>添加类别</p>

				<div align="center">

					<form  method="post" name="form1">


						<table id="table2" class="line_table"
							style="width: 100%; margin: 0; padding: 0" cellSpacing="0"
							cellPadding="0">

							<tr>
								<td class="line_table" height="25" align="right" width="40%"><span
									class="left_bt2">任务类别：</span></td>
								<td class="line_table" height="25" width="60%"><input
									type="text" name="typename" size="45" value=""></td>
							</tr>

							<tr>
								<td class="line_table" height="25" align="center" colspan="2">
									<input type="button" onclick="add();" value="添加">
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
