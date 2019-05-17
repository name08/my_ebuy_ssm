package com.lyh.my_ebuy_ssm.service.impl;


import com.lyh.my_ebuy_ssm.dao.ProductDao;
import com.lyh.my_ebuy_ssm.model.Product;
import com.lyh.my_ebuy_ssm.service.ProductService;
import com.lyh.my_ebuy_ssm.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductDao productDao;

    /**
     *查询所有产品并分页
     * @param page
     * @return
     */
    @Override
    public Page<Product> queryProductsPage(Page<Product> page) {

        List<Product> list = productDao.queryProductsPage(page); //存放在list
        int productCount = productDao.ProductCount();   //计算总数量
        page.setTotalDataCount(productCount);   //page添加总数量
        page.setList(list); //把查询的所有的记录放入page类

        return page;
    }

    /**
     *根据id获取产品信息
     * @param id
     * @return
     */
    @Override
    public Product getProduct(Integer id) {
        return this.productDao.getProduct(id);
    }

    /**
     *添加产品信息
     * @param product
     * @return
     */
    @Override
    public int addProduct(Product product) {
        return this.productDao.addProduct(product);
    }

    /**
     *删除产品信息
     * @param id
     * @return
     */
    @Override
    public int deleteProduct(Integer id) {
        return this.productDao.deleteProduct(id);
    }

    /**
     *更新产品信息
     * @param product
     * @return
     */
    @Override
    public int updateProduct(Product product) {
        return this.productDao.updateProduct(product);
    }

    /**
     *模糊查询产品列表
     * @param page
     * @return
     */
    @Override
    public Page<Product> LikeProduct(Page<Product> page) {

        List<Product> list = productDao.LikeProduct(page);  //存放在list
        int likeProductCount = productDao.LikeProductCount(page);   //计算数量
        page.setTotalDataCount(likeProductCount);   //page添加总数量
        page.setList(list); //把查询的所有的记录放入page类

        return page;
    }

    /**
     * 根据状态符排序,status=1按照优先级降序,status=2按照创建时间降序,取前4条记录
     * @param product
     * @return
     */
    @Override
    public List<Product> LikeProducts(Product product) {
        return this.productDao.LikeProducts(product);
    }

    /**
     * 判断产品是否存在
     * @param product
     * @return
     */
    @Override
    public int existProduct(Product product) {
        return this.productDao.existProduct(product);
    }
}
