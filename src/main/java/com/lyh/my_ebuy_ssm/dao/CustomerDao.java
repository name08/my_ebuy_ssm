package com.lyh.my_ebuy_ssm.dao;

import com.lyh.my_ebuy_ssm.model.Customer;
import com.lyh.my_ebuy_ssm.util.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerDao {

    //用户登录
    public Customer customerLogin(@Param(value = "c_username") String c_username, @Param(value = "c_password") String c_password);

    //用户注册
    public int customerRegister(Customer customer);

    //(普通)用户列表
    public List<Customer> queryCustomersPage(Page<Customer> page);

    //查询所有用户数量
    public int CustomerCount();

    //添加用户
    public int addCustomer(Customer customer);

    //删除用户
    public int deleteCustomer(Integer id);

    //判断用户是否存在
    public int existCustomer(Customer customer);

    //根据id获取用户信息
    public Customer queryCustomer(Integer id);

    //用户更新
    public int updateCustomer(Customer customer);

    //根据信息查询用户
    public List<Customer> LikeCustomer(Page<Customer> page);

    //统计查询商品数量
    public int LikeCustomerCount(Page<Customer> page);

    //查询消费金额
    public Double getOrderPrice(Integer id);

    //查询订单数量
    public Integer getOrderNumber(Integer id);
}
