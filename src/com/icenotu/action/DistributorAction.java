package com.icenotu.action;

import com.icenotu.entity.Distributor;
import com.icenotu.entity.PageData;
import com.icenotu.service.DistributorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2016-10-13.
 */
@Controller
@RequestMapping("/distributor")
public class DistributorAction {
    @Autowired
    private DistributorService distributorService;

    /*@Autowired
    private ServletContext servletContext;*/

    @RequestMapping(value = "/insert")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public int insert(Distributor distributor) {
        System.out.println("---action.distributor"+distributor);
        int i = 0;
        try {
            distributor.setDtbId("db"+ UUID.randomUUID().toString().replace("-",""));
            i = distributorService.insert(distributor);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }


    @RequestMapping(value = "/update")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public int update(Distributor distributor) {
        System.out.println("---action.distributor"+distributor);
        int i = 0;
        try {
            i = distributorService.update(distributor);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping("/select")
    @ResponseBody
    public PageData<Distributor> select(PageData<Distributor> pageData){
        //获取分页控件的信息
//        request.setCharacterEncoding("utf-8");
        /*Map<String,Object> sysParamMap = (Map<String, Object>) servletContext.getAttribute("sysParamMap");
        Map<String,Object> supType = (Map<String, Object>) sysParamMap.get("supType");
        String start = request.getParameter("start");
        System.out.println("start==="+start);
        String length = request.getParameter("length");
        System.out.println("length==="+length);
        //获取前台额外传递过来的查询条件
        String extra_search = request.getParameter("extra_search");
        System.out.println("search==="+extra_search);
//        String theArray = request.getParameter("theArray");
//        System.out.println("theArray==="+theArray);
        int draw = Integer.parseInt(request.getParameter("draw"));
        System.out.println(draw);
        pageData.setStart(Integer.parseInt(start));
        pageData.setLength(Integer.parseInt(length));
        pageData.setKeyword("%"+extra_search.trim()+"%");*/
        //随便组织的查询结果
//        PageData<Supplier> pageData = null;
//        String keyword = pageData.getKeyword();
        try {
            pageData = distributorService.selectWithCondition(pageData);
            /*List<Supplier> data = pageData.getData();
            for (Supplier d:data
                    ) {
                d.setSupType(supType.get(d.getSupType()).toString());
            }
            pageData.setDraw(draw);*/
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("dtbSelect---"+pageData);
        return pageData;
    }
    @RequestMapping("/delAll")
    @ResponseBody
    public int delAll(String[] theArray){
        int i = 0;
        try {
            i = distributorService.deleteAll(theArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
