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
    //跳转管理用户列表
    <script>
        $(document).ready(function () {
            $("input[name='returnAdminManage']").click(function () {
                window.location.href="<%=basePath%>admin/adminmanage/toManageAdmin";
            });
            $("#UpdateAdmin_Button").click(function (e) {
                var status = true;
                var nickNameVal = $("#nickname").val();
                var userNameVal = $("#username").val();

                if (userNameVal.trim().length==0){
                    status = false;
                    $("#userNameError").html("账户不能为空");
                }
                if(userNameVal.trim().length>0){
                    $("#userNameError").html("");
                }
                if (nickNameVal.trim().length==0){
                    status = false;
                    $("#nickNameError").html("网名不能为空");
                }
                if (nickNameVal.trim().length>0){
                    $("#nickNameError").html("");
                }

                if (status == true){
                    $.post("<%=basePath %>admin/adminmanage/doUpdateAdmin",$("#UpdateAdmin").serialize(),function (data) {
                        //jquery自带的json转换方法
                        if (typeof data != 'object'){   //如果不是js对象（则为json格式的数据，如servlet输出json），则转换成js对象
                            data = $.parseJSON(data);
                        }
                        if(data.status == 1){
                            alert(data.Message);
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
    <li><a href="#">管理员模块</a></li>
        <li><a href="#">管理员更新</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>管理账户编辑</span></div>
    <form id="UpdateAdmin" method="post">
    <input name="id" type="hidden" class="dfinput" value="${requestScope.admin.id}"/>
    <ul class="forminfo">
    <li><label>*账户名</label><input id="username" name="username" type="text" class="dfinput" value="${requestScope.admin.username}" readonly="readonly"/><i id="userNameError"></i></li>
    <li><label>*网名</label><input id="nickname" name="nickname" type="text" class="dfinput"  value="${requestScope.admin.nickname}"/><i id="nickNameError"></i></li>
    <li><label>&nbsp;</label><input id="UpdateAdmin_Button" name="" type="button" class="btn" value="确认编辑"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="returnAdminManage" type="button" class="btn" value="返回用户管理"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
