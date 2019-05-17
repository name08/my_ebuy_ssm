<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
    <script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>

	<script>
        $(document).ready(function () {
            $("button[name='goodsDetail_Button']").click(function() {
                var id=$(this).attr("alt");
                window.location.href="<%=basePath%>shop/product/toGoodsView?id="+id;
            });
        })
    </script>

</head>
<body class="index idx">
	<div class="bgimg"></div>
	<div class="container">
		<div class="header">
			<img class="logo" alt="" src="<%=basePath%>/jsp/shop/resources/images/logo.png">
			<div class="sysmenu">
				<a href="<%=basePath%>shop/index">首页</a>
				<a href="<%=basePath%>shop/order/queryOrdersPage">我的订单</a>
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
		<div class="search">
			<input type="text">
			<button type="button"></button>
		</div>
		<div class="address">
			<label>当前位置：</label>
			<span>官塘大道123号</span>
			<a href="#">[切换地址]</a>
		</div>
		<div class="type-wrap">
			<label>商家分类：</label>
			<div class="types">
				<a href="<%=basePath%>shop/product/toGoodsType">全部商品</a>
				<c:forEach var="productType" items="${requestScope.productTypes}">
                    <a href="<%=basePath%>shop/product/toGoodsType?productTypeId=${productType.id}">${productType.pt_name}</a>
                </c:forEach>
			</div>
		</div>
		<div class="main">

			<div class="hot-sell">

				<h3><span>热销产品</span><a href="<%=basePath%>shop/product/toGoodsType">更多产品 &gt;&gt;&gt;</a></h3>
				<div class="item-wrap">
                    <c:forEach var="hotProduct" items="${requestScope.hotProducts}">
						<c:choose>
							<c:when test="${hotProduct.p_onSale==1}">
								<div class="item" style="padding: 0 10px;">
									<div class="goods">
										<img alt="" src="${hotProduct.p_picUrl}">
										<label>${hotProduct.p_name}</label>
										<br/>
										<label><c:forEach items="${requestScope.productTypes}" var="productType">
											<c:if test="${productType.id==hotProduct.productTypeId}">
												产品分类:${productType.pt_name}
											</c:if>
										</c:forEach></label>
										<i>
											<span>评价: </span>
											<b>
												<img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
												<img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
												<img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
												<img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
												<img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
											</b>
											<em style="float: right;">库存:${hotProduct.p_number} 点击数:${hotProduct.p_click}</em>
										</i>
										<span>现价:${hotProduct.p_price}</span>
										<button name="goodsDetail_Button" alt="${hotProduct.id}" type="button">商品详情</button>
									</div>
								</div>
							</c:when>

						</c:choose>

                    </c:forEach>
				</div>

			</div>

			<div class="desc-sell">
				<h3><span>新品上架</span><a href="<%=basePath%>shop/product/toGoodsType">更多产品 &gt;&gt;&gt;</a></h3>
				<div class="item-wrap">
                    <c:forEach var="newProduct" items="${requestScope.newProducts}">
                        <c:choose>
                            <c:when test="${newProduct.p_onSale==1}">
                                <div class="item" style="padding: 0 10px;">
                                    <div class="goods" >
                                        <img alt="" src="${newProduct.p_picUrl}">
                                        <label>${newProduct.p_name}</label>
                                        <br/>
                                        <label><c:forEach items="${requestScope.productTypes}" var="productType">
                                            <c:if test="${productType.id==newProduct.productTypeId}">
                                                产品分类:${productType.pt_name}
                                            </c:if>
                                        </c:forEach></label>
                                        <i>
                                            <span>评价: </span>
                                            <b>
                                                <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                                <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                                <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                                <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                                <img alt="" src="<%=basePath%>/jsp/shop/resources/images/star10px.png">
                                            </b>
                                            <em style="float: right;">库存:${newProduct.p_number}点击数:${newProduct.p_click}</em>
                                        </i>
                                        <span>现价:￥${newProduct.p_price} <i> 原价：￥${newProduct.p_originalPrice}</i></span>
                                        <button name="goodsDetail_Button" alt="${newProduct.id}" type="button">商品详情</button>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>

                    </c:forEach>
				</div>
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