package com.lyh.my_ebuy_ssm.service.impl;

import com.lyh.my_ebuy_ssm.dao.OrdersDao;
import com.lyh.my_ebuy_ssm.model.OrderDetail;
import com.lyh.my_ebuy_ssm.model.Orders;
import com.lyh.my_ebuy_ssm.service.OrdersService;
import com.lyh.my_ebuy_ssm.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("OrdersService")
public class OrdersServiceImpl implements OrdersService {
    @Resource
    private OrdersDao ordersDao;

    @Override
    public int doSubmitOrders(Orders orders) {
        return this.ordersDao.doSubmitOrders(orders);
    }

    @Override
    public int doSubmitOrdersDerail(OrderDetail orderDetail) {
        return this.ordersDao.doSubmitOrdersDerail(orderDetail);
    }

    /**
     * 分页查询订单数量
     * @param page
     * @return
     */
    @Override
    public Page<Orders> queryOrdersPage(Page<Orders> page) {
        List<Orders> list = ordersDao.queryOrdersPage(page);
        int OrderCount = ordersDao.OrderCount();
        for (int i = 0; i < list.size(); i++){      //循环订单数量
            list.get(i).setOrderDetails(ordersDao.orderDetails(list.get(i).getOrderNo()));  //获取订单的数量
            Double totalPrice = Double.valueOf(0);  //初始化总金额的值
            for (int j = 0; j < list.get(i).getOrderDetails().size(); j++){     //循环产品数量
                totalPrice = totalPrice+list.get(i).getOrderDetails().get(j).getOd_number()*list.get(i).getOrderDetails().get(j).getOd_price(); //计算产品金额
                list.get(i).setTotalPrice(totalPrice);  //获取产品金额
            }
        }
        page.setTotalDataCount(OrderCount);
        page.setList(list);

        return page;
    }

    @Override
    public List<OrderDetail> orderDetails(String orderNo) {
        return this.ordersDao.orderDetails(orderNo);
    }

    @Override
    public int UpdateOrder(Orders order) {
        return this.ordersDao.UpdateOrder(order);
    }

    /**
     * 根据订单号搜索订单
     * @param page
     * @return
     */
    @Override
    public Page<Orders> LikeOrders(Page<Orders> page) {
        List<Orders> list = ordersDao.LikeOrders(page);
        int LikeOrderCount = ordersDao.OrderCount();
        for (int i = 0; i < list.size(); i++){
            list.get(i).setOrderDetails(ordersDao.orderDetails(list.get(i).getOrderNo()));
            Double totalPrice = Double.valueOf(0);
            for (int j = 0; j < list.get(i).getOrderDetails().size(); j++){
                totalPrice = totalPrice + list.get(i).getOrderDetails().get(j).getOd_number() * list.get(i).getOrderDetails().get(j).getOd_price();
                list.get(i).setTotalPrice(totalPrice);
            }
        }
        page.setTotalDataCount(LikeOrderCount);
        page.setList(list);
        return page;
    }
}
