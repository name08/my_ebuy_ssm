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
    <script type="text/javascript">
        $(document).ready(function () {
            $("#UpdateAdmin_Button").click(function (e) {
                var status = true;
                var nicknameVal = $("#nickname").val();
                if (nicknameVal.trim().length == 0){
                    status = false;
                    $("#nickNameError").html("网名不能为空");
                }
                if (nicknameVal.trim().length > 0){
                    $("#nickNameError").html("");
                }
                if (status == true){
                    $.post("<%=basePath%>admin/admin/updateAdmin",$("#UpdateAdmin").serialize(),function (data) {
                        if (typeof data != 'object'){
                            data = $.parseJSON(data);
                        }
                        if (data.status == 1) {
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
    <li><a href="#">个人帐户信息更新</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改基本信息</span></div>
    <form id="UpdateAdmin" method="post">
    <ul class="forminfo">
    <li><label>*账户名</label><input id="username" name="username" type="text" class="dfinput" readonly="readonly "value="${sessionScope.admin.username}"/><i id="userNameError"></i></li>
    <li><label>*网名</label><input id="nickname" name="nickname" type="text" class="dfinput" value="${sessionScope.admin.nickname}" /><i id="nickNameError"></i></li>
    <li><label>&nbsp;</label><input id="UpdateAdmin_Button" name="" type="button" class="btn" value="确认修改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="returnIndex" type="button" class="btn" value="返回首页"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
