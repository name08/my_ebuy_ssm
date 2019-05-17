package com.lyh.my_ebuy_ssm.model;

import java.util.Date;

public class ProductType {

    private Integer id;

    private String pt_name;

    private String pt_linkUrl;

    private String pt_imageUrl;

    private String pt_intro;

    private Integer pt_orderNum;

    private Date pt_createTime;

    private Integer pt_creatorId;

    private Integer pt_finalEditorId;

    private Date pt_updateTime;

    private Admin admin;

    private Product product;

    private Integer productNumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPt_name() {
        return pt_name;
    }

    public void setPt_name(String pt_name) {
        this.pt_name = pt_name;
    }

    public String getPt_linkUrl() {
        return pt_linkUrl;
    }

    public void setPt_linkUrl(String pt_linkUrl) {
        this.pt_linkUrl = pt_linkUrl;
    }

    public String getPt_imageUrl() {
        return pt_imageUrl;
    }

    public void setPt_imageUrl(String pt_imageUrl) {
        this.pt_imageUrl = pt_imageUrl;
    }

    public String getPt_intro() {
        return pt_intro;
    }

    public void setPt_intro(String pt_intro) {
        this.pt_intro = pt_intro;
    }

    public Integer getPt_orderNum() {
        return pt_orderNum;
    }

    public void setPt_orderNum(Integer pt_orderNum) {
        this.pt_orderNum = pt_orderNum;
    }

    public Date getPt_createTime() {
        return pt_createTime;
    }

    public void setPt_createTime(Date pt_createTime) {
        this.pt_createTime = pt_createTime;
    }

    public Integer getPt_creatorId() {
        return pt_creatorId;
    }

    public void setPt_creatorId(Integer pt_creatorId) {
        this.pt_creatorId = pt_creatorId;
    }

    public Integer getPt_finalEditorId() {
        return pt_finalEditorId;
    }

    public void setPt_finalEditorId(Integer pt_finalEditorId) {
        this.pt_finalEditorId = pt_finalEditorId;
    }

    public Date getPt_updateTime() {
        return pt_updateTime;
    }

    public void setPt_updateTime(Date pt_updateTime) {
        this.pt_updateTime = pt_updateTime;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(Integer productNumber) {
        this.productNumber = productNumber;
    }
}
