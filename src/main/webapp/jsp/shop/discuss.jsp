<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户评论</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body class="index discuss">
	<div class="bgimg"></div>
	<div class="container">
		<div class="header">
			<img class="logo" alt="" src="resources/images/logo.png">
			<div class="sysmenu">
				<a href="index.jsp">首页</a>
				<a href="index.jsp">我的订单</a>
				<a href="index.jsp">加盟合作</a>
				<a href="index.jsp">联系客服</a>
			</div>
			<a class="account" href="account.jsp">
				<img alt="" src="resources/images/accountGray.png">
				<label>心天地</label>
			</a>
		</div>
		<div class="main">
			<h3><span>用户评价</span></h3>
			<div class="view-item">
				<div class="item">
					<img alt="" src="resources/images/Rectangle70px.png">
					<p>浓香四溢，食材新鲜，超级好吃</p>
					<div>
						<span>2018-04-08</span>
						<a><img alt="" src="resources/images/agreeOn.png"><span>(23)</span></a>
						<a><img alt="" src="resources/images/agreeGray.png"><span>(2)</span></a>
					</div>
				</div>
				<div class="item">
					<img alt="" src="resources/images/Rectangle70px.png">
					<p>浓香四溢，食材新鲜，超级好吃</p>
					<div>
						<span>2018-04-08</span>
						<a><img alt="" src="resources/images/agreeOn.png"><span>(23)</span></a>
						<a><img alt="" src="resources/images/agreeGray.png"><span>(2)</span></a>
					</div>
				</div>
			</div>
			<div class="pager">
				<a href="#">上一页</a>
				<a href="#" class="cur">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">下一页</a>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>(c) 版权所有 2017 橙汁 技术支持：橙汁软件</p>
	</div>
	
	<div class="quick">
		<a class="user-profile" href="account.jsp"></a>
		<a class="shop-cart" href="carts.jsp"></a>
		<a class="back-top" href="#"></a>
	</div>
</body>
</html>