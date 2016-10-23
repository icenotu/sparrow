package com.icenotu.action;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesCostReport;
import com.icenotu.entity.SalesProfitReport;
import com.icenotu.service.SalesCostReportService;
import com.icenotu.service.SalesProfitReportService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Administrator on 2016-10-20.
 */
@Controller
@RequestMapping("/report")
public class SalesCostReportAction {
    @Autowired
    private SalesCostReportService salesCostReportService;
    @Autowired
    private SalesProfitReportService salesProfitReportService;

    @RequestMapping("/salesCost")
    @ResponseBody
    public PageData<SalesCostReport> generateSalesCost(PageData<SalesCostReport> pageData) {
        try {
            salesCostReportService.generateReport(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }

    @RequestMapping("/insert")
    @ResponseBody
    public int insert(String rows) {
        System.out.println("---action:String:"+ rows);
        //提供json格式数据转java对象
        ObjectMapper mapper = new ObjectMapper();
        int i = 0;
        try {
            SalesCostReport[] salesCostDetails = mapper.readValue(rows, SalesCostReport[].class);
            List<SalesCostReport> salesCostReports = Arrays.asList(salesCostDetails);
            System.out.println(salesCostReports);
            i = salesCostReportService.insertList(salesCostReports);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping("/salesProfit")
    @ResponseBody
    public PageData<SalesProfitReport> generateSalesProfit(PageData<SalesProfitReport> pageData) {
        System.out.println("salesProfit---"+pageData);
        try {
            salesProfitReportService.generateReport(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }

    @RequestMapping("/insertSalesProfit")
    @ResponseBody
    public int insertSalesProfit(String rows) {
        System.out.println("---action:String:"+ rows);
        //提供json格式数据转java对象
        ObjectMapper mapper = new ObjectMapper();
        int i = 0;
        try {
            SalesProfitReport[] salesProfitDetails = mapper.readValue(rows, SalesProfitReport[].class);
            List<SalesProfitReport> salesProfitReports = Arrays.asList(salesProfitDetails);
            System.out.println(salesProfitReports);
            i = salesProfitReportService.insertList(salesProfitReports);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

}
