package com.icenotu.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016-09-10.
 */
public class PageData<T> implements Serializable{
    private static final long serialVersionUID = 8557276670521797637L;
    private int draw;
    private int iTotalRecords;
    private int iTotalDisplayRecords;
    private int start;
    private int length;
    private String keyword;
    private String paramType;
    private Date startDate;
    private Date endDate;
    private Date lastMonthStartDate;
    private Date lastMonthEndDate;
    private String orderId;

    public Date getLastMonthStartDate() {
        return lastMonthStartDate;
    }

    public void setLastMonthStartDate(Date lastMonthStartDate) {
        this.lastMonthStartDate = lastMonthStartDate;
    }

    public Date getLastMonthEndDate() {
        return lastMonthEndDate;
    }

    public void setLastMonthEndDate(Date lastMonthEndDate) {
        this.lastMonthEndDate = lastMonthEndDate;
    }

    public String getParamType() {
        return paramType;
    }

    public void setParamType(String paramType) {
        this.paramType = paramType;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    private List<T> data;

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
    /*    private List<List<String>> data;

    public List<List<String>> getData() {
        return data;
    }

    public void setData(List<List<String>> data) {
        this.data = data;
    }

    public PageData() {
    }*/



    public int getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public int getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @Override
    public String toString() {
        return "PageData{" +
                "draw=" + draw +
                ", iTotalRecords=" + iTotalRecords +
                ", iTotalDisplayRecords=" + iTotalDisplayRecords +
                ", start=" + start +
                ", length=" + length +
                ", keyword='" + keyword + '\'' +
                ", paramType='" + paramType + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", lastMonthStartDate=" + lastMonthStartDate +
                ", lastMonthEndDate=" + lastMonthEndDate +
                ", orderId='" + orderId + '\'' +
                ", data=" + data +
                '}';
    }
}
