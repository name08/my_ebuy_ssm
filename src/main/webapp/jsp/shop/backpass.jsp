<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
<title>找回密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body class="signin">
	<div class="container">
		<img alt="" src="resources/images/logo.png">
		<label class="title">找回密码</label>
		<div class="form">
			<input class="phone" type="text" placeholder="请输入您的手机号码">
			<input class="password" type="password" placeholder="请输入新的登录密码">
			<br>
			<input class="captcha" type="text" placeholder="请输入验证码">
			<button class="captcha-btn">发送验证码</button>
			<button class="btn" type="submit">确认找回</button>
		</div>
		<div class="ext">
			<a class="signup" href="signin.jsp">返回登录</a>
		</div>
	</div>
	<div class="footer">
		<p>(c) 版权所有 2017 橙汁 技术支持：橙汁软件</p>
	</div>
</body>
</html>