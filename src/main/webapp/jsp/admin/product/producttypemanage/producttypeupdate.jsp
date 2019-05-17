<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <li><a href="#">产品分类编辑</a></li>
    </ul>
    </div>
    
    <div class="formbody">

        <div class="formtitle"><span>产品分类编辑</span></div>

        <form id="UpdateProductType" method="post">
            <!--传递id-->
            <input name="id" type="hidden" value="${productType.id}">
            <ul class="forminfo">
                <li><label>*产品分类名称</label><input id="pt_name" name="pt_name" type="text" class="dfinput" value="${productType.pt_name}" required/><i id="pt_nameError"></i></li>
                <li><label>*图片</label><input id="url1" name="pt_imageUrl" type="text" class="dfinput" value="${productType.pt_imageUrl}" readonly="readonly" /><input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片">
                    <a href="#" id="clearImagePath1">清除选择图片路径</a>	<i id="pt_imageUrlError"></i></li>
                <li><label>*优先级</label><input id="pt_orderNum" name="pt_orderNum" type="text" class="dfinput" value="${productType.pt_orderNum}" required/><i id="pt_orderNumError"></i></li>
                <li><label>外部链接地址</label><input id="pt_linkUrl" name="pt_linkUrl" type="text" class="dfinput" value="${productType.pt_linkUrl}"/><i id="pt_linkUrlError"></i></li>
                <li><label>产品描述</label><textarea id="pt_intro" name="pt_intro" cols="" rows="" class="textinput">${productType.pt_intro}</textarea><i id="pt_introError"></i></li>
                <li><label>&nbsp;</label><input id="UpdateProductType_Button" name="" type="button" class="btn" value="编辑产品分类"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="returnProductTypeManage" type="button" class="btn" value="返回产品分类管理"/></li>
            </ul>
        </form>
    
    </div>
</body>
</html>
