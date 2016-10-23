package com.icenotu.dao;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesProfitReport;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SalesProfitReportMapper extends BaseMapper<SalesProfitReport>{
    List<SalesProfitReport> generateReport(PageData<SalesProfitReport> pageData);

    int generateReportCount(PageData<SalesProfitReport> pageData);

    int insertList(List<SalesProfitReport> salesCostReports);

    List<Map<String, Object>> selectProfitTotal(Map<String, Date> paramMap);

    /*int deleteByPrimaryKey(String sprId);

    int insert(SalesProfitReport record);

    int insertSelective(SalesProfitReport record);

    SalesProfitReport selectByPrimaryKey(String sprId);

    int updateByPrimaryKeySelective(SalesProfitReport record);

    int updateByPrimaryKey(SalesProfitReport record);*/
}