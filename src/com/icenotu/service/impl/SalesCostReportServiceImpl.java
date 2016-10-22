package com.icenotu.service.impl;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesCostReport;
import com.icenotu.service.SalesCostReportService;
import org.junit.Test;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016-10-20.
 */
@Service("salesCostReport")
public class SalesCostReportServiceImpl extends BaseServiceImpl<SalesCostReport> implements SalesCostReportService {
    @Override
    public PageData<SalesCostReport> generateReport(PageData<SalesCostReport> pageData) throws Exception {
        List<SalesCostReport> salesCostReports = salesCostReportMapper.generateReport(pageData);
        for (SalesCostReport scr:salesCostReports
             ) {
            Integer bodAmount = scr.getBodAmount();
            bodAmount = bodAmount!=null?bodAmount:0;
            scr.setBodAmount(bodAmount);
            BigDecimal bodTotalCost = scr.getBodTotalCost();
            bodTotalCost = bodTotalCost!=null?bodTotalCost:new BigDecimal(0.00);
            scr.setBodTotalCost(bodTotalCost);
            Integer scdAmount = scr.getScdAmount();
            scdAmount = scdAmount != null ? -scdAmount : 0;
            scr.setScdAmount(scdAmount);
            Integer openIvAmount = scr.getOpenIvAmount();
            openIvAmount = openIvAmount != null ? openIvAmount : 0;
            scr.setOpenIvAmount(openIvAmount);
            BigDecimal openTotalCost = scr.getOpenTotalCost();
            openTotalCost = openTotalCost!=null?openTotalCost:new BigDecimal(0.00);
            scr.setOpenTotalCost(openTotalCost);
            BigDecimal bodUnitCost = bodAmount!=0?bodTotalCost.divide(new BigDecimal(bodAmount), 2, 4):new BigDecimal(0.00);
            scr.setBodUnitCost(bodUnitCost);
            BigDecimal openUnitCost = openIvAmount!=0?openTotalCost.divide(new BigDecimal(openIvAmount), 2, 4):new BigDecimal(0.00);
            scr.setOpenUnitCost(openUnitCost);
            BigDecimal scdUnitCost = (bodAmount+openIvAmount)!=0?(bodTotalCost.add(openTotalCost)).divide(new BigDecimal(bodAmount + openIvAmount), 2, 4):new BigDecimal(0.00);
            scr.setScdUnitCost(scdUnitCost);
            BigDecimal scdTotalCost = scdUnitCost.multiply(new BigDecimal(scdAmount));
            scr.setScdTotalCost(scdTotalCost);
            BigDecimal ivTotalCost = openTotalCost.add(bodTotalCost).subtract(scdTotalCost);
            scr.setIvTotalCost(ivTotalCost);
            BigDecimal ivUnitCost = scr.getIvAmount()!=0?ivTotalCost.divide(new BigDecimal(scr.getIvAmount()), 2, 4):new BigDecimal(0.00);
            scr.setIvUnitCost(ivUnitCost);
            scr.setScrDate(pageData.getEndDate());
            scr.setScrId(UUID.randomUUID().toString().replace("-",""));
        }
        pageData.setData(salesCostReports);
        int i = salesCostReportMapper.generateReportCount(pageData);
        pageData.setiTotalRecords(i);
        pageData.setiTotalDisplayRecords(i);
        return pageData;
    }

    @Override
    public int insertList(List<SalesCostReport> salesCostReports) throws Exception {
        return salesCostReportMapper.insertList(salesCostReports);
    }

   /* @Test
    public void test1() {
        PageData<SalesCostReport> pageData = new PageData<>();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        //获取前月的第一天
        Calendar   cal_1=Calendar.getInstance();//获取当前日期
        cal_1.add(Calendar.MONTH, -1);
        cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天
//        String firstDay = format.format(cal_1.getTime());
        Date firstDay = cal_1.getTime();
        System.out.println("-----1------firstDay:"+firstDay);
        //获取前月的最后一天
        Calendar cale = Calendar.getInstance();
        cale.set(Calendar.DAY_OF_MONTH,0);//设置为1号,当前日期既为本月第一天
//        String lastDay = format.format(cale.getTime());
        Date lastDay = cale.getTime();
        System.out.println("-----2------lastDay:"+lastDay);
        //获取当前月第一天：
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天
//        String first = format.format(c.getTime());
        Date first = c.getTime();
        System.out.println("===============first:"+first);
        //获取当前月最后一天
        Calendar ca = Calendar.getInstance();
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
//        String last = format.format(ca.getTime());
        Date last = ca.getTime();
        System.out.println("===============last:"+last);

        pageData.setStartDate(first);
        pageData.setEndDate(last);
        pageData.setLastMonthStartDate(firstDay);
        pageData.setLastMonthEndDate(lastDay);
        System.out.println(pageData);
    }*/


}
