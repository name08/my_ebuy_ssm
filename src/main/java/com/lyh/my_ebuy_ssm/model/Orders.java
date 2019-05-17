package com.lyh.my_ebuy_ssm.model;

import java.util.Date;
import java.util.List;

public class Orders {

    private Integer id; //订单主键

    private String orderNo; //订单编号(外键)

    private Integer o_customerId; //客户id(外键)

    private String o_sendName; //收货人姓名

    private String o_sendAddress; //收货人地址

    private String o_sendZipCode; //收货人邮编

    private String o_sendTel; //收货人电话

    private Integer o_payment; //付款方式（1、货到付款；2、支付宝支付；2、微信支付）

    private String o_meno; //备注

    private Date o_createTime; //生成订单时间

    private Date o_dealTime; //交易时间（付款的时间）

    private Integer o_tag; //订单处理标记（1、已付款，2、未付款，3、异常）

    private Double totalPrice;  //订单总价

    private List<OrderDetail> orderDetails; //获取订单详情

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getO_customerId() {
        return o_customerId;
    }

    public void setO_customerId(Integer o_customerId) {
        this.o_customerId = o_customerId;
    }

    public String getO_sendName() {
        return o_sendName;
    }

    public void setO_sendName(String o_sendName) {
        this.o_sendName = o_sendName;
    }

    public String getO_sendAddress() {
        return o_sendAddress;
    }

    public void setO_sendAddress(String o_sendAddress) {
        this.o_sendAddress = o_sendAddress;
    }

    public String getO_sendZipCode() {
        return o_sendZipCode;
    }

    public void setO_sendZipCode(String o_sendZipCode) {
        this.o_sendZipCode = o_sendZipCode;
    }

    public String getO_sendTel() {
        return o_sendTel;
    }

    public void setO_sendTel(String o_sendTel) {
        this.o_sendTel = o_sendTel;
    }

    public Integer getO_payment() {
        return o_payment;
    }

    public void setO_payment(Integer o_payment) {
        this.o_payment = o_payment;
    }

    public String getO_meno() {
        return o_meno;
    }

    public void setO_meno(String o_meno) {
        this.o_meno = o_meno;
    }

    public Date getO_createTime() {
        return o_createTime;
    }

    public void setO_createTime(Date o_createTime) {
        this.o_createTime = o_createTime;
    }

    public Date getO_dealTime() {
        return o_dealTime;
    }

    public void setO_dealTime(Date o_dealTime) {
        this.o_dealTime = o_dealTime;
    }

    public Integer getO_tag() {
        return o_tag;
    }

    public void setO_tag(Integer o_tag) {
        this.o_tag = o_tag;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
}
