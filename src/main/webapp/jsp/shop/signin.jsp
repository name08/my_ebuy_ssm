<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
<title>用户登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
	<script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>
	<script>
        $(document).ready(function () {

            $("#customerLogin_Button").click(function() {
                var status = true;

                var c_usernameVal = $("#c_username").val();

                var c_passwordVal = $("#c_password").val();

                if(c_usernameVal.trim().length==0){
                    status = false;
                    $('#c_usernameError').html("账号不能为空");
                }else {
                    $('#c_usernameError').html("");
                }

                if(c_passwordVal.trim().length==0){
                    status = false;
                    $('#c_passwordError').html("密码不能为空");
                }else {
                    $('#c_passwordError').html("");
                }
                if(status == true) {
                    $.post("<%=basePath%>shop/login",
                        $("#customerLogin").serialize(),
                        function (data) {
                            if (data.status == 1) {
                                location.href = "<%=basePath%>shop/index";
                            } else {
                                alert(data.Message);
                            }
                        }
                    );
                }
            });

        });
	</script>
</head>
<body class="signin">
	<div class="container">
		<img alt="" src="resources/images/logo.png">
		<label class="title">用户登录</label>
		<form id="customerLogin" method="post" class="form">
			<li><input id="c_username" name="c_username" class="phone" type="text" placeholder="请输入您的帐户名"><i id="c_usernameError"></i></li>
			<li><input id="c_password" name="c_password" class="password" type="password" placeholder="请输入您的登录密码"><i id="c_passwordError"></i></li>
			<button id="customerLogin_Button" class="btn" type="button">登录</button>
		</form>
		<div class="ext">
			<a class="signup" href="<%=basePath%>shop/customer/toSignUp">没有账号?立即注册</a>
			<a class="backpass" href="backpass.jsp">忘记密码?</a>
		</div>
	</div>
	<div class="footer">
		<p>(c) 版权所有 2017 橙汁 技术支持：橙汁软件</p>
	</div>
</body>
</html>