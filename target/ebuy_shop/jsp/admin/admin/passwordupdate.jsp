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
<script>
    $(document).ready(function () {

        $("#PasswordUpdate_Button").click(function () {
            var status = true;
            var oidPasswordVal = $("#oidPassword").val();
            var newPasswordVal = $("#newPassword").val();
            var confirmPasswordVal = $("#confirmPassword").val();

            if (oidPasswordVal.trim().length == 0){
                status = false;
                $("#oidPasswordError").html("旧密码不能为空");
            }
            if (oidPasswordVal.trim().length > 0){
                $("#oidPasswordError").html("");
            }
            if (newPasswordVal.trim().length == 0){
                status = false;
                $("#newPasswordError").html("新密码不能为空");
            }
            if (newPasswordVal.trim().length > 0){
                $("#newPasswordError").html("");
            }
            if (confirmPasswordVal.trim().length == 0){
                status = false;
                $("#confirmPasswordError").html("确认密码不能为空");
            }
            if (newPasswordVal != confirmPasswordVal){
                status = false;
                $("#confirmPasswordError").html("新密码和确认密码不能为空");
            }

            if (status == true){
                $.post("<%=basePath%>admin/admin/updatePassword",$("#PasswordUpdate").serialize(),function (data) {
                    //jquery自带的json转换方法
                    if (typeof data != 'object'){
                        data = $.parseJSON(data);
                    }
                    if (data.status == 1) {
                        $("#PasswordUpdate")[0].reset();
                        alert(data.Message);
                        location.href = "<%=basePath%>admin/index";
                    }else {
                        alert(data.Message);
                    }
                });
            }
        });
    });
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
        <li><a href="#">个人帐户</a></li>
    <li><a href="#">个人帐户更新密码</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改密码</span></div>
    <form id="PasswordUpdate" method="post">
    <ul class="forminfo">
    <li><label>*旧密码</label><input id="oidPassword" name="oidPassword" type="text" class="dfinput"/><i id="oidPasswordError"></i></li>
    <li><label>*新密码</label><input id="newPassword" name="newPassword" type="text" class="dfinput"/><i id="newPasswordError"></i></li>
    <li><label>*确认密码</label><input id="confirmPassword" name="confirmPassword" type="text" class="dfinput" value=""/><i id="confirmPasswordError"></i></li>
    <li><label>&nbsp;</label><input id="PasswordUpdate_Button" name="" type="button" class="btn" value="确认修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="returnIndex" type="button" class="btn" value="返回首页"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
