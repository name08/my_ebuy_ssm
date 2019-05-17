<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

</script>
    <style type="text/css">
        .pagin .paginList .paginItem a{float:left;width:60px;height:28px;border:1px solid #DDD; text-align:center;line-height:30px;border-left:none;color:#3399d5;}
        .tablelist thead tr th{text-align: center;}
        .tablelist tbody tr td{text-align: center;}
        .tablelist td {
            line-height: 35px;
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
    <li><a href="#">订单管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
        <form action="<%=basePath%>admin/orders/ordersManager/LikeOrders" method="get">
            <ul style="float:right;">
                <li style="float: left"><input type="submit" value="查询订单" id="search" class="btn"></li>
                <li style="float: left"><input type="text" id="keyWord" name="keyWord" class="textinput"></li>
                <li style="float: left;margin-left: 15px"><input name="returnOrdersManage" type="button" class="btn" value="返回所有订单"/></li>
            </ul>
        </form>
    
    </div>
    
    <c:choose>
        <c:when test="${orders.totalDataCount!=0&&orders.totalDataCount>0}">


    <c:forEach var="order" items="${requestScope.orders.list}">
    
    <table class="imgtable">
    
    <thead>
    <tr>
    <th colspan="5" style="font-weight:normal;">
            <span style="float:left;">订单号：${order.orderNo}</span>
            <span style="float:left;">下单时间：<fmt:formatDate value="${order.o_createTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
             <span style="float:left;">付款方式：
                 <c:choose>
                     <c:when test="${order.o_payment==1}">
                         货到付款
                     </c:when>
                     <c:when test="${order.o_payment==2}">
                         支付宝支付
                     </c:when>
                     <c:when test="${order.o_payment==3}">
                         微信支付
                     </c:when>
                     <c:otherwise>
                         尚未支付
                     </c:otherwise>
                 </c:choose>

             </span>
            <span style="float:left;">
               <c:choose>
    			   <c:when  test="${order.o_dealTime==null}">
        		           付款时间：无
      			   </c:when>
      			   <c:otherwise>
           		            付款时间：<fmt:formatDate value="${order.o_dealTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
     		       </c:otherwise>
     		   </c:choose>
            </span>
            <span style="float:right;clear:right;margin-right:5px;">订单状态：
                    <c:choose>
                        <c:when test="${order.o_tag==1}">
                            已付款
                        </c:when>
                        <c:when test="${order.o_tag==2}">
                            未付款
                        </c:when>
                        <c:when test="${order.o_tag==3}">
                            订单异常
                        </c:when>
                        <c:otherwise>
                            订单作废
                        </c:otherwise>
                    </c:choose>
                    </span>
            <span style="float:right;">总价：${order.totalPrice}元</span>
            
    </th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach var="orderDetail" items="${order.orderDetails}">
        <c:set var="product" value="${orderDetail.product}"/>
    <tr>
    <td class="imgtd" width="100px;">
     <c:choose>
       <c:when  test="${product.p_picUrl==null||product.p_picUrl==''}">
            <img src="<%=basePath%>jsp/admin/images/img13.png" style="width:80px;height:60px;"/>
       </c:when>
       <c:otherwise>
            <img src="${product.p_picUrl}" style="width:80px;height:60px;"/>
       </c:otherwise>
      </c:choose>
    </td>
    <td style="width:40%;">
       <a href="#">${product.p_name}</a>
       <p>购买数量：${orderDetail.od_number}</p>
    </td>
    <td style="width:15%;"><i>购买价格：${orderDetail.od_price}</i>
        <p style="text-decoration:line-through;">原价：${orderDetail.od_originalPrice}</p>
    </td>
    <td>
        <c:if  test="${order.o_tag==4}">
            <a href="javascript:void(0);" onclick="alert('该功能建设中');">订单作废</a>
        </c:if>
        <c:if  test="${order.o_tag==2}">
            <a href="javascript:void(0);" onclick="alert('该功能建设中');" style="margin-right: 10px;">支付订单</a>
            <a  href="javascript:void(0);" onclick="alert('该功能建设中');">订单作废</a>
        </c:if>

        &nbsp;&nbsp;<a href="javascript:void(0);" onclick="alert('该功能建设中');" class="tablelink">订单详情</a>
	</td>
    </tr>
    </c:forEach>

    </tbody>

    </table>
    <span style="float:left;">收货人：${order.o_sendName}</span>
    <span style="float:left;margin-left:20px;">收货人地址：${order.o_sendAddress}</span>
    <span style="float:left;margin-left:20px;">收货人邮编：${order.o_sendZipCode}</span>
    <span style="float:left;margin-left:20px;">收货人电话：${order.o_sendTel}</span>
    <br/>
    <br/>
    </c:forEach>
    
    </div>
    </c:when>
    <c:otherwise>
        <center><br>很遗憾，没有查询到带有 <font style="color: red;"> ${orders.keyWord} </font> 的订单内容，换一个订单号再试试吧。</center>
    </c:otherwise>
    </c:choose>
    <div class="pagin">
        <div class="message">共<i class="blue">${orders.totalDataCount}</i>条记录，当前第&nbsp;<i class="blue">${page.pageCount}/${page.totalPageCount}&nbsp;</i>页</div>
        <ul class="paginList">

            <c:if test="${orders.pageCount eq 1}">

                <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=1">首页</a></li>
                <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=1">上一页</a></li>

            </c:if>
            <c:if test="${orders.pageCount > 1}">

                <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=1">首页</a></li>

                <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${page.pageCount-1}">上一页</a></li>

            </c:if>
            <c:if test="${orders.totalPageCount<5}">
                <c:forEach begin="1" end="${orders.totalPageCount}" varStatus="index">

                    <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${index.index}"><font>${index.index}</font></a></li>

                </c:forEach>

            </c:if>
            <c:if test="${orders.totalPageCount>5}">
                <c:if test="${orders.pageCount<=3}">
                    <c:forEach begin="1" end="5" varStatus="index">
                        <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${orders.totalPageCount>5}">
                <c:if test="${orders.pageCount>=4&&orders.pageCount<=orders.totalPageCount-2}">
                    <c:forEach begin="${orders.pageCount-2}" end="${orders.pageCount+2}" varStatus="index">
                        <li class="paginItem"> <a id="${index.index }" href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>

            <c:if test="${orders.totalPageCount>5}">
                <c:if test="${orders.pageCount>(orders.totalPageCount-2)}">
                    <c:forEach begin="${orders.totalPageCount-4}" end="${orders.totalPageCount}" varStatus="index">
                        <li class="paginItem"><a id="${index.index }" href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${index.index}"><font>${index.index}</font></a></li>
                    </c:forEach>
                </c:if>
            </c:if>

            <c:if test="${page.pageCount eq page.totalPageCount}">

                <li class="paginItem"> <a href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${orders.totalPageCount}">下一页</a></li>
                <li class="paginItem"> <a href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${orders.totalPageCount}">尾页</a></li>
            </c:if>

            <c:if test="${orders.pageCount < orders.totalPageCount}">
                <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${orders.pageCount+1}">下一页</a></li>

                <li class="paginItem"> <a href="<%=basePath%>admin/orders/ordersManager/queryOrdersPage?keyWord=${orders.keyWord}&pageCount=${orders.totalPageCount}">尾页</a></li>
            </c:if>

        </ul>
    </div>
    
   
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
