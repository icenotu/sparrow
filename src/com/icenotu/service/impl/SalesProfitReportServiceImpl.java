package com.icenotu.service.impl;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesProfitReport;
import com.icenotu.service.SalesProfitReportService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2016-10-20.
 */
@Service("salesProfitReport")
public class SalesProfitReportServiceImpl extends BaseServiceImpl<SalesProfitReport> implements SalesProfitReportService {
    @Override
    public PageData<SalesProfitReport> generateReport(PageData<SalesProfitReport> pageData) throws Exception {
        List<SalesProfitReport> salesProfitReports = salesProfitReportMapper.generateReport(pageData);
        for (SalesProfitReport spr:salesProfitReports
             ) {
            spr.setSprId(UUID.randomUUID().toString().replace("-",""));
            spr.setSprDate(pageData.getEndDate());
        }
        System.out.println("salesProfitReport---"+salesProfitReports);
        pageData.setData(salesProfitReports);
        int i = salesProfitReportMapper.generateReportCount(pageData);
        pageData.setiTotalRecords(i);
        pageData.setiTotalDisplayRecords(i);
        return pageData;
    }

    @Override
    public int insertList(List<SalesProfitReport> salesProfitReports) throws Exception {
        return salesProfitReportMapper.insertList(salesProfitReports);
    }

    @Override
    public List<Map<String, Object>> selectProfitTotal(Map<String, Date> paramMap) {
        return salesProfitReportMapper.selectProfitTotal(paramMap);
    }


}
