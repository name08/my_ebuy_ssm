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
        //跳转管理用户列表
        $(document).ready(function() {

            $("input[name='returnAdminManage']").click(function() {

                window.location.href="<%=basePath%>admin/adminmanage/toManageAdmin";

            });

            $("#AddAdmin_Button").click(function(e) {

                var status = true;

                var nickNameVal = $("#nickname").val();

                var usernameVal = $("#username").val();

                if(usernameVal.trim().length==0){
                    status = false;
                    $("#userNameError").html("网名不能为空");
                }

                if(usernameVal.trim().length>0){
                    $("#userNameError").html("");
                }

                if(nickNameVal.trim().length==0){
                    status = false;
                    $("#nickNameError").html("网名不能为空");
                }

                if(nickNameVal.trim().length>0){
                    $("#nickNameError").html("");
                }



                if(status == true){
                    $.post("<%=basePath %>admin/adminmanage/doAddAdmin",
                        $("#AddAdmin").serialize(),
                        function(data) {
                            //jquery自带的json转换方法
                            if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象
                                data = $.parseJSON(data);
                            }
                            if(data.status == 1) {
                                $("#AddAdmin")[0].reset();
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

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">管理员模块</a></li>
        <li><a href="#">管理员添加</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>管理账户添加</span></div>
    <form id="AddAdmin" method="post">
        <ul class="forminfo">
            <li><label>*账户名</label><input id="username" name="username" type="text" class="dfinput"/><i id="userNameError"></i></li>
            <li><label>*网名</label><input id="nickname" name="nickname" type="text" class="dfinput"/><i id="nickNameError"></i></li>
            <li><label>&nbsp;</label><input id="AddAdmin_Button" name="" type="button" class="btn" value="确认创建"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="returnAdminManage" type="button" class="btn" value="返回用户管理"/></li>
        </ul>
    </form>

</div>
</body>
</html>
