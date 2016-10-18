package com.icenotu.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class Distributor implements Serializable{
    private static final long serialVersionUID = -7648166849466056614L;

    @Override
    public String toString() {
        return "Distributor{" +
                "dtbId='" + dtbId + '\'' +
                ", dtbName='" + dtbName + '\'' +
                ", dtbLinkman='" + dtbLinkman + '\'' +
                ", dtbPhone='" + dtbPhone + '\'' +
                ", dtbAddress='" + dtbAddress + '\'' +
                ", dtbRemark='" + dtbRemark + '\'' +
                ", dtbReceivable=" + dtbReceivable +
                ", dtbType='" + dtbType + '\'' +
                '}';
    }

    private String dtbId;

    private String dtbName;

    private String dtbLinkman;

    private String dtbPhone;

    private String dtbAddress;

    private String dtbRemark;

    private BigDecimal dtbReceivable;

    private String dtbType;

    public String getDtbId() {
        return dtbId;
    }

    public void setDtbId(String dtbId) {
        this.dtbId = dtbId == null ? null : dtbId.trim();
    }

    public String getDtbName() {
        return dtbName;
    }

    public void setDtbName(String dtbName) {
        this.dtbName = dtbName == null ? null : dtbName.trim();
    }

    public String getDtbLinkman() {
        return dtbLinkman;
    }

    public void setDtbLinkman(String dtbLinkman) {
        this.dtbLinkman = dtbLinkman == null ? null : dtbLinkman.trim();
    }

    public String getDtbPhone() {
        return dtbPhone;
    }

    public void setDtbPhone(String dtbPhone) {
        this.dtbPhone = dtbPhone == null ? null : dtbPhone.trim();
    }

    public String getDtbAddress() {
        return dtbAddress;
    }

    public void setDtbAddress(String dtbAddress) {
        this.dtbAddress = dtbAddress == null ? null : dtbAddress.trim();
    }

    public String getDtbRemark() {
        return dtbRemark;
    }

    public void setDtbRemark(String dtbRemark) {
        this.dtbRemark = dtbRemark == null ? null : dtbRemark.trim();
    }

    public BigDecimal getDtbReceivable() {
        return dtbReceivable;
    }

    public void setDtbReceivable(BigDecimal dtbReceivable) {
        this.dtbReceivable = dtbReceivable;
    }

    public String getDtbType() {
        return dtbType;
    }

    public void setDtbType(String dtbType) {
        this.dtbType = dtbType == null ? null : dtbType.trim();
    }
}