package com.lyh.my_ebuy_ssm.service;

import com.lyh.my_ebuy_ssm.model.OrderDetail;
import com.lyh.my_ebuy_ssm.model.Orders;
import com.lyh.my_ebuy_ssm.util.Page;

import java.util.List;

public interface OrdersService {

    //添加订单
    public int doSubmitOrders(Orders orders);
    //添加订单详情
    public int doSubmitOrdersDerail(OrderDetail orderDetail);
    //查询订单
    public Page<Orders> queryOrdersPage(Page<Orders> page);
    //查询订单详情
    public List<OrderDetail> orderDetails(String orderNo);
    //更新订单信息
    public int UpdateOrder(Orders order);
    //根据订单号查询订单
    public Page<Orders> LikeOrders(Page<Orders> page);

}
