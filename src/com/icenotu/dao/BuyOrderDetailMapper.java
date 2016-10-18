package com.icenotu.dao;

import com.icenotu.entity.BuyOrderDetail;

import java.util.List;

public interface BuyOrderDetailMapper extends BaseMapper<BuyOrderDetail>{
    int insertList(List<BuyOrderDetail> buyOrderDetails);
    /*int deleteByPrimaryKey(String bodId);

    int insert(BuyOrderDetail record);

    int insertSelective(BuyOrderDetail record);

    BuyOrderDetail selectByPrimaryKey(String bodId);

    int updateByPrimaryKeySelective(BuyOrderDetail record);

    int updateByPrimaryKeyWithBLOBs(BuyOrderDetail record);

    int updateByPrimaryKey(BuyOrderDetail record);*/
}