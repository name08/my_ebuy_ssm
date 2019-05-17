<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户评论</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
	<script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>
	<script>
	var time=setInterval (showTime, 1000);
	var second=5;
	function showTime()
	{
	if(second==0)
	{
	window.location="<%=basePath%>shop/index";
	clearInterval(time);
	}
	$(".sub-text").html('<center><em>'+second+'</em>s 后自动跳转首页。</center>');
	second--;
	}
	</script>
</head>
<body class="index pdialog">
	<div class="bgimg"></div>
	<div class="container">
		<div class="header">
			<img class="logo" alt="" src="<%=basePath%>/jsp/shop/resources/images/logo.png">
			<div class="sysmenu">
				<a href="<%=basePath%>shop/index">首页</a>
				<a href="<%=basePath%>shop/shopCart/toAccount">我的订单</a>
				<a href="<%=basePath%>shop/index">加盟合作</a>
				<a href="<%=basePath%>shop/index">联系客服</a>
			</div>
			<div class="sysmenu"  style="float: right">
				<c:choose>
					<c:when test="${sessionScope.customer==null}">
						<div class="sysmenu">
							<a href="<%=basePath%>shop/customer/toSignIn">登录</a>
							<a href="<%=basePath%>shop/customer/toSignUp">注册</a>
							<a href="<%=basePath%>shop/shopCart/MyCarts">购物车</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="sysmenu" style="float: right;">${customer.c_nickName}<a href="<%=basePath%>shop/shopCart/MyCarts">购物车</a><a href="<%=basePath%>shop/logout">退出</a></div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<div class="main">
			<div class="result">
				<img alt="" src="<%=basePath%>/jsp/shop/resources/images/succeed .png">
				<h1>支付成功</h1>
				<p><a href="<%=basePath%>shop/shopCart/MyCarts">返回购物车</a><span>|</span><a href="payment.jsp">返回我的订单</a></p>
			</div>
			<div class="sub-text"></div>
		</div>
	</div>
	<div class="footer">
		<p>(c) 版权所有 2017 橙汁 技术支持：橙汁软件</p>
	</div>
	
	<div class="quick">
		<a class="user-profile" href="<%=basePath%>shop/shopCart/toAccount"></a>
		<a class="shop-cart" href="<%=basePath%>shop/shopCart/MyCarts"></a>
		<a class="back-top" href="#"></a>
	</div>
</body>
</html>