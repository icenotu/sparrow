package com.icenotu.action;

import com.icenotu.entity.BuyOrder;
import com.icenotu.entity.BuyOrderDetail;
import com.icenotu.entity.PageData;
import com.icenotu.service.BuyOrderDetailService;
import com.icenotu.service.BuyOrderService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;

/**
 * Created by Administrator on 2016-10-10.
 */
@Controller
@RequestMapping("/buyOrder")
public class BuyOrderAction{
    @Autowired
    public BuyOrderService buyOrderService;

    @Autowired
    public BuyOrderDetailService buyOrderDetailService;

    @RequestMapping("/insert")
    @ResponseBody
    public int insert(BuyOrder buyOrder, String rows) {
        System.out.println("---action:buyOrder:"+ buyOrder);
        System.out.println("---action:String:"+ rows);
        //提供json格式数据转java对象
        ObjectMapper mapper = new ObjectMapper();
        int i = 0;
        try {
            BuyOrderDetail[] buyOrderDetails = mapper.readValue(rows, BuyOrderDetail[].class);
            buyOrder.setBuyOrderDetails(Arrays.asList(buyOrderDetails));
            System.out.println(buyOrder);
            i = buyOrderService.insertBuyOrder(buyOrder);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping("/select")
    @ResponseBody
    public PageData<BuyOrder> select(PageData<BuyOrder> pageData) {
        System.out.println("---action:buyOrder:"+ pageData);
        try {
            buyOrderService.selectWithCondition(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }

    @RequestMapping("/checkInfo")
    @ResponseBody
    public PageData<BuyOrderDetail> checkInfo(PageData<BuyOrderDetail> pageData) {
        System.out.println("---action:checkInfo:"+ pageData);
        try {
            buyOrderDetailService.selectWithCondition(pageData);
            System.out.println(pageData.getData());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }
}
