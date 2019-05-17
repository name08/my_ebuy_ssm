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
    var msg = '${requestScope.msg}';
    //对话框只在服务端传递信息过来的时候才弹
    if (msg!=''){
        alert(msg);
    }
    $(document).ready(function () {
        $('.tablelist tbody tr:odd').addClass('odd');
        $("a[name='deleteCustomer']").click(function () {
            if(window.confirm('确定要删除顾客信息吗?此操作不可逆!')){
                var id=$(this).attr("alt");
                window.location.href="<%=basePath%>admin/CustomerManage/doDeleteCustomer?id="+id;
            }
        });
        $("a[name='ResetCustomerPassword']").click(function () {
            var $this = $(this);    //获取当前点击的链接对象
            if (window.confirm('确定重置密码吗?初始化密码为123456')){
                $.get($this.attr("href"),function (data) {
                    if (data==1){
                        alert(data.Message);
                    }else {
                        alert(data.Message);
                    }
                });
            }
            return false; //让链接事件失效
        });
    });
</script>




    <!--自己添加的样式-->
    <style type="text/css">
        .pagin .paginList .paginItem a{float:left;width:60px;height:28px;border:1px solid #DDD; text-align:center;line-height:30px;border-left:none;color:#3399d5;}
        .tablelist thead tr th{text-align: center;}
        .tablelist tbody tr td{text-align: center;}
        .tablelist td {
            line-height: 38px;
            text-indent: 11px;
            border-right: dotted 1px #c7c7c7;
        }
        .price {font-style: normal;color: #ea2020;}
        .originalPrice{text-decoration: line-through; color: #919191;}
        .createTime , .productTypeId{color: #919191;}
        .DropOff{font-style: normal;color: #ea2020;}
        .textinput{border:1px solid #ccc;
            padding: 10px;
            width: 504px;
            height: 12px;
            line-height: 20px;
            overflow: hidden;
            margin-left: 15px;
        }
        .dfinput {
            width: 200px;
            margin-left: 20px;
            height: 34px;
            line-height: 32px;
            border: 1px solid #ccc;
            text-indent: 10px;
        }

    </style>

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">客户模块</a></li>
    <li><a href="#">客户管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="<%=basePath%>jsp/admin/images/t01.png" /></span><a href="<%=basePath%>/admin/CustomerManage/toAddCustomer">添加客户</a></li>
        </ul>
        <form action="<%=basePath%>admin/CustomerManage/CustomerSearchResult" method="get">
        <ul style="float:right;">
            <li style="float: left"><input type="submit" value="查询用户" id="search" class="btn"></li>
            <li style="float: left">
                <select id="c_sex" name="c_sex" class="dfinput">
                    <option value="-1">请选择性别</option>
                    <option value="0">男</option>
                    <option value="1">女</option>
                </select>
            </li>
           <li style="float: left"><input type="text" id="keyWord" name="keyWord" class="textinput"></li>
        </ul>
        </form>
    </div>
    
    
    <table class="tablelist">
    	<thead>
        <tr>
            <th style="width:4%;"><input name="" type="checkbox" value="" checked="checked"/></th>
            <th style="width:14%;">账户名</th>
            <th style="width:10%;">昵称</th>
            <th style="width:10%;">性别</th>
            <th style="width:13%;">电子邮箱</th>
            <th style="width:12%;">注册时间</th>
            <th style="width:10%;">订单数量</th>
            <th style="width:10%;">消费金额</th>
            <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach var="customer" items="${requestScope.customers.list}" varStatus="index">
        <tr>
            <td><input name="" type="checkbox" value="" /></td>
        <td>${customer.c_username}</td>
            <td>${customer.c_nickName}</td>
            <td>
                        <c:choose>
                            <c:when test="${customer.c_sex == 1}">
                                <p value="${customer.c_sex}">女</p>
                            </c:when>
                            <c:otherwise>
                                <p value="${customer.c_sex}">男</p>
                            </c:otherwise>
                        </c:choose>
            </td>
            <td>${customer.c_email}</td>
            <td><fmt:formatDate value="${customer.c_createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${customer.orderNo}</td>
            <td>${customer.totalPrice}</td>
        <td><a href="<%=basePath%>admin/CustomerManage/toUpdateCustomer?id=${customer.id}" class="tablelink">编辑顾客信息</a>
            <a href="#" name="deleteCustomer" alt="${customer.id}" class="tablelink">删除顾客信息</a>
            <a href="<%=basePath%>admin/CustomerManage/doResetCustomerPassword?id=${customer.id}" name="ResetCustomerPassword" class="tablelink">重置顾客密码</a></td>
        </tr> 
        </c:forEach>       
        </tbody>
    </table>
    
   
    <div class="pagin">
        <div class="message">共<i class="blue">${customers.totalDataCount}</i>条记录，当前第&nbsp;<i class="blue">${page.pageCount}/${page.totalPageCount}&nbsp;</i>页</div>
        <ul class="paginList">

            <c:if test="${customers.pageCount eq 1}">

                <li class="paginItem"><a href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=1">首页</a></li>
                <li class="paginItem"><a href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=1">上一页</a></li>

            </c:if>
            <c:if test="${customers.pageCount > 1}">

                <li class="paginItem"><a href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=1">首页</a></li>

                <li class="paginItem"><a href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${page.pageCount-1}">上一页</a></li>

            </c:if>
            <c:if test="${customers.totalPageCount<5}">
                <c:forEach begin="1" end="${customers.totalPageCount}" varStatus="index">

                    <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${index.index}"><font>${index.index}</font></a></li>

                </c:forEach>

            </c:if>
            <c:if test="${customers.totalPageCount>5}">
                <c:if test="${customers.pageCount<=3}">
                    <c:forEach begin="1" end="5" varStatus="index">
                        <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${customers.totalPageCount>5}">
                <c:if test="${customers.pageCount>=4&&customers.pageCount<=customers.totalPageCount-2}">
                    <c:forEach begin="${customers.pageCount-2}" end="${customers.pageCount+2}" varStatus="index">
                        <li class="paginItem"> <a id="${index.index }" href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>

            <c:if test="${customers.totalPageCount>5}">
                <c:if test="${customers.pageCount>(customers.totalPageCount-2)}">
                    <c:forEach begin="${customers.totalPageCount-4}" end="${customers.totalPageCount}" varStatus="index">
                        <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>

            <c:if test="${page.pageCount eq page.totalPageCount}">

                <li class="paginItem"> <a href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${customers.totalPageCount}">下一页</a></li>
                <li class="paginItem"> <a href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${customers.totalPageCount}">尾页</a></li>
            </c:if>

            <c:if test="${customers.pageCount < customers.totalPageCount}">
                <li class="paginItem"><a href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${customers.pageCount+1}">下一页</a></li>

                <li class="paginItem"> <a href="<%=basePath%>admin/CustomerManage/queryCustomersPage?pageCount=${customers.totalPageCount}">尾页</a></li>
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
