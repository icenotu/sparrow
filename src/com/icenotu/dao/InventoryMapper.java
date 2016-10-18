package com.icenotu.dao;


import com.icenotu.entity.Inventory;

import java.util.List;


public interface InventoryMapper extends BaseMapper<Inventory>{
    int insertList(List<Inventory> inventories);
    /*int deleteByPrimaryKey(String ivId);

    int insert(Inventory record);

    int insertSelective(Inventory record);

    Inventory selectByPrimaryKey(String ivId);

    int updateByPrimaryKeySelective(Inventory record);

    int updateByPrimaryKeyWithBLOBs(Inventory record);

    int updateByPrimaryKey(Inventory record);*/
}