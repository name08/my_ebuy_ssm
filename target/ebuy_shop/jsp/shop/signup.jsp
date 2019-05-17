<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/shop/resources/css/main.css">
	<script type="text/javascript" src="<%=basePath%>/jsp/shop/resources/js/jquery.js"></script>
    <script>
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


            $("#customerReset_Button").click(function(e) {

                var status = true;

                var c_usernameVal = $("#c_username").val();

                var c_passwordVal = $("#c_password").val();

                var c_nickNameVal = $("#c_nickName").val();

                var c_telephoneVal = $("#c_telephone").val();

                var c_emailVal = $("#c_email").val();

                var c_sexVal = $("#c_sex").val();

                if(c_usernameVal.trim().length==0){
                    status = false;
                    $('#c_usernameError').html("账号不能为空");
                }else {
                    $('#c_usernameError').html("");
                }

                if(c_passwordVal.trim().length==0){
                    status = false;
                    $('#c_passwordError').html("密码不能为空");
                }else {
                    $('#c_passwordError').html("");
                }

                if(c_nickNameVal.trim().length==0){
                    status = false;
                    $('#c_nickNameError').html("昵称不能为空");
                }else {
                    $('#c_nickNameError').html("");
                }

                if(c_sexVal==""){
                    status = false;
                    $('#c_sexError').html("性别不能为空");
                }else if(c_sexVal>1||c_sexVal<0){
                    status = false;
                    $('#c_sexError').html("性别不存在");
                }else {
                    $('#c_sexError').html("");
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

                if(c_emailVal.trim().length==0) {
                    status = false;
                    $('#c_emailError').html("邮箱不能为空");
                } else if(!c_emailVal.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {  //验证邮箱
                    status = false;
                    $('#c_emailError').html("邮箱格式不正确");
                }else {
                    $('#c_emailError').html("");
                }

                if(status == true){
                    $.post("<%=basePath%>/shop/customer/doCustomerReset",
                        $("#customerReset").serialize(),
                        function(data) {
                            //jquery自带的json转换方法
                            if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象
                                data = $.parseJSON(data);
                            }
                            if(data.status == 1) {
                                alert(data.Message);
                                $("#customerReset")[0].reset();
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
<body class="signin">
	<div class="container" style="top: 40%;">
		<img alt="" src="resources/images/logo.png">
		<label class="title">用户注册</label>
		<form id="customerReset" method="post" class="form">
            <ul>
                <li><input id="c_username" name="c_username" class="phone" type="text" placeholder="请输入您的用户名"><i id="c_usernameError"></i></li>

                <li> <input id="c_password" name="c_password" class="phone" type="password" placeholder="请输入您的登录密码"><i id="c_passwordError"></i></li>

                <li> <input id="c_nickName" name="c_nickName" class="phone" type="text" placeholder="请输入您的昵称"><i id="c_nickNameError"></i></li>
                <li><select id="c_sex" name="c_sex"  style="width: 60%;height: 34px;line-height: 32px;border: 1px solid #ccc;text-indent: 10px;">
                    <option value="" selected>请选择性别</option>
                    <option value="0">男</option>
                    <option value="1">女</option>
                </select>
                    <i id="c_sexError"></i>
                </li>
                <li> <input id="c_telephone" name="c_telephone" class="phone" type="text" placeholder="请输入您的手机号码"><i id="c_telephoneError"></i></li>
                <li> <input id="c_email" name="c_email" class="phone" type="text" placeholder="请输入您的邮箱"><i id="c_emailError"></i></li>
                <li><input class="captcha" type="text" placeholder="请输入验证码"><button class="captcha-btn">发送验证码</button></li>

            </ul>
			<div class="treaty">《橙汁园餐厅用户协议》</div>
			<button id="customerReset_Button" class="btn" type="button">同意以上协议并注册</button>
		</form>
		<div class="ext">
			<a class="signup" href="<%=basePath%>shop/customer/toSignIn">已有账号?立即登录</a>
		</div>
	</div>
	<div class="footer">
		<p>(c) 版权所有 2017 橙汁 技术支持：橙汁软件</p>
	</div>
</body>
</html>