package com.icenotu.service;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesProfitReport;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-10-20.
 */
public interface SalesProfitReportService extends BaseService<SalesProfitReport> {
    PageData<SalesProfitReport> generateReport(PageData<SalesProfitReport> pageData) throws Exception;
    int insertList(List<SalesProfitReport> salesProfitReports) throws Exception;
    List<Map<String, Object>> selectProfitTotal(Map<String, Date> paramMap);
}
