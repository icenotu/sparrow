package com.icenotu.action;

import com.icenotu.entity.PageData;
import com.icenotu.entity.StoreHouse;
import com.icenotu.service.StoreHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2016-08-29.
 */
@Controller
@RequestMapping("/storeHouse")
public class StoreHouseAction {
    @Autowired
    private StoreHouseService storeHouseService;


    @RequestMapping(value = "/insert")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public int insert(StoreHouse storeHouse) {
        System.out.println("---action.storeHouse"+storeHouse);
        int i = 0;
        try {
            storeHouse.setShId("sh"+UUID.randomUUID().toString().replace("-",""));
            i = storeHouseService.insert(storeHouse);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }


    @RequestMapping(value = "/update")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public int update(StoreHouse storeHouse) {
        System.out.println("---action.storeHouse"+storeHouse);
        int i = 0;
        try {
            i = storeHouseService.update(storeHouse);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping("/select")
    @ResponseBody
    public PageData<StoreHouse> select(PageData<StoreHouse> pageData){
        try {
            pageData = storeHouseService.selectWithCondition(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(pageData);
        return pageData;
    }
    @RequestMapping("/delAll")
    @ResponseBody
    public int delAll(String[] theArray){
        for (int i=0;i<theArray.length;i++) {
            System.out.println(theArray[i]);
        }
        int i = 0;
        try {
            i = storeHouseService.deleteAll(theArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

}
