package com.lyh.my_ebuy_ssm.dao;

import com.lyh.my_ebuy_ssm.model.ProductType;
import com.lyh.my_ebuy_ssm.util.Page;

import java.util.List;

public interface ProductTypeDao {
    //分页查询产品类别列表
    public List<ProductType> queryProductTypesPage(Page<ProductType> page);
    //添加产品类别
    public int addProductType(ProductType productType);
    //删除产品类别
    public int deletedProductType(Integer id);
    //查询产品类别信息
    public ProductType getProductType(Integer id);
    //更新产品类别
    public int updateProductType(ProductType productType);
    //产品分类总数
    public int ProductTypeCount();
    //查询产品的数量
    public int getProductNumber(Integer id);
    //查询产品类别是否存在
    public int exitsProductType(ProductType productType);
    //获取产品分类列表
    public List<ProductType> queryProductType();
    //模糊查询产品分类
    public List<ProductType> LikeProductType(Page<ProductType> page);
    //统计查询产品分类数量
    public int LikeProductTypeCount(Page<ProductType> page);
}
