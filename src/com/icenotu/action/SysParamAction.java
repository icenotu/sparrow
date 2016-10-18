package com.icenotu.action;

import com.icenotu.entity.PageData;
import com.icenotu.entity.SysParam;
import com.icenotu.service.SysParamService;
import com.icenotu.utils.MyUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016-09-30.
 */
@Controller
@RequestMapping("/sysParam")
public class SysParamAction{
    @Autowired
    protected SysParamService sysParamService;
    @Autowired
    private ServletContext servletContext;

    @RequestMapping("/selectSupType")
    @ResponseBody
    public PageData<SysParam> selectSupType(PageData<SysParam> pageData) {
        try {
            pageData = sysParamService.selectWithCondition(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }

    @RequestMapping("/selectGoodsColor")
    @ResponseBody
    public PageData<SysParam> selectGoodsColor(PageData<SysParam> pageData) {
        try {
//            pageData.setParamType("supType");
            pageData = sysParamService.selectWithCondition(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageData;
    }

    @RequestMapping("/insertSysParam")
    @ResponseBody
    public int insertSysParam(SysParam sysParam) {
        int i = 0;
        try {
            i = sysParamService.insert(sysParam);
        } catch (Exception e) {
            e.printStackTrace();
        }
        MyUtils.readSysParam(sysParamService,servletContext);
        return i;
    }

    @RequestMapping("/updateSysParam")
    @ResponseBody
    public int updateSysParam(SysParam sysParam) {
        int i = 0;
        try {
            System.out.println("aa");
            i = sysParamService.update(sysParam);
        } catch (Exception e) {
            e.printStackTrace();
        }
        MyUtils.readSysParam(sysParamService,servletContext);
        return i;
    }

    @RequestMapping("/delSysParam")
    @ResponseBody
    public int delSysParam(String[] theArray) {
        for (int i=0;i<theArray.length;i++) {
            System.out.println(theArray[i]);
        }
        int i = 0;
        try {
            i = sysParamService.deleteAll(theArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
        MyUtils.readSysParam(sysParamService,servletContext);
        return i;
    }
}
