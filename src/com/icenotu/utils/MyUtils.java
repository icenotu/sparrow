package com.icenotu.utils;

import com.icenotu.entity.SysParam;
import com.icenotu.service.SysParamService;

import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-10-01.
 */
public class MyUtils {
    public static void readSysParam(SysParamService sysParamService,ServletContext servletContext) {
        Map<String, Object> sysParamMap = new HashMap<>();
        /*Map<String, Object> supTypeMap = new HashMap<>();
        Map<String, Object> goodsColorMap = new HashMap<>();*/
        HashSet<String> typeSet = new HashSet<>();
        try {
            List<SysParam> sysParamList = sysParamService.select();
            for (SysParam spl:sysParamList
                    ) {
                typeSet.add(spl.getSysParamField());
                /*switch (spl.getSysParamField()) {
                    case "supType":
                        supTypeMap.put(spl.getSysParamValue(),spl.getSysParamText());
                        break;
                    case "goodsColor":
                        goodsColorMap.put(spl.getSysParamValue(), spl.getSysParamText());
                        break;
                    default:
                        break;
                }*/
            }

            for (String s:typeSet
                    ) {
                Map<String, Object> a = new HashMap<>();
                for (SysParam spl:sysParamList
                        ) {
                    if (s.equals(spl.getSysParamField())) {
                        a.put(spl.getSysParamValue(), spl.getSysParamText());
                    }
                }
                sysParamMap.put(s,a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

//        sysParamMap.put("supType", supTypeMap);
//        sysParamMap.put("goodsColors", goodsColorMap);
        System.out.println(sysParamMap);
        servletContext.setAttribute("sysParamMap",sysParamMap);
    }
}
