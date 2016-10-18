package com.icenotu.action;

import com.icenotu.entity.PageData;
import com.icenotu.entity.Supplier;
import com.icenotu.service.SupplierService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-08-29.
 */
@Controller
@RequestMapping("/supplier")
public class SupplierAction {
    @Autowired
    private SupplierService supplierService;

    @Autowired
    private ServletContext servletContext;

    @RequestMapping(value = "/insert")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public int insert(Supplier supplier) {
        System.out.println("---action.supplier"+supplier);
        int i = 0;
        try {
            i = supplierService.insert(supplier);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }


    @RequestMapping(value = "/update")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public int update(Supplier supplier) {
        System.out.println("---action.supplier"+supplier);
        int i = 0;
        try {
            i = supplierService.update(supplier);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
    /**
     * 测试json
     */
    @RequestMapping("/doAjax")
    @ResponseBody //如果返回json格式需要这个注解 这里用来测试环境
    public Object doAjax(Supplier supplier) {
        System.out.println("---doAjax.supplier:" + supplier);
        supplier.setSupName("supName1");
        System.out.println(supplier);
        return supplier;
    }


    @RequestMapping("/dataTest")
    @ResponseBody
    public PageData<Supplier> dataTest(HttpServletRequest request,PageData<Supplier> pageData){
        //获取分页控件的信息
//        request.setCharacterEncoding("utf-8");
        Map<String,Object> sysParamMap = (Map<String, Object>) servletContext.getAttribute("sysParamMap");
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
        pageData.setKeyword("%"+extra_search.trim()+"%");
        //随便组织的查询结果
//        PageData<Supplier> pageData = null;
        String keyword = pageData.getKeyword();
        try {
            pageData = supplierService.selectWithCondition(pageData);
            List<Supplier> data = pageData.getData();
            for (Supplier d:data
                 ) {
                d.setSupType(supType.get(d.getSupType()).toString());
            }
            pageData.setDraw(draw);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(pageData);
        return pageData;
    }
    @RequestMapping("/delSupplier")
    @ResponseBody
    public int delSupplier(String[] theArray){
        System.out.println("del运行");
        for (int i=0;i<theArray.length;i++) {
            System.out.println(theArray[i]);
        }
        int i = 0;
        try {
            i = supplierService.deleteAll(theArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

}
