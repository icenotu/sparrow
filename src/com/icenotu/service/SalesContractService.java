package com.icenotu.service;

import com.icenotu.entity.SalesContract;

/**
 * Created by Administrator on 2016-10-16.
 */
public interface SalesContractService extends BaseService<SalesContract> {
    int insertSalesContract(SalesContract salesContract) throws Exception;
    int deliver(SalesContract salesContract) throws Exception;
}
