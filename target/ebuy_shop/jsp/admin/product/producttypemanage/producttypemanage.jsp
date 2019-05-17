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



    <style type="text/css">
        .pagin .paginList .paginItem a{float:left;width:60px;height:28px;border:1px solid #DDD; text-align:center;line-height:30px;border-left:none;color:#3399d5;}
        .price {font-style: normal;color: #ea2020;}
        .originalPrice{text-decoration: line-through; color: #919191;}
        .createTime , .productTypeId{color: #919191;}
        .DropOff{font-style: normal;color: #ea2020;}
        .textinput{border:1px solid #ccc;
            padding: 10px;
            width: 504px;
            height: 12px;
            line-height: 20px;
            overflow: hidden;
            margin-left: 15px;
        }
        .dfinput {
            width: 200px;
            margin-left: 20px;
            height: 34px;
            line-height: 32px;
            border: 1px solid #ccc;
            text-indent: 10px;
        }
    </style>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">产品模块</a></li>
    <li><a href="#">产品分类管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    <!--产品分类搜索-->
    	<ul class="toolbar">
        <li class="click"><span><img src="<%=basePath%>jsp/admin/images/t01.png" /></span><a href="<%=basePath%>admin/product/producttypemanage/toAddProductType">添加产品分类</a></li>
        </ul>
        <form action="<%=basePath%>/admin/product/producttypemanage/productTypeSearchResult" method="get">
            <ul style="float:right;">
                <li style="float: left"><input type="submit" value="查询产品分类" id="search" class="btn"></li>
                <li style="float: left"><input type="text" id="keyWord" name="keyWord" class="textinput"></li>
            </ul>
        </form>
     
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:4%;"><input name="" type="checkbox" value="" checked="checked"/></th>
        <th style="width:12%;">产品分类名</th>
        <th style="width:12%;">图片</th>
        <th style="width:12%;">外部链接</th>
            <th style="width:12%;">优先级</th>
            <th style="width:12%;">产品数量</th>
            <th style="width:12%;">发布人</th>
            <th style="width:12%;">最后编辑时间</th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach var="productType" items="${requestScope.productTypes.list}" varStatus="index">
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>${productType.pt_name}</td>
        <td>
            <c:if test="${not empty productType.pt_imageUrl}">有图片</c:if>
            <c:if test="${ empty productType.pt_imageUrl}">无图片</c:if>
        </td>
        <td>
                <c:if test="${not empty productType.pt_linkUrl}">${productType.pt_linkUrl}</c:if>
            <c:if test="${empty productType.pt_linkUrl}">无</c:if></td>
            <td>${productType.pt_orderNum}</td>
            <td>${productType.productNumber}</td>
            <td>${productType.admin.username}</td>
            <td><fmt:formatDate value="${productType.pt_updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=basePath%>admin/product/producttypemanage/toUpdateProductType?id=${productType.id}" class="tablelink">编辑产品类别</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" name="deleteProductType" alt="${productType.id}" class="tablelink">删除产品类别</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr> 
        </c:forEach>       
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${productTypes.totalDataCount}</i>条记录，当前第&nbsp;<i class="blue">${page.pageCount}/${page.totalPageCount}&nbsp;</i>页</div>
        <ul class="paginList">

            <c:if test="${productTypes.pageCount eq 1}">

                <li class="paginItem"><a href="<%=basePath%>/admin/product/producttypemanage/productTypemanage?pageCount=1">首页</a></li>
                <li class="paginItem"><a href="<%=basePath%>/admin/product/producttypemanage/productTypemanage?pageCount=1">上一页</a></li>

            </c:if>
            <c:if test="${productTypes.pageCount > 1}">

                <li class="paginItem"><a href="<%=basePath%>/admin/product/producttypemanage/productTypemanage?pageCount=1">首页</a></li>

            <li class="paginItem"><a href="<%=basePath%>/admin/product/producttypemanage/productTypemanage?pageCount=${page.pageCount-1}">上一页</a></li>

            </c:if>
            <c:if test="${productTypes.totalPageCount<5}">
                <c:forEach begin="1" end="${productTypes.totalPageCount}" varStatus="index">

                    <li class="paginItem"><a id="${index.index }" href="<%=basePath%>/admin/product/producttypemanage/productTypemanage?pageCount=${index.index}"><font>${index.index}</font></a></li>

                </c:forEach>

            </c:if>
            <c:if test="${productTypes.totalPageCount>5}">
                <c:if test="${productTypes.pageCount<=3}">
                    <c:forEach begin="1" end="5" varStatus="index">
            <li class="paginItem"><a id="${index.index }" href="<%=basePath%>/admin/product/producttypemanage/productTypemanage?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${productTypes.totalPageCount>5}">
                <c:if test="${productTypes.pageCount>=4&&productTypes.pageCount<=productTypes.totalPageCount-2}">
                    <c:forEach begin="${productTypes.pageCount-2}" end="${productTypes.pageCount+2}" varStatus="index">
                        <li class="paginItem"> <a id="${index.index }" href="${pageContext.request.contextPath}/admin/product/producttypemanage/productTypemanage?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>

            <c:if test="${productTypes.totalPageCount>5}">
                <c:if test="${productTypes.pageCount>(productTypes.totalPageCount-2)}">
                    <c:forEach begin="${productTypes.totalPageCount-4}" end="${productTypes.totalPageCount}" varStatus="index">
            <li class="paginItem"><a id="${index.index }" href="${pageContext.request.contextPath}/admin/product/producttypemanage/productTypemanage?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>

            <c:if test="${page.pageCount eq page.totalPageCount}">

            <li class="paginItem"> <a href="${pageContext.request.contextPath}/admin/product/producttypemanage/productTypemanage?pageCount=${productTypes.totalPageCount}">下一页</a></li>
            <li class="paginItem"> <a href="${pageContext.request.contextPath}/admin/product/producttypemanage/productTypemanage?pageCount=${productTypes.totalPageCount}">尾页</a></li>
            </c:if>

            <c:if test="${productTypes.pageCount < productTypes.totalPageCount}">
            <li class="paginItem"><a href="${pageContext.request.contextPath}/admin/product/producttypemanage/productTypemanage?pageCount=${productTypes.pageCount+1}">下一页</a></li>

            <li class="paginItem"> <a href="${pageContext.request.contextPath}/admin/product/producttypemanage/productTypemanage?pageCount=${productTypes.totalPageCount}">尾页</a></li>
            </c:if>

        </ul>
    </div>
    
    
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
