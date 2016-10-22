package com.icenotu.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SalesCostReport implements Serializable{
    private static final long serialVersionUID = 5957555511774092547L;

    private String scrId;

    private String shId;

    private String goodsId;

    private String goodsName;

    private String goodsUnit;

    private String goodsType;

    private String goodsColor;

    private Integer scdAmount;

    private BigDecimal scdUnitCost;

    private BigDecimal scdTotalCost;

    private Integer openIvAmount;

    private BigDecimal openUnitCost;

    private BigDecimal openTotalCost;

    private Integer bodAmount;

    private BigDecimal bodUnitCost;

    private BigDecimal bodTotalCost;

    private Integer ivAmount;

    private BigDecimal ivUnitCost;

    private BigDecimal ivTotalCost;

    private Date scrDate;

    public String getScrId() {
        return scrId;
    }

    public void setScrId(String scrId) {
        this.scrId = scrId == null ? null : scrId.trim();
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

    public Integer getOpenIvAmount() {
        return openIvAmount;
    }

    public void setOpenIvAmount(Integer openIvAmount) {
        this.openIvAmount = openIvAmount;
    }

    public BigDecimal getOpenUnitCost() {
        return openUnitCost;
    }

    public void setOpenUnitCost(BigDecimal openUnitCost) {
        this.openUnitCost = openUnitCost;
    }

    public BigDecimal getOpenTotalCost() {
        return openTotalCost;
    }

    public void setOpenTotalCost(BigDecimal openTotalCost) {
        this.openTotalCost = openTotalCost;
    }

    public Integer getBodAmount() {
        return bodAmount;
    }

    public void setBodAmount(Integer bodAmount) {
        this.bodAmount = bodAmount;
    }

    public BigDecimal getBodUnitCost() {
        return bodUnitCost;
    }

    public void setBodUnitCost(BigDecimal bodUnitCost) {
        this.bodUnitCost = bodUnitCost;
    }

    public BigDecimal getBodTotalCost() {
        return bodTotalCost;
    }

    public void setBodTotalCost(BigDecimal bodTotalCost) {
        this.bodTotalCost = bodTotalCost;
    }

    public Integer getIvAmount() {
        return ivAmount;
    }

    public void setIvAmount(Integer ivAmount) {
        this.ivAmount = ivAmount;
    }

    public BigDecimal getIvUnitCost() {
        return ivUnitCost;
    }

    public void setIvUnitCost(BigDecimal ivUnitCost) {
        this.ivUnitCost = ivUnitCost;
    }

    public BigDecimal getIvTotalCost() {
        return ivTotalCost;
    }

    public void setIvTotalCost(BigDecimal ivTotalCost) {
        this.ivTotalCost = ivTotalCost;
    }

    public Date getScrDate() {
        return scrDate;
    }

    public void setScrDate(Date scrDate) {
        this.scrDate = scrDate;
    }

    @Override
    public String toString() {
        return "SalesCostReport{" +
                "scrId='" + scrId + '\'' +
                ", shId='" + shId + '\'' +
                ", goodsId='" + goodsId + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsUnit='" + goodsUnit + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", goodsColor='" + goodsColor + '\'' +
                ", scdAmount=" + scdAmount +
                ", scdUnitCost=" + scdUnitCost +
                ", scdTotalCost=" + scdTotalCost +
                ", openIvAmount=" + openIvAmount +
                ", openUnitCost=" + openUnitCost +
                ", openTotalCost=" + openTotalCost +
                ", bodAmount=" + bodAmount +
                ", bodUnitCost=" + bodUnitCost +
                ", bodTotalCost=" + bodTotalCost +
                ", ivAmount=" + ivAmount +
                ", ivUnitCost=" + ivUnitCost +
                ", ivTotalCost=" + ivTotalCost +
                ", scrDate=" + scrDate +
                '}';
    }
}