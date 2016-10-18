package com.icenotu.service.impl;

import com.icenotu.entity.SalesContract;
import com.icenotu.entity.SalesContractDetail;
import com.icenotu.service.SalesContractService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016-10-16.
 */
@Service("salesContractService")
public class SalesContractServiceImpl extends BaseServiceImpl<SalesContract> implements SalesContractService {
    @Override
    public int insertSalesContract(SalesContract salesContract) throws Exception {
        String scId = "sc" + UUID.randomUUID().toString().replace("-", "");
        salesContract.setScId(scId);
        int i = salesContractMapper.insert(salesContract);
        List<SalesContractDetail> salesContractDetails = salesContract.getSalesContractDetails();
        for (SalesContractDetail scd:salesContractDetails
             ) {
            scd.setScId(scId);
            scd.setScdId("scd" + UUID.randomUUID().toString().replace("-", ""));
        }
        salesContractDetailMapper.insertList(salesContractDetails);
        return i;
    }
}
