package com.lyh.my_ebuy_ssm.model;

import java.util.Date;

public class Product {

    private Integer id; //产品id

    private Integer productTypeId; //所属产品类别编号

    private String p_name; //产品名称

    private Integer p_orderNum; //产品优先级

    private String p_description; //产品描述

    private String p_content; //产品详细描述

    private Double p_price; //产品现价

    private Double p_originalPrice; //产品原价

    private String p_picUrl; //产品图片路径

    private Integer p_number; //产品库存

    private Integer p_click; //产品点击数

    private Integer p_onSale; //产品是否上价(0不上价 1上价 考虑时间问题)

    private Date p_createTime; //产品创建时间

    private Integer p_creatorId; //产品创建管理员

    private Integer p_finalEditorId; //产品最后编辑管理员

    private Date p_updateTime; //产品最后编辑时间

    private ProductType productType; //产品分类

    private Admin admin; //管理员

    private Integer status; //排序状态符

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(Integer productTypeId) {
        this.productTypeId = productTypeId;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public Integer getP_orderNum() {
        return p_orderNum;
    }

    public void setP_orderNum(Integer p_orderNum) {
        this.p_orderNum = p_orderNum;
    }

    public String getP_description() {
        return p_description;
    }

    public void setP_description(String p_description) {
        this.p_description = p_description;
    }

    public String getP_content() {
        return p_content;
    }

    public void setP_content(String p_content) {
        this.p_content = p_content;
    }

    public Double getP_price() {
        return p_price;
    }

    public void setP_price(Double p_price) {
        this.p_price = p_price;
    }

    public Double getP_originalPrice() {
        return p_originalPrice;
    }

    public void setP_originalPrice(Double p_originalPrice) {
        this.p_originalPrice = p_originalPrice;
    }

    public String getP_picUrl() {
        return p_picUrl;
    }

    public void setP_picUrl(String p_picUrl) {
        this.p_picUrl = p_picUrl;
    }

    public Integer getP_number() {
        return p_number;
    }

    public void setP_number(Integer p_number) {
        this.p_number = p_number;
    }

    public Integer getP_click() {
        return p_click;
    }

    public void setP_click(Integer p_click) {
        this.p_click = p_click;
    }

    public Integer getP_onSale() {
        return p_onSale;
    }

    public void setP_onSale(Integer p_onSale) {
        this.p_onSale = p_onSale;
    }

    public Date getP_createTime() {
        return p_createTime;
    }

    public void setP_createTime(Date p_createTime) {
        this.p_createTime = p_createTime;
    }

    public Integer getP_creatorId() {
        return p_creatorId;
    }

    public void setP_creatorId(Integer p_creatorId) {
        this.p_creatorId = p_creatorId;
    }

    public Integer getP_finalEditorId() {
        return p_finalEditorId;
    }

    public void setP_finalEditorId(Integer p_finalEditorId) {
        this.p_finalEditorId = p_finalEditorId;
    }

    public Date getP_updateTime() {
        return p_updateTime;
    }

    public void setP_updateTime(Date p_updateTime) {
        this.p_updateTime = p_updateTime;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
