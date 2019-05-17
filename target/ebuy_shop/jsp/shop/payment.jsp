<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>支付页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
	<script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>
    <script>
        $(document).ready(function(){

            //当点击结算按钮时
            $("a[name='submitOrders']").click(function() {
                var o_tag = 0;
                var o_menoVal = $("#o_meno").val();
                var payTypeVal = $("input[name='paytype']:checked").val();
                var ret1=confirm("确定提交订单吗？");
                if(ret1==true){
                    ret2=confirm("请问是否立即付款？");
                    if(ret2==true){
                        o_tag = 1;
                        location.href = "<%=basePath%>shop/order/doSubmitOrders?o_tag="+o_tag+"&o_meno="+o_menoVal+"&o_payment="+payTypeVal;
                    }else{
                        o_tag = 2;
                        location.href = "<%=basePath%>shop/order/doSubmitOrders?o_tag="+o_tag+"&o_meno="+o_menoVal+"&o_payment="+payTypeVal;
                    }
                }
                return false;
            });
            //返回购物车
            $("a[name='returnMyCart']").click(function() {

                  location.href="<%=basePath%>shop/shopCart/MyCarts";

            });


        });
    </script>
</head>
<body class="index payment">
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
		<div class="detials">
			<h2>商品清单</h2>

			<table>
				<thead>
					<tr>
						<th style="width: 25%;">图片</th>
						<th style="width: 20%;">名称</th>
						<th style="width: 20%;">数量</th>
						<th style="width: 20%;">价格</th>
						<th>小计</th>
					</tr>
				</thead>
				<tbody>
                <c:forEach var="cart" items="${sessionScope.carts}" varStatus="i">
					<tr>
						<td><img src="${cart.p_picUrl}" alt="" style="width: 125px;height: 125px;padding: 10px;"></td>
						<td>${cart.p_name}</td>
						<td>${cart.num}</td>
						<td>￥${cart.p_price*cart.num}</td>
						<td>￥${cart.p_price*cart.num}</td>
					</tr>
                </c:forEach>
				</tbody>
			</table>
		</div>
		<div class="main">

			<div class="pitems" style="margin-bottom: 30px;">

				<div class="item" >
					<h2>收货人信息：</h2>
					<div class="paytypes">
						<label>收货人姓名：${customer.c_username}</label>
						<br/>
						<label>收货人地址：${customer.c_address}<a href="#" style="color: #f1a61f;margin: 0 9px;">[切换地址]</a></label>
                        <br/>
                        <label>收货人邮箱：${customer.c_email}</label>
						<br/>
						<label>收货人邮编：${customer.c_zipCode}</label>
						<br/>
						<label>收货人电话：${customer.c_telephone}</label>
                        <br/>
                        <textarea rows="4" cols="50" placeholder="备注信息:" id="o_meno" name="o_meno" style="margin-left: 8px"></textarea>
					</div>

				</div>

			</div>

			<div class="pitems">

				<div class="item">
					<label>付款方式：</label>
					<div class="paytypes">
						<label><input type="radio" name="paytype" checked="checked" value="2"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zhifubao.png"></label>
						<label><input type="radio" name="paytype" value="3"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/weixin.png"></label><br><br>
						<label><input type="radio" name="paytype" value="1"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zgyh.png"></label>
						<label><input type="radio" name="paytype" value="1"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zgyh.png"></label>
						<label><input type="radio" name="paytype" value="1"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zgyh.png"></label>
						<label><input type="radio" name="paytype" value="1"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zgyh.png"></label>
						<label><input type="radio" name="paytype" value="1"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zgyh.png"></label>
						<label><input type="radio" name="paytype" value="1"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zgyh.png"></label>
						<label><input type="radio" name="paytype" value="1"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zgyh.png"></label>
						<label><input type="radio" name="paytype" value="1"><img alt="" src="<%=basePath%>/jsp/shop/resources/images/zgyh.png"></label>
					</div>
					<p><span>合计：<b>￥${sessionScope.order_sum}</b></span></p>
                    <p><a name="submitOrders" href="#">确认下单</a></p>
                    <p><a name="returnMyCart" href="#" style="margin-right: 30px;">返回购物车</a></p>
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