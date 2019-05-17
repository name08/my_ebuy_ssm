package com.lyh.my_ebuy_ssm.model;

public class Cart {
    private Integer p_id;   //产品id

    private String p_name; //产品名称

    private String p_picUrl;  //产品图片路径

    private Double p_price; //产品现价

    private Double p_originalPrice; //产品原价

    private Integer num; //数量

    private Integer order_id; //订单编号

    public Integer getP_id() {
        return p_id;
    }

    public void setP_id(Integer p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_picUrl() {
        return p_picUrl;
    }

    public void setP_picUrl(String p_picUrl) {
        this.p_picUrl = p_picUrl;
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

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

}
