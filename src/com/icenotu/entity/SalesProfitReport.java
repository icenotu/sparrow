package com.icenotu.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SalesProfitReport implements Serializable{
    private static final long serialVersionUID = -7590901144088073617L;

    private String sprId;

    private String shId;

    private String goodsId;

    private String goodsName;

    private String goodsUnit;

    private String goodsType;

    private String goodsColor;

    private Integer scdAmount;

    private BigDecimal scdUnitPrice;

    private BigDecimal scdTotalPrice;

    private BigDecimal scdUnitCost;

    private BigDecimal scdTotalCost;

    private BigDecimal sprUnitProfit;

    private BigDecimal sprTotalProfit;

    private Date sprDate;

    public String getSprId() {
        return sprId;
    }

    public void setSprId(String sprId) {
        this.sprId = sprId == null ? null : sprId.trim();
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

    public BigDecimal getScdUnitCost() {
        return scdUnitCost;
    }

    public void setScdUnitCost(BigDecimal scdUnitCost) {
        this.scdUnitCost = scdUnitCost;
    }

    public BigDecimal getScdTotalCost() {
        return scdTotalCost;
    }

    public void setScdTotalCost(BigDecimal scdTotalCost) {
        this.scdTotalCost = scdTotalCost;
    }

    public BigDecimal getSprUnitProfit() {
        return sprUnitProfit;
    }

    public void setSprUnitProfit(BigDecimal sprUnitProfit) {
        this.sprUnitProfit = sprUnitProfit;
    }

    public BigDecimal getSprTotalProfit() {
        return sprTotalProfit;
    }

    public void setSprTotalProfit(BigDecimal sprTotalProfit) {
        this.sprTotalProfit = sprTotalProfit;
    }

    public Date getSprDate() {
        return sprDate;
    }

    public void setSprDate(Date sprDate) {
        this.sprDate = sprDate;
    }

    @Override
    public String toString() {
        return "SalesProfitReport{" +
                "sprId='" + sprId + '\'' +
                ", shId='" + shId + '\'' +
                ", goodsId='" + goodsId + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsUnit='" + goodsUnit + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", goodsColor='" + goodsColor + '\'' +
                ", scdAmount=" + scdAmount +
                ", scdUnitPrice=" + scdUnitPrice +
                ", scdTotalPrice=" + scdTotalPrice +
                ", scdUnitCost=" + scdUnitCost +
                ", scdTotalCost=" + scdTotalCost +
                ", sprUnitProfit=" + sprUnitProfit +
                ", sprTotalProfit=" + sprTotalProfit +
                ", sprDate=" + sprDate +
                '}';
    }
}