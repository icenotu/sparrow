package com.icenotu.entity;

import java.io.Serializable;

public class StoreHouse implements Serializable{
    private static final long serialVersionUID = 3354871328625454914L;

    private String shId;

    private String shName;

    private String shResponsible;

    private String shPhone;

    private String shAddress;

    private String shType;

    private String shRemark;

    @Override
    public String toString() {
        return "StoreHouse{" +
                "shId='" + shId + '\'' +
                ", shName='" + shName + '\'' +
                ", shResponsible='" + shResponsible + '\'' +
                ", shPhone='" + shPhone + '\'' +
                ", shAddress='" + shAddress + '\'' +
                ", shType='" + shType + '\'' +
                ", shRemark='" + shRemark + '\'' +
                '}';
    }

    public String getShId() {
        return shId;
    }

    public void setShId(String shId) {
        this.shId = shId == null ? null : shId.trim();
    }

    public String getShName() {
        return shName;
    }

    public void setShName(String shName) {
        this.shName = shName == null ? null : shName.trim();
    }

    public String getShResponsible() {
        return shResponsible;
    }

    public void setShResponsible(String shResponsible) {
        this.shResponsible = shResponsible == null ? null : shResponsible.trim();
    }

    public String getShPhone() {
        return shPhone;
    }

    public void setShPhone(String shPhone) {
        this.shPhone = shPhone == null ? null : shPhone.trim();
    }

    public String getShAddress() {
        return shAddress;
    }

    public void setShAddress(String shAddress) {
        this.shAddress = shAddress == null ? null : shAddress.trim();
    }

    public String getShType() {
        return shType;
    }

    public void setShType(String shType) {
        this.shType = shType == null ? null : shType.trim();
    }

    public String getShRemark() {
        return shRemark;
    }

    public void setShRemark(String shRemark) {
        this.shRemark = shRemark == null ? null : shRemark.trim();
    }
}