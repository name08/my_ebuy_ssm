<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>购物车</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
    <script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>
    <script>
        var msg='${requestScope.msg}';
        //对话框只在服务端传递信息过来的时候才弹出
        if(msg!=''){
            alert(msg);
        }
        $(document).ready(function(){
            //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态

            //当点击+,数量+1,修改购物车中的指定商品
            $("a[name='add']").click(function() {
                var id=$(this).attr('title');
                var value= $("input[name='numberOfSale'][title="+id+"]").attr('value');
                var number = Number(value);
                number+=1;
                if(number>0){

                    $(this).attr('href','<%=basePath%>shop/shopCart/doUpdateCart?i='+id+"&numberOfSale="+number);
                }else{
                    number=1;
                    $(this).attr('value',number);
                    return false;
                }
            });

            //当点击-,数量-1,修改购物车中的指定商品
            $("a[name='sub']").click(function() {
                var id=$(this).attr('title');
                var value= $("input[name='numberOfSale'][title="+id+"]").attr('value');
                var number = Number(value);
                number-=1;
                if(number>0){

                    $(this).attr('href','<%=basePath%>shop/shopCart/doUpdateCart?i='+id+"&numberOfSale="+number);
                }else{
                    number=1;
                    $(this).attr('value',number);
                    alert("不能再减了!在减产品就变成空气溜走了!");
                    return false;
                }
            });

            //修改购物车中的指定商品
            $("input[name='numberOfSale']").live("blur",function() {
                var id=$(this).attr('title');
                var value=$("input[name='numberOfSale'][title="+id+"]").attr('value');
                var number = Number(value);

                location.href="<%=basePath%>shop/shopCart/doUpdateCart?i="+id+"&numberOfSale="+number;

            });

            //删除购物车中的指定商品
            $("a[id='doDeleteProduct']").click(function(){
                ret1=confirm("确定从购物车中删除此商品吗？");
                if(ret1==true){
                    var i=$(this).attr('title');
                    location.href="<%=basePath%>shop/shopCart/doDeleteCart?i="+i;
                }
                return false;
            });

            //删除购物车中的指定商品
            $("a[id='doEmptyCarts']").click(function(){
                ret1=confirm("确定清空购物车吗？");
                if(ret1==true){
                    location.href="<%=basePath%>shop/shopCart/doEmptyCarts";
                }
                return false;
            });


        });

    </script>
</head>
<body class="index carts">
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
		<div class="main">
			<h3><span>购物车</span></h3>
			<table>
				<thead>
					<tr>
						<th style="width:20%;"><div>&nbsp;</div></th>
						<th style="width:20%;"><div>商品信息</div></th>
						<th style="width:15%;"><div>单价</div></th>
						<th style="width:15%;"><div>数量</div></th>
						<th style="width:15%;"><div>金额</div></th>
						<th style="width:15%;"><div>操作</div></th>
					</tr>
				</thead>
				<tbody>
                <c:choose>
                    <c:when test="${sessionScope.cartsSize>0}">
                        <c:forEach var="cart" items="${sessionScope.carts}" varStatus="i">
                            <tr>
                                <td><div><img alt="" src="${cart.p_picUrl}"></div></td>
                                <td><div>${cart.p_name}</div></td>
                                <td><div><span>￥${cart.p_originalPrice}</span><i style="color: red;">￥${cart.p_price}</i></div></td>
                                <td><div>&nbsp;<div class="nums"><a title="${i.index}"  name="sub" class="sub" style="cursor: pointer" >-</a><input name="numberOfSale"  type="text" title="${i.index}" value="${cart.num}"><a style="cursor: pointer" name="add" class="add" title="${i.index}">+</a></div>&nbsp;</div></td>
                                <td><div>￥${cart.p_price*cart.num}</div></td>
                                <td><div><a class="delete" href="#" title="${i.index}" id="doDeleteProduct" >删除</a></div></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td><a href="<%=basePath%>shop/index" style="color: red; text-align: center;">购物车是空的哦，请先购物</a></td>
                        </tr>
                    </c:otherwise>
                </c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							<div>已选<em>${sessionScope.cartsSize}</em>份菜</div>
							<div style="margin-right: 20px;">总计<em>￥${sessionScope.order_sum}</em>元</div>
							<div><a href="<%=basePath%>shop/order/toPayment">结算</a><a href="<%=basePath%>shop/index" style="margin-right: 20px;">继续购物</a><a id="doEmptyCarts" href="#" style="margin-right: 20px;">清空购物车</a></div>
						</td>
					</tr>
				</tfoot>
			</table>
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