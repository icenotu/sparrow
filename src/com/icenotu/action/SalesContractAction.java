package com.icenotu.action;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SalesContract;
import com.icenotu.entity.SalesContractDetail;
import com.icenotu.service.SalesContractDetailService;
import com.icenotu.service.SalesContractService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;

/**
 * Created by Administrator on 2016-10-16.
 */
@Controller
@RequestMapping("/salesContract")
public class SalesContractAction {
    @Autowired
    private SalesContractService salesContractService;

    @Autowired
    private SalesContractDetailService salesContractDetailService;

    @RequestMapping("/insert")
    @ResponseBody
    public int insert(SalesContract salesContract, String rows) {
        System.out.println("---action:salesContract:"+ salesContract);
        System.out.println("---action:String:"+ rows);
        //提供json格式数据转java对象
        ObjectMapper mapper = new ObjectMapper();
        int i = 0;
        try {
            SalesContractDetail[] salesContractDetails = mapper.readValue(rows, SalesContractDetail[].class);
            salesContract.setSalesContractDetails(Arrays.asList(salesContractDetails));
            System.out.println(salesContract);
            i = salesContractService.insertSalesContract(salesContract);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping("/select")
    @ResponseBody
    public PageData<SalesContract> select(PageData<SalesContract> pageData) {
        System.out.println("---action:PageData<SalesContract>:"+ pageData);
        try {
            salesContractService.selectWithCondition(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }

    @RequestMapping("/checkInfo")
    @ResponseBody
    public PageData<SalesContractDetail> checkInfo(PageData<SalesContractDetail> pageData) {
        System.out.println("---action:checkInfo:"+ pageData);
        try {
            salesContractDetailService.selectWithCondition(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }
}
