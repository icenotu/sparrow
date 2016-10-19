package com.icenotu.dao;

import com.icenotu.entity.SalesContract;

public interface SalesContractMapper extends BaseMapper<SalesContract>{
    SalesContract selectByScId(String scId);

    int updateStatus(SalesContract salesContract);
    /*int deleteByPrimaryKey(String scId);

    int insert(SalesContract record);

    int insertSelective(SalesContract record);

    SalesContract selectByPrimaryKey(String scId);

    int updateByPrimaryKeySelective(SalesContract record);

    int updateByPrimaryKey(SalesContract record);*/
}