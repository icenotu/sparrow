package com.icenotu.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Inventory implements Serializable{
    private static final long serialVersionUID = -7339670463749507084L;

    private String ivId;

    private String goodsId;

    private String goodsName;

    private String goodsUnit;

    private String goodsType;

    private String goodsColor;

    private Integer ivAmount;

    private BigDecimal ivUnitCost;

    private BigDecimal ivTotalCost;

    private String shId;

    private String bodId;

    private Date boDate;

    private String ivType;

    private String bodImeiList;

    public String getIvId() {
        return ivId;
    }

    public void setIvId(String ivId) {
        this.ivId = ivId == null ? null : ivId.trim();
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

    public String getShId() {
        return shId;
    }

    public void setShId(String shId) {
        this.shId = shId == null ? null : shId.trim();
    }

    public String getBodId() {
        return bodId;
    }

    public void setBodId(String bodId) {
        this.bodId = bodId == null ? null : bodId.trim();
    }

    public Date getBoDate() {
        return boDate;
    }

    public void setBoDate(Date boDate) {
        this.boDate = boDate;
    }

    public String getIvType() {
        return ivType;
    }

    public void setIvType(String ivType) {
        this.ivType = ivType == null ? null : ivType.trim();
    }

    public String getBodImeiList() {
        return bodImeiList;
    }

    public void setBodImeiList(String bodImeiList) {
        this.bodImeiList = bodImeiList == null ? null : bodImeiList.trim();
    }

    @Override
    public String toString() {
        return "Inventory{" +
                "ivId='" + ivId + '\'' +
                ", goodsId='" + goodsId + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsUnit='" + goodsUnit + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", goodsColor='" + goodsColor + '\'' +
                ", ivAmount=" + ivAmount +
                ", ivUnitCost=" + ivUnitCost +
                ", ivTotalCost=" + ivTotalCost +
                ", shId='" + shId + '\'' +
                ", bodId='" + bodId + '\'' +
                ", boDate=" + boDate +
                ", ivType='" + ivType + '\'' +
                ", bodImeiList='" + bodImeiList + '\'' +
                '}';
    }
}