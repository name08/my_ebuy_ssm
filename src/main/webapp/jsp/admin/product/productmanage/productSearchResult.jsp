<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统HTML模板--模板之家 www.cssmoban.com</title>
<link href="<%=basePath%>jsp/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>jsp/admin/js/jquery.js"></script>




<script type="text/javascript">


</script>


    <!--自己添加的样式-->
    <style type="text/css">
        .pagin .paginList .paginItem a{float:left;width:60px;height:28px;border:1px solid #DDD; text-align:center;line-height:30px;border-left:none;color:#3399d5;}
        .tablelist thead tr th{text-align: center;}
        .tablelist tbody tr td{text-align: center;}
        .tablelist td {
            line-height: 35px;
            text-indent: 11px;
            border-right: dotted 1px #c7c7c7;
        }
        .price {font-style: normal;color: #ea2020;}
        .originalPrice{text-decoration: line-through; color: #919191;}
        .createTime , .productTypeId{color: #919191;}
        .DropOff{font-style: normal;color: #ea2020;}
        .textinput{border:1px solid #ccc;
            padding: 10px;
            width: 504px;
            height: 12px;
            line-height: 20px;
            overflow: hidden;}
        .dfinput{   width: 135px;
            height: 35px;
            line-height: 32px;
            border:1px solid #ccc;
            text-indent: 10px;
            margin-right: 10px;
        margin-left: 10px;}
    </style>

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">产品模块</a></li>
    <li><a href="#">产品管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="<%=basePath%>jsp/admin/images/t01.png" /></span><a href="<%=basePath%>admin/product/productmanage/toAddProduct">添加产品</a></li>
        </ul>
        <form action="<%=basePath%>/admin/product/productmanage/productSearchResult" method="get">
            <ul style="float:right;">
                <li style="float: left"><input type="submit" value="查询商品" id="search" class="btn"></li>
                <li style="float: left">
                    <select name="productTypeId" class="dfinput">
                        <option value="0">请选择产品分类</option>
                        <c:forEach var="productType" items="${requestScope.productTypes}">
                            <option value="${productType.id}">${productType.pt_name}</option>
                        </c:forEach>
                    </select>
                </li>
                <li style="float: left"><input type="text" id="keyWord" name="keyWord" class="textinput"></li>
                <li style="float: left;margin-left: 15px"><input name="returnProductManage" type="button" class="btn" value="返回产品管理"/></li>
            </ul>
        </form>

    </div>
        <c:choose>
        <c:when test="${products.totalDataCount!=0&&products.totalDataCount>0}">
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:10%;">产品图片</th>
        <th style="width:15%;">产品名</th>
        <th style="width:10%;text-align: center">产品分类</th>
            <th style="width:8%;">产品价格</th>
            <th style="width:10%;">发布人</th>
            <th style="width:8%;">是否上架</th>
            <th style="width:8%;">库存</th>
            <th style="width:8%;">点击数</th>
            <th style="width:12%;">最后编辑时间</th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>

        <c:forEach var="product" items="${requestScope.products.list}" varStatus="index">
        <tr>
        <td><img src="${product.p_picUrl}" style="width: 60px;height: 60px;"></td>
        <td>${product.p_name}<p class="createTime">发布时间:<fmt:formatDate value="${product.p_createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p></td>
            <td>${product.productType.pt_name}<p class="productTypeId">ID:${product.productTypeId}</p></td>
            <td><p class="price">产品现价&nbsp;${product.p_price}</p><p class="originalPrice">产品原价&nbsp;${product.p_originalPrice}</p></td>
            <td>${product.admin.username}</td>
            <td>
                <c:choose>
                    <c:when test="${product.p_onSale == 1}">
                        <p value="${product.p_onSale}" selected="selected">上架中</p>
                    </c:when>
                    <c:otherwise>
                        <p class="DropOff" value="${product.p_onSale}" selected="selected">已下架</p>
                    </c:otherwise>
                </c:choose>

            </td>
            <td>${product.p_number}</td>
            <td>${product.p_click}</td>
            <td><fmt:formatDate value="${product.p_updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td><a href="<%=basePath%>admin/product/productmanage/toUpdateProduct?id=${product.id}" class="tablelink">编辑产品信息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" name="deleteProduct" alt="${product.id}" class="tablelink">删除产品信息</a></td>
        </tr> 
        </c:forEach>

        </tbody>
    </table>
            <div class="pagin">
                <div class="message">共<i class="blue">${products.totalDataCount}</i>条记录，当前第&nbsp;<i class="blue">${page.pageCount}/${page.totalPageCount}&nbsp;</i>页</div>
                <ul class="paginList">

                    <c:if test="${products.pageCount eq 1}">

                        <li class="paginItem"><a href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=1">首页</a></li>
                        <li class="paginItem"><a href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=1">上一页</a></li>

                    </c:if>
                    <c:if test="${products.pageCount > 1}">

                        <li class="paginItem"><a href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=1">首页</a></li>

                        <li class="paginItem"><a href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${products.pageCount-1}">上一页</a></li>

                    </c:if>
                    <c:if test="${products.totalPageCount<5}">
                        <c:forEach begin="1" end="${products.totalPageCount}" varStatus="index">

                            <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${index.index}"><font>${index.index}</font></a></li>

                        </c:forEach>

                    </c:if>
                    <c:if test="${products.totalPageCount>5}">
                        <c:if test="${products.pageCount<=3}">
                            <c:forEach begin="1" end="5" varStatus="index">
                                <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${index.index}"><font>${index.index}</font></a></li>
                            </c:forEach>
                        </c:if>
                    </c:if>
                    <c:if test="${products.totalPageCount>5}">
                        <c:if test="${products.pageCount>=4&&products.pageCount<=products.totalPageCount-2}">
                            <c:forEach begin="${products.pageCount-2}" end="${products.pageCount+2}" varStatus="index">
                                <li class="paginItem"> <a id="${index.index }" href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${index.index}"><font>${index.index}</font></a></li>
                            </c:forEach>
                        </c:if>
                    </c:if>

                    <c:if test="${products.totalPageCount>5}">
                        <c:if test="${products.pageCount>(products.totalPageCount-2)}">
                            <c:forEach begin="${products.totalPageCount-4}" end="${products.totalPageCount}" varStatus="index">
                                <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${index.index}"><font>${index.index}</font></a></li>
                            </c:forEach>
                        </c:if>
                    </c:if>

                    <c:if test="${page.pageCount eq page.totalPageCount}">

                        <li class="paginItem"> <a href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${products.totalPageCount}">下一页</a></li>
                        <li class="paginItem"> <a href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${products.totalPageCount}">尾页</a></li>
                    </c:if>

                    <c:if test="${products.pageCount < products.totalPageCount}">
                        <li class="paginItem"><a href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${products.pageCount+1}">下一页</a></li>

                        <li class="paginItem"> <a href="<%=basePath%>admin/product/productmanage/productSearchResult?productTypeId=${products.productTypeId}&keyWord=${products.keyWord}&pageCount=${products.totalPageCount}">尾页</a></li>
                    </c:if>

                </ul>
            </div>
        </c:when>
            <c:otherwise>
                <center><br>很遗憾，没有查询到带有 <font style="color: red;"> ${productType.pt_name} ${products.keyWord} </font> 的内容，换一个关键词再试试吧。</center>
            </c:otherwise>

        </c:choose>
   

    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
