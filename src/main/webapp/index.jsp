<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/18 0018
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>登陆</title>
</head>
<body>
<a href="jsp/shop/index.jsp">登陆前台</a>
<br>
<a href="jsp/admin/login.jsp">登录后台</a>
</body>
</html>
