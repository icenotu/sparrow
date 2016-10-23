package com.icenotu.action;

import com.icenotu.service.SalesProfitReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-10-23.
 */
@Controller
@RequestMapping("/chart")
public class ChartAction {
    @Autowired
    private SalesProfitReportService salesProfitReportService;

    @RequestMapping("/salesProfitBar")
    @ResponseBody
    public List<Map<String,Object>> salesProfitBar(Date startDate, Date endDate) {
        Map<String, Date> paramMap =new HashMap();
        paramMap.put("startDate", startDate);
        paramMap.put("endDate", endDate);
        System.out.println("startDate---"+startDate);
        System.out.println("endDate---"+endDate);
        List<Map<String, Object>> maps = salesProfitReportService.selectProfitTotal(paramMap);
        System.out.println(maps);
        return maps;
    }
}
