package com.icenotu.action;

import com.icenotu.entity.Inventory;
import com.icenotu.entity.PageData;
import com.icenotu.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2016-10-14.
 */
@Controller
@RequestMapping("/inventory")
public class InventoryAction {
    @Autowired
    InventoryService inventoryService;

    @RequestMapping("/select")
    @ResponseBody
    public PageData<Inventory> select(PageData<Inventory> pageData) {
        try {
            pageData = inventoryService.selectWithCondition(pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("inventoryAction---" + pageData);
        return pageData;
    }
}
