package com.icenotu.dao;

import com.icenotu.entity.SalesContractDetail;

import java.util.List;

public interface SalesContractDetailMapper extends BaseMapper<SalesContractDetail>{
    int insertList(List<SalesContractDetail> salesContractDetails);

    List<SalesContractDetail> selectByScId(String scId);
    /*int deleteByPrimaryKey(String scdId);

    int insert(SalesContractDetail record);

    int insertSelective(SalesContractDetail record);

    SalesContractDetail selectByPrimaryKey(String scdId);

    int updateByPrimaryKeySelective(SalesContractDetail record);

    int updateByPrimaryKeyWithBLOBs(SalesContractDetail record);

    int updateByPrimaryKey(SalesContractDetail record);*/
}