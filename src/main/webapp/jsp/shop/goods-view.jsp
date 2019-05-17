<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
<title>${product.p_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
	<script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>
    <script>
        $(document).ready(function () {

            var customerVal = '<%=session.getAttribute("customer")%>';

            //当数量输入框失去焦点时，用于手动输入数量的验证
            $("input[id='numberOfSale']").blur(function(){
                var number= $("input[name='numberOfSale']").attr('value');
                var stock =parseInt($("#p_number").attr("value"));
                if(number>stock ){//不能超过库存
                    $(this).attr('value',stock);
                }else if(number<1){
                    $(this).attr('value',1);
                }
            });

            $("button[name='doAddCarts']").click(function() {
                if(customerVal=="null"||customerVal==""){
                    alert("您还未登陆，请先登录！");
                    location.href="<%=basePath%>shop/customer/toSignIn";
                }else {
                    var id=$(this).attr("alt");
                    var value= $("input[name='numberOfSale']").attr('value');
                    var number = Number(value);

                    if(number>0){
                        location.href="<%=basePath%>shop/shopCart/doAddCarts?id="+id+"&num="+number;
                    }
                    return false;

                }
            });

        })
    </script>
    <style type="text/css">
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
        }

        .crumb ul li{
            float: left;
            width: auto;
            display: block;
            list-style: none;
        }
    </style>
</head>
<body class="index gview">
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
        <div class="crumb">
            <ul>
                <li><a href="<%=basePath%>shop/index">首页</a></li>
                <li><span>/</span></li>
                <li>

                    <c:forEach items="${requestScope.productTypes}" var="productType">


                    <c:if test="${productType.id==product.productTypeId}">
                        <a id="types" href="<%=basePath%>shop/product/toGoodsType?productTypeId=${productType.id}"> ${productType.pt_name}</a>
                    </c:if>
                    </c:forEach></li>
                <li><span>/</span></li>
                <li><a id="lists" href="#">${product.p_name}</a></li>
            </ul>
        </div>
		<div class="main">
			<div class="view-item view-item1">
				<img alt="" src="${product.p_picUrl}">
				<div class="item">
					<h2 style="margin-bottom: 10px">产品名称:${product.p_name}</h2>
					<div class="prices">
						<span>促销：￥<b>${product.p_price}</b></span>
						<span>原价：￥<i>${product.p_originalPrice}</i></span>
                        <span>库存：<i id="p_number" style="text-decoration: none;" value="${product.p_number}">${product.p_number}</i></span>
					</div>
					<div class="BuyNo">
						<span>我要买：<input id="numberOfSale" class="num" name="numberOfSale" required="" autofocus="" min="1" value="1" type="number">份</span>
						<div class="Buybutton">
							<button name="doAddCarts" alt="${product.id}" class="BuyB"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/scart.png">加入购物车</button>
						</div>
					</div>
				</div>
			</div>
			<div class="view-item view-item2">
				<h3><span>详细说明</span></h3>
				<div class="item">
					<p>${product.p_content}</p>
				</div>
			</div>
			<div class="view-item view-item3">
				<h3><span>用户评价</span><a href="discuss.jsp">更多评论&gt;&gt;&gt;</a></h3>
				<div class="item">
					<img alt="" src="<%=basePath%>/jsp/shop/resources/images/Rectangle70px.png">
					<p>浓香四溢，食材新鲜，超级好吃</p>
					<div>
						<span>2018-04-08</span>
						<a><img alt="" src="<%=basePath%>/jsp/shop/resources/images/agreeOn.png"><span>(23)</span></a>
						<a><img alt="" src="<%=basePath%>/jsp/shop/resources/images/agreeGray.png"><span>(2)</span></a>
					</div>
				</div>
				<div class="item">
					<img alt="" src="<%=basePath%>/jsp/shop/resources/images/Rectangle70px.png">
					<p>浓香四溢，食材新鲜，超级好吃</p>
					<div>
						<span>2018-04-08</span>
						<a><img alt="" src="<%=basePath%>/jsp/shop/resources/images/agreeOn.png"><span>(23)</span></a>
						<a><img alt="" src="<%=basePath%>/jsp/shop/resources/images/agreeGray.png"><span>(2)</span></a>
					</div>
				</div>
			</div>
		</div>
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