package com.lyh.my_ebuy_ssm.dao;

import com.lyh.my_ebuy_ssm.model.Product;
import com.lyh.my_ebuy_ssm.util.Page;

import java.util.List;

public interface ProductDao {
    //查询所有产品列表
    public List<Product> queryProductsPage(Page<Product> page);
    //查询产品
    public List<Product> LikeProduct(Page<Product> page);
    //删除产品
    public int deleteProduct(Integer id);
    //添加产品
    public int addProduct(Product product);
    //更新产品
    public int updateProduct(Product product);
    //统计查询产品数量
    public int LikeProductCount(Page<Product> page);
    //判断产品是否存在
    public int existProduct(Product product);
    //根据状态符排序，status=1按照优先级降序，status=2按照创建时间降序，去前四条记录
    public List<Product> LikeProducts(Product product);
    //产品列表总数
    public int ProductCount();
    //获取商品信息
    public Product getProduct(Integer id);
}
