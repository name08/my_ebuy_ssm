package com.lyh.my_ebuy_ssm.dao;

import com.lyh.my_ebuy_ssm.model.OrderDetail;
import com.lyh.my_ebuy_ssm.model.Orders;
import com.lyh.my_ebuy_ssm.util.Page;

import java.util.List;

public interface OrdersDao {

    //添加订单
    public int doSubmitOrders(Orders orders);
    //添加订单详情
    public int doSubmitOrdersDerail(OrderDetail orderDetail);
    //查询订单数量
    public int OrderCount();
    //查询订单
    public List<Orders> queryOrdersPage(Page<Orders> page);
    //查询订单详情
    public List<OrderDetail> orderDetails(String orderNo);
    //根据订单号查询订单
    public List<Orders> LikeOrders(Page<Orders> page);
    //更新订单信息
    public int UpdateOrder(Orders orders);
    //统计查询订单数量
    public int LikeOrdersCount(Page<Orders> page);

}
