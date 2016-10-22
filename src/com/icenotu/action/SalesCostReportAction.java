package com.icenotu.action;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesCostReport;
import com.icenotu.service.SalesCostReportService;
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
//        ObjectMapper mapper = new ObjectMapper();
//        int i = 0;
//        try {
//            SalesCostReport[] salesContractDetails = mapper.readValue(rows, SalesCostReport[].class);
//            List<SalesCostReport> salesCostReports = Arrays.asList(salesContractDetails);
//            System.out.println(salesCostReports);
//            i = salesCostReportService.insertList(salesCostReports);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return i;
        return 0;
    }
}
