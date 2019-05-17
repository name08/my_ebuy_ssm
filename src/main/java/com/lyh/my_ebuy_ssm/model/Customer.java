package com.lyh.my_ebuy_ssm.model;

import java.util.Date;

public class Customer {

    private Integer id; //用户id

    private String c_username; //用户帐户名

    private String c_password; //用户密码

    private Integer c_sex;  //用户性别

    private String c_nickName; //用户昵称

    private String c_telephone; //用户移动电话

    private String c_address; //用户地址

    private String c_zipCode; //用户邮编

    private String c_email; //用户邮箱

    private String c_picUrl; //用户图片路径

    private String c_intro; //客户信息备注，简介

    private Date c_createTime; //用户创建时间

    private Double totalPrice;    //消费金额

    private Integer orderNo;    //订单数量

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getC_username() {
        return c_username;
    }

    public void setC_username(String c_username) {
        this.c_username = c_username;
    }

    public String getC_password() {
        return c_password;
    }

    public void setC_password(String c_password) {
        this.c_password = c_password;
    }

    public String getC_nickName() {
        return c_nickName;
    }

    public void setC_nickName(String c_nickName) {
        this.c_nickName = c_nickName;
    }

    public String getC_telephone() {
        return c_telephone;
    }

    public void setC_telephone(String c_telephone) {
        this.c_telephone = c_telephone;
    }

    public String getC_address() {
        return c_address;
    }

    public void setC_address(String c_address) {
        this.c_address = c_address;
    }

    public String getC_zipCode() {
        return c_zipCode;
    }

    public void setC_zipCode(String c_zipCode) {
        this.c_zipCode = c_zipCode;
    }

    public String getC_email() {
        return c_email;
    }

    public void setC_email(String c_email) {
        this.c_email = c_email;
    }

    public String getC_picUrl() {
        return c_picUrl;
    }

    public void setC_picUrl(String c_picUrl) {
        this.c_picUrl = c_picUrl;
    }

    public String getC_intro() {
        return c_intro;
    }

    public void setC_intro(String c_intro) {
        this.c_intro = c_intro;
    }

    public Date getC_createTime() {
        return c_createTime;
    }

    public void setC_createTime(Date c_createTime) {
        this.c_createTime = c_createTime;
    }

    public Integer getC_sex() {
        return c_sex;
    }

    public void setC_sex(Integer c_sex) {
        this.c_sex = c_sex;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }
}
