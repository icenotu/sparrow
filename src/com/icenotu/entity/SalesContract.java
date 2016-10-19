package com.icenotu.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class SalesContract implements Serializable{
    private static final long serialVersionUID = 4003718868296723203L;
    
    private String scId;

    private String dtbId;

    private Date scDate;

    private BigDecimal scReceivable;

    private BigDecimal scAdvanced;

    private BigDecimal scDiscount;

    private String scOriginal;

    private String scRemark;

    private String scAttn;

    private Integer scOperator;

    private Integer scStatus = 0;

    public Integer getScStatus() {
        return scStatus;
    }

    public void setScStatus(Integer scStatus) {
        this.scStatus = scStatus;
    }

    private List<SalesContractDetail> salesContractDetails;

    public List<SalesContractDetail> getSalesContractDetails() {
        return salesContractDetails;
    }

    public void setSalesContractDetails(List<SalesContractDetail> salesContractDetails) {
        this.salesContractDetails = salesContractDetails;
    }

    public String getScId() {
        return scId;
    }

    public void setScId(String scId) {
        this.scId = scId == null ? null : scId.trim();
    }

    public String getDtbId() {
        return dtbId;
    }

    public void setDtbId(String dtbId) {
        this.dtbId = dtbId == null ? null : dtbId.trim();
    }

    public Date getScDate() {
        return scDate;
    }

    public void setScDate(Date scDate) {
        this.scDate = scDate;
    }

    public BigDecimal getScReceivable() {
        return scReceivable;
    }

    public void setScReceivable(BigDecimal scReceivable) {
        this.scReceivable = scReceivable;
    }

    public BigDecimal getScAdvanced() {
        return scAdvanced;
    }

    public void setScAdvanced(BigDecimal scAdvanced) {
        this.scAdvanced = scAdvanced;
    }

    public BigDecimal getScDiscount() {
        return scDiscount;
    }

    public void setScDiscount(BigDecimal scDiscount) {
        this.scDiscount = scDiscount;
    }

    public String getScOriginal() {
        return scOriginal;
    }

    public void setScOriginal(String scOriginal) {
        this.scOriginal = scOriginal == null ? null : scOriginal.trim();
    }

    public String getScRemark() {
        return scRemark;
    }

    public void setScRemark(String scRemark) {
        this.scRemark = scRemark == null ? null : scRemark.trim();
    }

    public String getScAttn() {
        return scAttn;
    }

    public void setScAttn(String scAttn) {
        this.scAttn = scAttn == null ? null : scAttn.trim();
    }

    public Integer getScOperator() {
        return scOperator;
    }

    public void setScOperator(Integer scOperator) {
        this.scOperator = scOperator;
    }

    @Override
    public String toString() {
        return "SalesContract{" +
                "scId='" + scId + '\'' +
                ", dtbId='" + dtbId + '\'' +
                ", scDate=" + scDate +
                ", scReceivable=" + scReceivable +
                ", scAdvanced=" + scAdvanced +
                ", scDiscount=" + scDiscount +
                ", scOriginal='" + scOriginal + '\'' +
                ", scRemark='" + scRemark + '\'' +
                ", scAttn='" + scAttn + '\'' +
                ", scOperator=" + scOperator +
                ", scStatus=" + scStatus +
                ", salesContractDetails=" + salesContractDetails +
                '}';
    }
}