package com.icenotu.service;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesCostReport;

import java.util.List;

/**
 * Created by Administrator on 2016-10-20.
 */
public interface SalesCostReportService extends BaseService<SalesCostReport> {
    PageData<SalesCostReport> generateReport(PageData<SalesCostReport> pageData) throws Exception;
    int insertList(List<SalesCostReport> salesCostReports) throws Exception;
}
