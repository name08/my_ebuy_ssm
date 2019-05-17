package com.lyh.my_ebuy_ssm.model;

public class OrderDetail {

    private Integer id;  //自动编号

    private String orderNo; //订单编号（外键）

    private Integer productId; //产品编号（外键）

    private Double od_price; //交易价格（下订单时的产品价格）

    private Double od_originalPrice; //原价

    private Integer od_number; //产品数量

    private Product product;   //产品信息

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

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Double getOd_price() {
        return od_price;
    }

    public void setOd_price(Double od_price) {
        this.od_price = od_price;
    }

    public Double getOd_originalPrice() {
        return od_originalPrice;
    }

    public void setOd_originalPrice(Double od_originalPrice) {
        this.od_originalPrice = od_originalPrice;
    }

    public Integer getOd_number() {
        return od_number;
    }

    public void setOd_number(Integer od_number) {
        this.od_number = od_number;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
