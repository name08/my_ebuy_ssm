<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})
    $(document).ready(function () {
        $('ul li').css("margin-left","15px");
        $('ul>li>a img').css("margin-bottom","6px");
    })
</script>


</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.html" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <li><a href="<%=basePath%>jsp/admin/admin/adminupdate.jsp" target="rightFrame" class="selected"><img src="images/customer.png" title="个人信息修改" /><h2>个人信息修改</h2></a></li>
        <li><a href="<%=basePath%>jsp/admin/admin/passwordupdate.jsp" target="rightFrame"><img src="images/customer.png" title="个人密码修改" /><h2>个人密码修改</h2></a></li>
    <li><a href="<%=basePath%>/admin/adminmanage/toManageAdmin" target="rightFrame"><img src="images/adminManage.png" title="管理员管理" /><h2>管理员管理</h2></a></li>
        <li><a href="<%=basePath%>admin/product/producttypemanage/productTypemanage"  target="rightFrame"><img src="images/productManage.png" title="产品分类管理" /><h2>产品分类管理</h2></a></li>
    <li><a href="<%=basePath%>/admin/product/productmanage/productManage"  target="rightFrame"><img src="images/productManage.png" title="产品管理" /><h2>产品管理</h2></a></li>
    <li><a href="<%=basePath%>/admin/CustomerManage/queryCustomersPage"  target="rightFrame"><img src="images/customerManage.png" title="客户管理" /><h2>客户管理</h2></a></li>
    <li><a href="<%=basePath%>admin/orders/ordersManage/queryOrdersPage" target="rightFrame"><img src="images/order.png" title="订单管理" /><h2>订单管理</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="<%=basePath %>admin/logout" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${sessionScope.admin.nickname}</span>
    <i>消息</i>
    <b>5</b>
    </div>    
    
    </div>
</body>
</html>
