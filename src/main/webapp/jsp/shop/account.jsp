<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
	<script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $("a[name='exit']").click(function() {
                window.location.href="<%=basePath%>shop/logout";
            });
        })
    </script>
</head>
<body class="index account">
	<div class="bgimg"></div>
	<div class="container">
		<div class="header">
			<img class="logo" alt="" src="<%=basePath%>/jsp/shop/resources/images/logo.png">
			<div class="sysmenu">
				<a href="<%=basePath%>shop/index">首页</a>
				<a href="<%=basePath%>shop/order/toAccount">我的订单</a>
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
			<div class="menu">
				<a href="account.jsp">购物记录</a>
				<a href="<%=basePath%>shop/customer/toProfile">账户管理</a>
				<a class="exit" id="exit" href="<%=basePath%>shop/logout">安全退出</a>
			</div>
			<div class="page">
				<h3><span>购物记录</span></h3>
				<table>
					<tbody>
                    <c:forEach items="${requestScope.orders.list}" var="order">
						<tr>
							<td><img alt="" src="<%=basePath%>/jsp/shop/resources/images/detail-img01.png"></td>
							<td><div>艇仔粥</div><div>共12份菜</div></td>
							<td><fmt:formatDate value="${order.o_createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>￥34.50</td>
							<td><div><c:choose><c:when test="${order.o_tag==1}">订单已完成</c:when><c:when test="${order.o_tag==2}">订单未支付</c:when><c:otherwise>订单异常</c:otherwise></c:choose></div><a href="#">订单详情</a></td>
						</tr>
                    </c:forEach>
					</tbody>
				</table>
				<img alt="" src="<%=basePath%>/jsp/shop/resources/images/banner02.png">
			</div>
		</div>
	</div>
	<div class="footer">
		<p>(c) 版权所有 2017 橙汁 技术支持：橙汁软件</p>
	</div>
	
	<div class="quick">
		<a class="user-profile" href="<%=basePath%>shop/customer/toProfile"></a>
		<a class="shop-cart" href="<%=basePath%>shop/shopCart/MyCarts"></a>
		<a class="back-top" href="#"></a>
	</div>
</body>
</html>