package com.icenotu.service.impl;

import com.icenotu.entity.AccountRecords;
import com.icenotu.entity.Inventory;
import com.icenotu.entity.SalesContract;
import com.icenotu.entity.SalesContractDetail;
import com.icenotu.service.SalesContractService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
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

    @Override
    public int deliver(SalesContract salesContract) throws Exception {
        String scId = salesContract.getScId();
        SalesContract contract = salesContractMapper.selectByScId(scId);
        System.out.println("deliverImpl"+contract);
        List<SalesContractDetail> salesContractDetails = salesContractDetailMapper.selectByScId(scId);
        System.out.println("deliverImpl"+salesContractDetails);
        Date myDate = new Date();
        contract.setScStatus(1);
        int i=0;
        i = salesContractMapper.updateStatus(contract);
        AccountRecords accountRecords = new AccountRecords();
        accountRecords.setArId("ar"+UUID.randomUUID().toString().replace("-",""));
        accountRecords.setArAttn(contract.getScAttn());
        accountRecords.setArArrears(contract.getScReceivable().subtract(contract.getScAdvanced()).subtract(contract.getScDiscount()));
        //bo表示商品采购，可以在参数表中加入相关内容
        accountRecords.setArBusType("sc");
        accountRecords.setArDate(myDate);
        accountRecords.setArDiscount(contract.getScDiscount());
        accountRecords.setArOperator(contract.getScOperator());
        //采购单号
        accountRecords.setArOrderId(contract.getScId());
        accountRecords.setArPaid(contract.getScAdvanced());
        accountRecords.setArPayable(contract.getScReceivable());
        accountRecords.setArRemark(contract.getScRemark());
        accountRecords.setSupId(contract.getDtbId());
        accountRecordsMapper.insert(accountRecords);
        //入库操作
        List<Inventory> ivList = new ArrayList<>();
        for (SalesContractDetail scd :salesContractDetails
                ) {
            Inventory inventory = new Inventory();
            inventory.setIvId("iv"+UUID.randomUUID().toString().replace("-",""));
            inventory.setShId(scd.getShId());
            inventory.setBodId(scd.getScdId());
            inventory.setGoodsId(scd.getGoodsId());
            inventory.setGoodsName(scd.getGoodsName());
            inventory.setGoodsColor(scd.getGoodsColor());
            inventory.setGoodsType(scd.getGoodsType());
            inventory.setGoodsUnit(scd.getGoodsUnit());
            inventory.setIvAmount(scd.getScdAmount()*(-1));
            inventory.setIvTotalCost(new BigDecimal(0));
            inventory.setIvUnitCost(inventory.getIvTotalCost().divide(new BigDecimal(scd.getScdAmount()),2,4));
            inventory.setBodImeiList(scd.getScdImeiList());
            inventory.setBoDate(myDate);
            inventory.setIvType("sc");
            System.out.println("inventory--"+inventory);
            ivList.add(inventory);
        }
        System.out.println("ivList--"+ivList);
        inventoryMapper.insertList(ivList);

        return i;
    }
}
