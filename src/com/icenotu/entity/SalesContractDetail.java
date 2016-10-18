package com.icenotu.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class SalesContractDetail implements Serializable{
    
    private static final long serialVersionUID = -2326362138945391893L;
    
    private String scdId;

    private String shId;

    private String goodsId;

    private String goodsName;

    private String goodsUnit;

    private String goodsType;

    private String goodsColor;

    private Integer scdAmount;

    private BigDecimal scdUnitPrice;

    private BigDecimal scdTotalPrice;

    private String scId;

    private String scdImeiList;

    public String getScdId() {
        return scdId;
    }

    public void setScdId(String scdId) {
        this.scdId = scdId == null ? null : scdId.trim();
    }

    public String getShId() {
        return shId;
    }

    public void setShId(String shId) {
        this.shId = shId == null ? null : shId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsUnit() {
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit == null ? null : goodsUnit.trim();
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType == null ? null : goodsType.trim();
    }

    public String getGoodsColor() {
        return goodsColor;
    }

    public void setGoodsColor(String goodsColor) {
        this.goodsColor = goodsColor == null ? null : goodsColor.trim();
    }

    public Integer getScdAmount() {
        return scdAmount;
    }

    public void setScdAmount(Integer scdAmount) {
        this.scdAmount = scdAmount;
    }

    public BigDecimal getScdUnitPrice() {
        return scdUnitPrice;
    }

    public void setScdUnitPrice(BigDecimal scdUnitPrice) {
        this.scdUnitPrice = scdUnitPrice;
    }

    public BigDecimal getScdTotalPrice() {
        return scdTotalPrice;
    }

    public void setScdTotalPrice(BigDecimal scdTotalPrice) {
        this.scdTotalPrice = scdTotalPrice;
    }

    public String getScId() {
        return scId;
    }

    public void setScId(String scId) {
        this.scId = scId == null ? null : scId.trim();
    }

    public String getScdImeiList() {
        return scdImeiList;
    }

    public void setScdImeiList(String scdImeiList) {
        this.scdImeiList = scdImeiList == null ? null : scdImeiList.trim();
    }

    @Override
    public String toString() {
        return "SalesContractDetail{" +
                "scdId='" + scdId + '\'' +
                ", shId='" + shId + '\'' +
                ", goodsId='" + goodsId + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsUnit='" + goodsUnit + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", goodsColor='" + goodsColor + '\'' +
                ", scdAmount=" + scdAmount +
                ", scdUnitPrice=" + scdUnitPrice +
                ", scdTotalPrice=" + scdTotalPrice +
                ", scId='" + scId + '\'' +
                ", scdImeiList='" + scdImeiList + '\'' +
                '}';
    }
}