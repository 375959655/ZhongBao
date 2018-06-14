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
	<script type="text/javascript" src="bootstrapvalidator/js/bootstrapValidator.js"></script>
	<link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/userMain.css" type="text/css"> 
    <link rel="stylesheet" href="bootstrapvalidator/css/bootstrapValidator.min.css">
    </head>
    <body>
    	<jsp:include page="top.jsp"></jsp:include>
  
  		<!--这个是主体部分-->
  			<div class="py-5" >
    <div class="container" style="height: 510px;">
      <div class="row" style="padding-top: 75px;">
        <div class="align-self-center col-md-3 text-white"></div>
        <div class="col-md-6" id="book">
          <div class="card">
            <div class="card-body p-5">
              <h3 class="pb-3">修改密码</h3>
            	<form action="#" method="post" class="updPwd">
                <div class="form-group"> <label>旧密码:</label>
                  <input type="password" class="form-control" placeholder="请输入旧密码" name="oldpassword"> </div>
                <div class="form-group"> <label>新密码:</label>
                  <input type="password" class="form-control" placeholder="请输入新密码" name="newpassword"> </div>
                <button type="button" class="btn mt-2 btn-outline-dark" onclick="updPwd()">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	
	<!--这是尾部，可单独拿出来-->
	
	<jsp:include page="bottom.jsp"></jsp:include>
	<script type="text/javascript">
	$(function(){
		 validateForm();
	});
    function validateForm(){
        // 验证表单
        $(".updPwd").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {/*验证*/
	                oldpassword: {/*键名username和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '密码不能为空'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '密码不合法, 请重新输入'
                        },
                        stringLength: {/*长度提示*/
                            min: 6,
                            max: 16,
                            message: '密码长度必须在6到16之间'
                        }/*最后一个没有逗号*/
                    }
                },
                newpassword: {
                    message:'密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '密码不合法, 请重新输入'
                        },
                        stringLength: {
                            min: 6,
                            max: 16,
                            message: '密码长度必须在6到16之间'
                        }
                    }
                }
            }
        });
    }
    //更改密码
    function updPwd(){
		var newp = $("input[name='newpassword']").val();
		$.ajax({
			type:'post',
			url:"User/updpwd",
			async:true,
			data:{
			    newpassword:newp
			},
			success:function (data) {
				var res = JSON.parse(data);
				console.log(data+"//"+res);
				if(res.result==1){
				    alert("更改密码成功！系统将在退出后重新打开");
				    window.location.replace("User/login");
				}else {
					console.log("修改密码失败!");
				}
            },
			error:function () {
				console.log("请求失败");
            }
		});
    }
	</script>
 	</body>
</html>