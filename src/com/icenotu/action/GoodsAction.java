package com.icenotu.action;

import com.icenotu.entity.Goods;
import com.icenotu.entity.PageData;
import com.icenotu.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-08-29.
 */
@Controller
@RequestMapping("/goods")
public class GoodsAction {
    @Autowired
    private GoodsService goodsService;

    @Autowired
    private ServletContext servletContext;

    @RequestMapping(value = "/insert")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public int insert(Goods goods) {
        System.out.println("---action.goods"+goods);
        int i = 0;
        try {
            i = goodsService.insert(goods);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }


    @RequestMapping(value = "/update")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public int update(Goods goods) {
        System.out.println("---action.goods"+goods);
        int i = 0;
        try {
            i = goodsService.update(goods);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping("/select")
    @ResponseBody
    public PageData<Goods> select(PageData<Goods> pageData){
        Map<String,Object> sysParamMap = (Map<String, Object>) servletContext.getAttribute("sysParamMap");
        Map<String,Object> goodsColor = (Map<String, Object>) sysParamMap.get("goodsColor");
        try {
            pageData = goodsService.selectWithCondition(pageData);
            List<Goods> data = pageData.getData();
            for (Goods d:data
                 ) {
                d.setGoodsColor(goodsColor.get(d.getGoodsColor()).toString());
            }
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
            i = goodsService.deleteAll(theArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

}
