<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${productType!=null}">
                ${productType.pt_name}

                ${requestScope.defaultTitle}
            </c:when>

        </c:choose>

    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
    <link href="<%=basePath%>jsp/admin/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>


    <script>
        $(document).ready(function () {
            $("button[name='goodsDetail_Button']").click(function() {
                var id=$(this).attr("alt");
                window.location.href="<%=basePath%>shop/product/toGoodsView?id="+id;
            });
        })
        $(function(){
            var pageNo=${page.pageCount};
            $("#"+pageNo).addClass("font");
        });
    </script>
    <!--底部页码样式-->
    <style type="text/css">
        .font{
            color: red;
        }

        .crumb{
            width: 100%;
            height: 25px;
            margin: 15px 30px;
        }

        .crumb li a {
            color: #999;
            width: auto;
            display: block;
            margin: 0 10px;
            text-decoration: none;
            border-bottom: 3px solid #fff;
            font-size: 16px;
        }

        .crumb ul li{
            float: left;
            width: auto;
            display: block;
            list-style: none;
        }
    </style>
</head>
<body class="index gtypes">
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
                    <div class="sysmenu">${customer.c_nickName}<a href="<%=basePath%>shop/shopCart/MyCarts">购物车</a><a href="<%=basePath%>shop/logout">退出</a></div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    <div class="type-wrap">
        <label>商家分类：</label>
        <div class="types">
            <a href="<%=basePath%>shop/product/toGoodsType">全部商品</a>
            <c:forEach items="${requestScope.productTypes}" var="productType">
                <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${productType.id}">${productType.pt_name}</a>
            </c:forEach>
        </div>
    </div>
    <div class="crumb">
        <ul>
            <li><a href="<%=basePath%>shop/index">首页</a></li>
            <li><span>/</span></li>
            <li><a id="types" href="<%=basePath%>shop/product/toGoodsType?productTypeId=${productType.id}">${productType.pt_name} ${requestScope.defaultTitle}</a></li>
        </ul>
    </div>
    <c:choose>
        <c:when test="${products.totalDataCount!=0&&products.totalDataCount>0}">
            <div class="main">
                <div class="type-sell">
                    <div class="item-wrap">
                        <c:forEach var="product" items="${requestScope.products.list}">
                            <div class="item">
                                <div class="goods">
                                    <img alt="" src="${product.p_picUrl}">
                                    <label>${product.p_name}</label>
                                    <i>
                                        <span>评价: </span>
                                        <b>
                                            <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                            <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                            <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                            <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                            <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                        </b>
                                        <em>库存:${product.p_number}</em>
                                    </i>
                                    <span>￥${product.p_price}</span>
                                    <button name="goodsDetail_Button" alt="${product.id}" type="button">商品详情</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <center><br>很遗憾，<font style="color: red;">${productType.pt_name}</font> 下没有产品!</center>
        </c:otherwise>
    </c:choose>
</div>
<div align="center">
    第${products.pageCount}/${products.totalPageCount}页

    <c:if test="${products.pageCount eq 1}">
        <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=1">首页</a>
        &nbsp;&nbsp;
        <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=1">上一页</a>
    </c:if>

    <c:if test="${products.pageCount > 1}">
        <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=1">首页</a>
        &nbsp;&nbsp;
        <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${products.pageCount-1}">上一页</a>
    </c:if>

    <c:if test="${products.totalPageCount<5}">
        <c:forEach begin="1" end="${products.totalPageCount}" varStatus="index">
            <a id="${index.index }" href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${index.index}"><font>${index.index}</font></a>
        </c:forEach>
    </c:if>
    <c:if test="${products.totalPageCount>5}">
        <c:if test="${products.pageCount<=3}">
            <c:forEach begin="1" end="5" varStatus="index">
                <a id="${index.index }" href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${index.index}"><font>${index.index}</font></a>
            </c:forEach>
        </c:if>
    </c:if>
    <c:if test="${products.totalPageCount>5}">
        <c:if test="${products.pageCount>=4&&products.pageCount<=products.totalPageCount-2}">
            <c:forEach begin="${products.pageCount-2}" end="${products.pageCount+2}" varStatus="index">
                <a id="${index.index }" href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${index.index}"><font>${index.index}</font></a>
            </c:forEach>
        </c:if>
    </c:if>
    <c:if test="${products.totalPageCount>5}">
        <c:if test="${products.pageCount>(products.totalPageCount-2)}">
            <c:forEach begin="${products.totalPageCount-4}" end="${products.totalPageCount}" varStatus="index">
                <a id="${index.index }" href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${index.index}"><font>${index.index}</font></a>
            </c:forEach>
        </c:if>
    </c:if>

    <c:if test="${products.pageCount eq products.totalPageCount}">
        <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${products.totalPageCount}">下一页</a>
        &nbsp;&nbsp;
        <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${products.totalPageCount}">尾页</a>
    </c:if>
    <c:if test="${products.pageCount < products.totalPageCount}">
        <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${products.pageCount+1}">下一页</a>
        &nbsp;&nbsp;
        <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${products.productTypeId}&pageCount=${products.totalPageCount}">尾页</a>
    </c:if>
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