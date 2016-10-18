package com.icenotu.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

/**
 * Created by Administrator on 2016-09-05.
 */
@Controller
@RequestMapping("/base")
public class BaseAction {
    @Resource
    public ServletContext application;

    @RequestMapping("/goURL/{folder}/{file}")
    public String goURL(@PathVariable String folder, @PathVariable String file) {
        System.out.println("goURL.forder|file===" + folder + "/" + file);
        return "/WEB-INF/pages/" + folder + "/" + file + ".jsp";
    }

    @RequestMapping("/ecommerce")
    public String test() {
        return "/WEB-INF/pages/tables_dynamic.jsp";
    }


}
