<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE html>
<html>
<head>
<title>卓越众包后台管理</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<frameset rows="65,*" frameborder="NO" border="0" framespacing="0" >
	<frame src="Admin/admin_top" name="leftFrame" noresize="noresize"
			marginwidth="0" marginheight="0" frameborder="0" scrolling="no"
		target="main" style="background: #EEF2FB;"/>
	<frameset cols="200,*" rows="560,*" id="frame">
		<frame src="Admin/admin_left" name="leftFrame" noresize="noresize"
			marginwidth="0" marginheight="0" frameborder="0" scrolling="no"
			target="main" style="background: #EEF2FB;" />
		<frame src="Admin/task" name="main" marginwidth="0" marginheight="0"
			frameborder="0" scrolling="auto" target="_self" style="background: #EEF2FB;"/>
	</frameset>
	<noframes>
		<body ></body>
	</noframes>
</html>
