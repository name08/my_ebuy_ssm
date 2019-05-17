<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 导入kindEditor所需插件 -->
<link rel="stylesheet" href="<%=basePath%>/plugins/kindeditor/themes/default/default.css">
<script src="<%=basePath%>/plugins/kindeditor/kindeditor-all.js"></script>
<script src="<%=basePath%>/plugins/kindeditor/lang/zh_CN.js"></script>
<!-- 导入代码高亮的css样式，kindeditor需要导入 -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/kindeditor/plugins/code/prettify.css">
<script type="text/javascript" src="<%=basePath%>/plugins/kindeditor/plugins/code/prettify.js"></script>
<script>

    $(document).ready(function () {
        //当点击“清除图片路径”时，将清除图片路径信息
        $("#clearImagePath1").click(function(){
            $("input[id='url1']").attr('value','');
        });
    });


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

    //返回客户列表
    $(document).ready(function () {

        $("input[name='returnCustomerManage']").click(function () {
            window.location.href = "<%=basePath%>/admin/CustomerManage/queryCustomersPage";
        });

       $("#AddCustomer_Button").click(function () {
           var status = true;

           var c_usernameVal = $("#c_username").val();

           var c_nickNameVal = $("#c_nickName").val();

           var c_telephoneVal = $("#c_telephone").val();

           var c_emailVal = $("#c_email").val();

           var c_sexVal = $("#c_sex").val();

           var url1Val = $("#url1").val();

           var c_emailVal = $("#c_email").val();

           var c_zipCodeVal = $("#c_zipCode").val();

           var c_addressVal = $("#c_address").val();

           if(c_usernameVal.trim().length==0){
               status = false;
               $('#c_usernameError').html("账号不能为空");
           }else {
               $('#c_usernameError').html("");
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

           if(url1Val.trim().length==0){
               status = false;
               $('#p_picUrlError').html("头像不能为空");
           }else if(url1Val>255){
               status = false;
               $('#p_picUrlError').html("头像长度不符");
           } else {
               $('#p_picUrlError').html("");
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

           if(c_addressVal.trim().length==0) {
               status = false;
               $('#c_addressError').html("地址不能为空");
           }else {
               $('#c_addressError').html("");
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

           if(c_emailVal.trim().length==0) {
               status = false;
               $('#c_emailError').html("电子邮箱不能为空");
           } else if(!c_emailVal.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {  //验证邮箱
               status = false;
               $('#c_emailError').html("电子邮箱格式不正确");
           }else {
               $('#c_emailError').html("");
           }
           
           if (status == true){
               $.post("<%=basePath %>admin/CustomerManage/doAddCustomer",
                   $("#AddCustomer").serialize(),
                    function (data) {
                   //jquery自带的json转换方法
                   if(typeof data != 'object') { //如果不是JS对象（则为JSON格式的数据，如servlet输出的JSON），则转换成JS对象
                       data = $.parseJSON(data);
                   }
                   if(data.status == 1) {
                       alert(data.Message);
                       $("#AddCustomer")[0].reset();
                       $("#c_intro").val('');
                   }else {
                       alert(data.Message);
                   }
               });
           }
       }); 
    });

    //实现kindeditor弹出图片上传窗口
    KindEditor.ready(function(K) {
        var editor = K.editor({//图片上传
            //指定上传文件的服务器端程序。
            uploadJson:  '<%=basePath%>plugins/kindeditor/jsp/upload_json.jsp',
            //指定浏览远程图片的服务器端程序
            fileManagerJson: '<%=basePath%>plugins/kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true
        });
        K('#image1').click(function() {
            editor.loadPlugin('image', function() {//动态加载插件，image为插件名
                editor.plugin.imageDialog({
                    showLocal : true,//是否显示本地图片上传窗口
                    showRemote : true,//是否显示网络图片窗口
                    fillDescAfterUploadImage:false,//个人建议只在文本编辑器中使用true，true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框。
                    imageUrl : K('#url1').val(),
                    clickFn : function(url, title, width, height, border, align) {
                        K('#url1').val(url);
                        editor.hideDialog();
                    }
                });
            });
        });
    });


</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">客户模块</a></li>
        <li><a href="#">客户添加</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>顾客添加</span></div>
        <form id="AddCustomer"  method="post">
            <ul class="forminfo">
                <li><label>*帐户名</label><input id="c_username" name="c_username" type="text" class="dfinput" value=""><i id="c_usernameError"></i></li>
                <li><label>*昵称</label><input id="c_nickName" name="c_nickName" type="text" class="dfinput" value=""><i id="c_nickNameError"></i></li>
                <li>
                    <label>*性别</label>
                    <select id="c_sex" name="c_sex" class="dfinput">
                        <option value="0">男</option>
                        <option value="1">女</option>
                    </select>
                    <i id="c_sexError"></i>
                </li>
                <li><label>*头像</label>
                    <input id="url1" name="c_picUrl" type="text" class="dfinput" value="" readonly="readonly">
                    <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片">
                    <a href="#" id="clearImagePath1">清除选择图片路径</a>
                    <i id="p_picUrlError"></i>
                </li>
                <li><label>*电话</label><input id="c_telephone" name="c_telephone" type="text" class="dfinput" value=""><i id="c_telephoneError"></i></li>
                <li><label>*地址</label><input id="c_address" name="c_address" type="text" class="dfinput" value=""><i id="c_addressError"></i></li>
                <li><label>*邮编</label><input id="c_zipCode" name="c_zipCode" type="text" class="dfinput" value=""><i id="c_zipCodeError"></i></li>
                <li><label>*电子邮箱</label><input id="c_email" name="c_email" type="text" class="dfinput" value=""><i id="c_emailError"></i></li>
                <li><label>顾客介绍</label>
                    <textarea id="c_intro"  name="c_intro" cols="" rows="" class="textinput"></textarea><i></i>
                </li>

                <li><label>&nbsp;</label><input id="AddCustomer_Button" name="" type="button" class="btn" value="添加顾客">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="returnCustomerManage" type="button" class="btn" value="返回顾客管理"/></li>
            </ul>
        </form>
    
    </div>
</body>
</html>
