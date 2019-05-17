package com.lyh.my_ebuy_ssm.util;

import java.util.List;

//分页工具类
public class Page<T> {
    private int firstIndex; //查询结果从第0条开始
    private int pageSize = 10; //每页个数
    private int pageCount = 1; //当前页
    private int totalPageCount; //总页数
    private int totalDataCount; //总记录数
    private List<T> list; //每页显示的数据
    private String keyWord;//搜索关键字
    private Integer productTypeId; //搜索商品分类
    private Integer c_sex;          //搜索性别

    public int getFirstIndex() {
        return (this.getPageCount() - 1) * this.getPageSize();
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getTotalPageCount() {
        return (this.getTotalDataCount() - 1) / this.getPageSize() + 1;
    }

    public int getTotalDataCount() {
        return totalDataCount;
    }

    public void setTotalDataCount(int totalDataCount) {
        this.totalDataCount = totalDataCount;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public Integer getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(Integer productTypeId) {
        this.productTypeId = productTypeId;
    }

    public Integer getC_sex() {
        return c_sex;
    }

    public void setC_sex(Integer c_sex) {
        this.c_sex = c_sex;
    }
}
