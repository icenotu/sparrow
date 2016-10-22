package com.icenotu.dao;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesCostReport;

import java.util.List;

public interface SalesCostReportMapper extends BaseMapper<SalesCostReport>{
    List<SalesCostReport> generateReport(PageData<SalesCostReport> pageData);

    int generateReportCount(PageData<SalesCostReport> pageData);

    int insertList(List<SalesCostReport> salesCostReports);
    /*int deleteByPrimaryKey(String scrId);

    int insert(SalesCostReport record);

    int insertSelective(SalesCostReport record);

    SalesCostReport selectByPrimaryKey(String scrId);

    int updateByPrimaryKeySelective(SalesCostReport record);

    int updateByPrimaryKey(SalesCostReport record);*/
}