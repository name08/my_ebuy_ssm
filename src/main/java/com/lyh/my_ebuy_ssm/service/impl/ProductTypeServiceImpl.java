package com.lyh.my_ebuy_ssm.service.impl;

import com.lyh.my_ebuy_ssm.dao.ProductTypeDao;
import com.lyh.my_ebuy_ssm.model.ProductType;
import com.lyh.my_ebuy_ssm.service.ProductTypeService;
import com.lyh.my_ebuy_ssm.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("productTypeService")
public class ProductTypeServiceImpl implements ProductTypeService {

    @Resource
    private ProductTypeDao productTypeDao;

    /**
     *查询产品分类并分页
     * @param page
     * @return
     */
    @Override
    public Page<ProductType> queryProductTypesPage(Page<ProductType> page) {

        List<ProductType> list = productTypeDao.queryProductTypesPage(page); //存放在list
        int productCount = productTypeDao.ProductTypeCount();   //计算总数量
        for (int i = 0; i < list.size(); i++){
            list.get(i).setProductNumber(productTypeDao.getProductNumber(list.get(i).getId()));  //产品数量
        }
        page.setTotalDataCount(productCount);   //page类添加总数量
        page.setList(list); //把查询到的所有记录放入page类

        return page;
    }

    /**
     * 删除产品分类
     * @param id
     * @return
     */
    @Override
    public int deleteProductType(Integer id) {
        return this.productTypeDao.deletedProductType(id);
    }

    /**
     * 添加产品分类
     * @param productType
     * @return
     */
    @Override
    public int addProductType(ProductType productType) {
        return this.productTypeDao.addProductType(productType);
    }

    /**
     * 更新产品分类信息
     * @param productType
     * @return
     */
    @Override
    public int updateProductType(ProductType productType) {
        return this.productTypeDao.updateProductType(productType);
    }

    /**
     * 根据id查询产品分类信息
     * @param id
     * @return
     */
    @Override
    public ProductType getProductType(Integer id) {
        return this.productTypeDao.getProductType(id);
    }

    /**
     * 根据id和产品分类名称来判断是否存在该产品分类
     * @param productType
     * @return
     */
    @Override
    public int existProductType(ProductType productType) {
        return this.productTypeDao.exitsProductType(productType);
    }

    /**
     *普通查询产品分类列表
     * @return
     */
    @Override
    public List<ProductType> queryProductType() {
        return this.productTypeDao.queryProductType();
    }

    /**
     * 根据产品分类的id查询该产品分类下的产品
     * @param id
     * @return
     */
    @Override
    public int getProductNumber(Integer id) {
        return this.productTypeDao.getProductNumber(id);
    }

    /**
     * 模糊查询分页
     * @param page
     * @return page
     */
    @Override
    public Page<ProductType> LikeProductType(Page<ProductType> page) {

        List<ProductType> list = productTypeDao.LikeProductType(page);  //存放在list
        int likeProductTypeCount = productTypeDao.LikeProductTypeCount(page);   //计算总数量

        for (int i = 0; i < list.size(); i++){
            list.get(i).setProductNumber(productTypeDao.getProductNumber(list.get(i).getId()));  //产品数量
        }
        page.setTotalDataCount(likeProductTypeCount);   //page类添加总记录
        page.setList(list); //把查询到的所有记录放入page类

        return page;
    }
}
