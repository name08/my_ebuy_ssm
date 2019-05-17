<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
    <script type="text/javascript" src="<%=basePath%>jsp/admin/js/jquery.js"></script>
    <script>
        //返回产品列表
        $(document).ready(function() {

        //验证是否为正确手机号码
            function isPoneAvailable(str) {
                var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
                if (!myreg.test(str)) {
                    return false;
                } else {
                    return true;
                }
            }
            //邮编验证
            function is_postcode(postcode) {

                if (! /^[0-9][0-9]{5}$/.test(postcode)) {
                    return false;
                }else {
                    return true;
                }

            }

            $("button[id='UpdateProfile_Button']").click(function(e) {

                var status = true;

                var c_nickNameVal = $("#c_nickName").val();

                var c_telephoneVal = $("#c_telephone").val();

                var c_emailVal = $("#c_email").val();

                var c_zipCodeVal = $("#c_zipCode").val();

                var c_addressVal = $("#c_address").val();


                if(c_nickNameVal.trim().length==0){
                    status = false;
                    $('#c_nickNameError').html("昵称不能为空");
                }else {
                    $('#c_nickNameError').html("");
                }

                if(c_emailVal.trim().length==0) {
                    status = false;
                    $('#c_emailError').html("电子邮箱不能为空");
                } else if(!c_emailVal.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {  //验证邮箱
                    status = false;
                    $('#c_emailError').html("电子邮箱格式不正确");
                }else {
                    $('#c_emailError').html("");
                }

                if(c_addressVal.trim().length==0) {
                    status = false;
                    $('#c_addressError').html("地址不能为空");
                }else {
                    $('#c_addressError').html("");
                }

                if(c_telephoneVal.trim().length==0){
                    status = false;
                    $('#c_telephoneError').html("手机号不能为空");
                }else if(!isPoneAvailable(c_telephoneVal)){
                    status = false;
                    $('#c_telephoneError').html("手机号输入不正确");
                }else {
                    $('#c_telephoneError').html("");
                }



                if(c_zipCodeVal.trim().length==0){
                    status = false;
                    $('#c_zipCodeError').html("邮编不能为空");
                } else if(!is_postcode(c_zipCodeVal)) {
                    status = false;
                    $('#c_zipCodeError').html("输入邮编不正确");
                }else {
                    $('#c_zipCodeError').html("");
                }

                if(status == true){
                    $.post("<%=basePath%>shop/customer/doUpdateProfile",
                        $("#UpdateProfile").serialize(),
                        function(data) {
                            //jquery自带的json转换方法
                            if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象
                                data = $.parseJSON(data);
                            }
                            if(data.status == 1) {
                                alert(data.Message);
                            }else {
                                alert(data.Message);
                            }
                        }
                    );
                }

            });

        });
    </script>
</head>
<body class="index account">
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
		<div class="users">
			<label>
				<img alt="" src="<%=basePath%>/jsp/shop/resources/images/head.png">
				<span>中午好！
                    ${customer.c_nickName}
				</span>
			</label>
			<div>
				<div class="item">
					<label>我的红包</label>
					<em>0 个</em>
				</div>
				<div class="item">
					<label>我的余额</label>
					<p>￥12.00</p>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="menu">
				<a href="account.jsp">购物记录</a>
				<a href="<%=basePath%>shop/customer/toProfile">账户管理</a>
				<a class="exit" id="exit" href="<%=basePath%>shop/logout">安全退出</a>
			</div>

			<div class="page">
				<h3><span>账户管理</span></h3>
				<form method="post" id="UpdateProfile" class="form">
                    <input id="id" type="hidden" value="${customer.id}">
					<div class="form-item">
						<label>昵称：</label>
						<input id="c_nickName" name="c_nickName" type="text" value="${customer.c_nickName}">
                        <i id="c_nickNameError" style="color: red;"></i>
					</div>
					<div class="form-item">
						<label>邮箱：</label>
						<input id="c_email" name="c_email" type="text" value="${customer.c_email}">
                        <i id="c_emailError" style="color: red;"></i>
					</div>
					<div class="form-item">
						<label>地址：</label>
						<input id="c_address" name="c_address" type="text" value="${customer.c_address}">
                        <i id="c_addressError" style="color: red;"></i>
					</div>
					<div class="form-item">
						<label>手机：</label>
						<input id="c_telephone" name="c_telephone" type="text" value="${customer.c_telephone}">
                        <i id="c_telephoneError" style="color: red;"></i>
					</div>
					<div class="form-item">
						<label>邮编：</label>
						<input id="c_zipCode" name="c_zipCode" type="text" value="${customer.c_zipCode}">
                        <i id="c_zipCodeError" style="color: red;"></i>
					</div>
					<div class="form-item btns-item">
						<button id="UpdateProfile_Button" type="button">保存</button>
					</div>
				</form>
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