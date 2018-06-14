<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="page/pagetool.js"></script>
<script type="text/javascript"
	src="bootstrapvalidator/js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="css/userMain.css" type="text/css">
<link rel="stylesheet"
	href="bootstrapvalidator/css/bootstrapValidator.min.css">
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>

	<!--这个是主体部分-->
	<div class="py-5">
		<div class="container" style="height: 520px;">
			<div class="row">
				<div class="align-self-center col-md-3 text-white"></div>
				<div class="col-md-6" id="book">
					<div class="card">
						<div class="card-body p-5">
							<h3 class="pb-3">注册(Register)</h3>
							<form method="post" class="regis-form">
								<div class="form-group">
									<label>用户名:</label> <input class="form-control"
										placeholder="请输入用户名" name="username">
								</div>
								<div class="form-group">
									<label>密码:</label> <input type="password" class="form-control"
										placeholder="请输入密码" name="password">
								</div>
								<div class="form-group">
									<label>确认密码:</label> <input type="password"
										class="form-control" placeholder="请输入密码" name="repassword">
								</div>
								<div class="form-group">
									<label>真实姓名:</label> <input class="form-control"
										placeholder="请输入真实姓名" name="realname">
								</div>
								<div class="form-group">
									<label>性别:</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
										name="sex" value="男" checked> 男 <input type="radio"
										name="sex" value="女"> 女
								</div>
								<div class="form-group">
									<label>年龄:</label> <input type="text" class="form-control"
										name="age" placeholder="请输入年龄">
								</div>
								<div class="form-group">
									<label>TEL:</label> <input class="form-control"
										placeholder="请输入联系方式" name="tel">
								</div>
								<button type="button" class="btn mt-2 btn-outline-dark"
									onclick="register()">注&nbsp;&nbsp;&nbsp;&nbsp;册</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="bottom.jsp"></jsp:include>
	<script type="text/javascript">
		$(function() {
			validateForm();
		});

		function validateForm() {
			// 验证表单
			$(".regis-form").bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {/*输入框不同状态，显示图片的样式*/
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {/*验证*/
					username : {/*键名username和input name值对应*/
						message : 'The username is not valid',
						validators : {
							notEmpty : {/*非空提示*/
								message : '用户名不能为空'
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_\.]+$/,
								message : '用户名不合法, 请重新输入'
							},
							stringLength : {/*长度提示*/
								min : 6,
								max : 16,
								message : '用户名长度必须在6到16之间'
							}
						/*最后一个没有逗号*/

						}
					},
					password : {
						message : '密码无效',
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_\.]+$/,
								message : '密码不合法, 请重新输入'
							},
							stringLength : {
								min : 6,
								max : 16,
								message : '密码长度必须在6到16之间'
							}
						}
					},
					repassword : {
						message : '密码无效',
						validators : {
							notEmpty: {
	                            message: '确认密码不能为空'
	                        },
	                        identical: {
	                            field: 'password',
	                            message: '两次密码必须一致'
	                        }
						}
					},
					realname: {
	                    message: 'The realname is not valid',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '姓名不能为空'
	                        },
	                        stringLength: {/*长度提示*/
	                            min: 2,
	                            max: 30,
	                            message: '姓名长度必须在2到30之间'
	                        }/*最后一个没有逗号*/

	                    }
	                },
	                age: {
	                    message: 'The realname is not valid',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '年龄不能为空'
	                        }
	                    }
	                },
	                tel: {
	                    message: 'The realname is not valid',
	                    validators: {
	                        notEmpty: {/*非空提示*/
	                            message: '联系方式不能为空'
	                        },
	                        stringLength: {/*长度提示*/
	                            min: 8,
	                            max: 11,
	                            message: '姓名长度必须在8到11之间'
	                        }/*最后一个没有逗号*/
	                    }
	                }
				}
			});
		}
		function register(){
			var name = $("input[name='username']").val();
			var pwd = $("input[name='password']").val();
			var real = $("input[name='realname']").val();
			var s = $('input:radio:checked').val();
			var a = $("input[name='age']").val();
			var t = $("input[name='tel']").val();
			console.log("获取的账号密码:"+name+"和"+pwd);
	    	$.ajax({
	    	    url:"User/regis",
	    		type:"post",
	    		async:"true",
	    		data:{
	    			username:name,
	    			password:pwd,
	    			realname:real,
	    			sex:s,
	    			age:a,
	    			tel:t
	    		},
	    		dataType:"json",
	    		success:function(result){
	    			console.log("返回结果"+result);
	    			if(result.result==1){
	    				alert("注册成功！");
	    				window.location.replace("User/index");
	    			}else{
	    				alert("注册失败");
	    			}
	    		},
	    		error:function(){
	    			alert("请求失败!");
	    		}
	    	});
		}
	</script>
</body>
</html>