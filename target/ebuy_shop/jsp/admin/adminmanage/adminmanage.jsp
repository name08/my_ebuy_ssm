<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统HTML模板--模板之家 www.cssmoban.com</title>
<link href="<%=basePath%>jsp/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>jsp/admin/js/jquery.js"></script>
    <script type="text/javascript">

        var msg='${requestScope.msg}';
        //对话框只在服务端传递信息过来的时候才弹出
        if(msg!=''){
            alert(msg);
        }

        $(document).ready(function () {

            $('.tablelist tbody tr:odd').addClass('odd');//表格隔行变色

            $("a[name='deleteAdmin']").click(function() {
                if(window.confirm('确定要删除管理员吗？此操作不可逆!')){
                    var id=$(this).attr("alt");
                    window.location.href="<%=basePath%>admin/adminmanage/doDeleteAdmin?id="+id;
                }
            });

            $("a[name='ResetAdminPassword']").click(function () {
                var $this = $(this);        //获取当前点击链接的对象
                if (window.confirm('确定要重置密吗？重置密码为:123456')){
                    $.get($this.attr("href"),function (data) {
                        if (data.status == 1){
                            alert(data.Message);
                        }else {
                            alert(data.Message);
                        }
                    });
                }
                return false;   //让链接事件失效
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
    <li><a href="#">管理员管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="<%=basePath%>jsp/admin/images/t01.png" /></span><a href="<%=basePath%>admin/adminmanage/toAddAdmin">添加管理账户</a></li>
        </ul>
        
     
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:4%;"><input name="" type="checkbox" value="" checked="checked"/></th>
        <th style="width:30%;">账户名</th>
        <th style="width:30%;">姓名</th>
        <th style="width:18%;">创建时间</th>
      
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach var="admin" items="${requestScope.Admins.list}">
        <tr id="AdminInfo">
        <td><input name="" type="checkbox" value="" /></td>
        <td>${admin.username}</td>
        <td>${admin.nickname}</td>
        <td><fmt:formatDate value="${admin.createTime}" pattern="yyyy-MM-dd"/></td>
       
        <td>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="<%=basePath%>admin/adminmanage/toUpdateAdmin?id=${admin.id}" class="tablelink">编辑管理用户</a>
            <a href="#" name="deleteAdmin" alt="${admin.id}" class="tablelink">删除管理用户</a>
            <a href="<%=basePath%>admin/adminmanage/doResetPassword?id=${admin.id}" name="ResetAdminPassword"  class="tablelink">重置管理密码</a></td>
        </tr> 
        </c:forEach>       
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${Admins.totalDataCount}</i>条记录，当前显示第&nbsp;<i class="blue">${page.pageCount}/${page.totalPageCount}&nbsp;</i>页</div>
        <ul class="paginList">
            <c:if test="${Admins.pageCount eq 1}">

                <li class="paginItem"><a href="<%=basePath%>/admin/adminmanage/toManageAdmin?pageCount=1">首页</a></li>
                <li class="paginItem"><a href="<%=basePath%>/admin/adminmanage/toManageAdmin?pageCount=1">上一页</a></li>

            </c:if>
            <c:if test="${Admins.pageCount > 1}">

                <li class="paginItem"><a href="<%=basePath%>/admin/adminmanage/toManageAdmin?pageCount=1">首页</a></li>

                <li class="paginItem"><a href="<%=basePath%>/admin/adminmanage/toManageAdmin?pageCount=${page.pageCount-1}">上一页</a></li>

            </c:if>
            <c:if test="${Admins.totalPageCount<5}">
                <c:forEach begin="1" end="${Admins.totalPageCount}" varStatus="index">

                    <li class="paginItem"><a id="${index.index }" href="<%=basePath%>/admin/adminmanage/toManageAdmin?pageCount=${index.index}"><font>${index.index}</font></a></li>

                </c:forEach>

            </c:if>
            <c:if test="${Admins.totalPageCount>5}">
                <c:if test="${Admins.pageCount<=3}">
                    <c:forEach begin="1" end="5" varStatus="index">
                        <li class="paginItem"><a id="${index.index }" href="<%=basePath%>/admin/adminmanage/toManageAdmin?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${Admins.totalPageCount>5}">
                <c:if test="${Admins.pageCount>=4&&Admins.pageCount<=Admins.totalPageCount-2}">
                    <c:forEach begin="${Admins.pageCount-2}" end="${Admins.pageCount+2}" varStatus="index">
                        <li class="paginItem"> <a id="${index.index }" href="${pageContext.request.contextPath}/admin/adminmanage/toManageAdmin?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>

            <c:if test="${Admins.totalPageCount>5}">
                <c:if test="${Admins.pageCount>(Admins.totalPageCount-2)}">
                    <c:forEach begin="${Admins.totalPageCount-4}" end="${Admins.totalPageCount}" varStatus="index">
                        <li class="paginItem"><a id="${index.index }" href="${pageContext.request.contextPath}/admin/adminmanage/toManageAdmin?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>

            <c:if test="${page.pageCount eq page.totalPageCount}">

                <li class="paginItem"> <a href="${pageContext.request.contextPath}/admin/adminmanage/toManageAdmin?pageCount=${Admins.totalPageCount}">下一页</a></li>
                <li class="paginItem"> <a href="${pageContext.request.contextPath}/admin/adminmanage/toManageAdmin?pageCount=${Admins.totalPageCount}">尾页</a></li>
            </c:if>

            <c:if test="${Admins.pageCount < Admins.totalPageCount}">
                <li class="paginItem"><a href="${pageContext.request.contextPath}/admin/adminmanage/toManageAdmin?pageCount=${Admins.pageCount+1}">下一页</a></li>

                <li class="paginItem"> <a href="${pageContext.request.contextPath}/admin/adminmanage/toManageAdmin?pageCount=${Admins.totalPageCount}">尾页</a></li>
            </c:if>
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
