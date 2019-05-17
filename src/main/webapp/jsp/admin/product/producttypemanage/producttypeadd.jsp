<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath%>jsp/admin/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>jsp/admin/js/jquery.js"></script>
    <!-- 导入kindEditor所需插件 -->
    <link rel="stylesheet" href="<%=basePath%>/plugins/kindeditor/themes/default/default.css">
    <script src="<%=basePath%>/plugins/kindeditor/kindeditor-all.js"></script>
    <script src="<%=basePath%>/plugins/kindeditor/lang/zh_CN.js"></script>
    <!-- 导入代码高亮的css样式，kindeditor需要导入 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/kindeditor/plugins/code/prettify.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/kindeditor/plugins/code/prettify.js"></script>
<script>

</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">产品模块</a></li>
        <li><a href="#">产品分类添加</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>产品分类添加</span></div>
    <form id="AddProductType" method="post">
    <ul class="forminfo">
    <li><label>*产品分类名称</label><input id="pt_name" name="pt_name" type="text" class="dfinput" value="" /><i id="pt_nameError"></i></li>
    <li><label>*图片</label><input id="url1" name="pt_imageUrl" type="text" class="dfinput" value="" readonly="readonly" /><input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片">
        <a href="#" id="clearImagePath1">清除选择图片路径</a>	<i id="pt_imageUrlError"></i></li>
        <li><label>*优先级</label><input id="pt_orderNum" name="pt_orderNum" type="text" class="dfinput" value="${requestScope.productType.pt_orderNum}"/><i id="pt_orderNumError"></i></li>
        <li><label>外部链接地址</label><input id="pt_linkUrl" name="pt_linkUrl" type="text" class="dfinput" value="${requestScope.productType.pt_linkUrl}"/><i id="pt_linkUrlError"></i></li>
        <li><label>产品描述</label><textarea id="pt_intro" name="pt_intro" cols="" rows="" class="textinput"></textarea><i id="pt_introError"></i></li>
    <li><label>&nbsp;</label><input id="AddProductType_Button" name="" type="button" class="btn" value="添加产品分类"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="returnProductTypeManage" type="button" class="btn" value="返回产品分类管理"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
