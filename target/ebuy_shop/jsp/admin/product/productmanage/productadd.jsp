<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <li><a href="#">产品添加</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>产品添加</span></div>
        <form id="ProductAdd" method="post">
            <ul class="forminfo">
                <li>
                    <label>*产品分类</label>
                    <select id="productTypeId" name="productTypeId" class="dfinput">
                        <option value="0">请选择</option>
                        <c:forEach var="productType" items="${requestScope.productTypes}">
                        <option value="${productType.id}">${productType.pt_name}</option>
                        </c:forEach>
                    </select>
                    <i id="productTypeIdError"></i>
                </li>
                <li><label>*产品名称</label><input id="p_name" name="p_name" type="text" class="dfinput" value=""><i id="p_nameError"></i></li>
                <li><label>*产品图片</label>
                    <input id="url1" name="p_picUrl" type="text" class="dfinput" value="" readonly="readonly">
                    <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片">
                    <a href="#" id="clearImagePath1">清除选择图片路径</a>
                    <i id="p_picUrlError"></i>
                </li>
                <li><label>*产品原价</label><input id="p_originalPrice" name="p_originalPrice" type="text" class="dfinput" value=""><i id="p_originalPriceError"></i></li>
                <li><label>*产品现价</label><input id="p_price" name="p_price" type="text" class="dfinput" value=""><i id="p_priceError"></i></li>
                <li><label>*产品库存</label><input id="p_number" name="p_number" type="text" class="dfinput" value="${product.p_number}"><i id="p_numberError"></i></li>
                <li><label>*优先级</label><input id="p_orderNum" name="p_orderNum" type="text" class="dfinput" value="${product.p_orderNum}"><i id="p_orderNumError"></i></li>
                <li><label>*点击数</label><input id="p_click" name="p_click" type="text" class="dfinput" value="${product.p_click}"><i id="p_clickError"></i></li>
                <li><label>*是否上架</label>
                    <select id="p_onSale" name="p_onSale" class="dfinput">
                        <option value="1" selected="selected">上架</option>
                        <option value="0">下架</option>
                    </select>
                    <i id="p_onSaleError"></i>
                </li>
                <li><label>*产品描述</label>
                    <textarea id="p_description" name="p_description" cols="" rows="" class="textinput"></textarea>
                    <i id="p_descriptionError"></i>
                </li>
                <li><label>*产品内容</label>
                    <textarea id="p_content" name="p_content" class="textinput" style="display: none;"></textarea>
                    <i id="p_contentError"></i>
                </li>
                <li><label>&nbsp;</label><input id="AddProduct_button" name="" type="button" class="btn" value="添加产品">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="returnProductManage" type="button" class="btn" value="返回产品管理"/></li>
            </ul>
        </form>
    
    </div>
</body>
</html>
