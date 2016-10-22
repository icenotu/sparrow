package com.icenotu.service.impl;

import com.icenotu.entity.AccountRecords;
import com.icenotu.entity.BuyOrder;
import com.icenotu.entity.BuyOrderDetail;
import com.icenotu.entity.Inventory;
import com.icenotu.service.BuyOrderService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016-10-10.
 */
@Service("buyOrderService")
public class BuyOrderServiceImpl extends BaseServiceImpl<BuyOrder> implements BuyOrderService{
    @Override
    public int insertBuyOrder(BuyOrder buyOrder) throws Exception {
        String boId = "bo" + UUID.randomUUID().toString().replace("-", "");
        buyOrder.setBoId(boId);
        int i = buyOrderMapper.insert(buyOrder);
        List<BuyOrderDetail> buyOrderDetails = buyOrder.getBuyOrderDetails();
        for (BuyOrderDetail bod:buyOrderDetails
             ) {
            bod.setBodId(UUID.randomUUID().toString().replace("-",""));
            bod.setBoId(boId);
        }
        buyOrderDetailMapper.insertList(buyOrderDetails);
        AccountRecords accountRecords = new AccountRecords();
        accountRecords.setArId("ar"+UUID.randomUUID().toString().replace("-",""));
        accountRecords.setArAttn(buyOrder.getBoAttn());
        accountRecords.setArArrears(buyOrder.getBoArrears());
        //bo表示商品采购，可以在参数表中加入相关内容
        accountRecords.setArBusType("bo");
        accountRecords.setArDate(buyOrder.getBoDate());
        //优惠金额：用应付金额减去实付金额再减去欠款
        accountRecords.setArDiscount(buyOrder.getBoPayable().subtract(buyOrder.getBoPaid()).subtract(buyOrder.getBoArrears()));
        accountRecords.setArOperator(buyOrder.getBoOperator());
        //采购单号
        accountRecords.setArOrderId(buyOrder.getBoId());
        accountRecords.setArPaid(buyOrder.getBoPaid());
        accountRecords.setArPayable(buyOrder.getBoPayable());
        accountRecords.setArRemark(buyOrder.getBoRemark());
        accountRecords.setSupId(buyOrder.getSupId().toString());
        accountRecordsMapper.insert(accountRecords);
        //入库操作
        List<Inventory> ivList = new ArrayList<>();
        for (BuyOrderDetail bod:buyOrderDetails
                ) {
            Inventory inventory = new Inventory();
            inventory.setIvId("iv"+UUID.randomUUID().toString().replace("-",""));
            inventory.setShId(buyOrder.getShId());
            inventory.setBodId(bod.getBodId());
            inventory.setGoodsId(bod.getGoodsId());
            inventory.setGoodsName(bod.getGoodsName());
            inventory.setGoodsColor(bod.getGoodsColor());
            inventory.setGoodsType(bod.getGoodsType());
            inventory.setGoodsUnit(bod.getGoodsUnit());
            inventory.setIvAmount(bod.getBodAmount());
//            inventory.setIvTotalCost(buyOrder.getBoPaid().add(buyOrder.getBoArrears()));
//            inventory.setIvUnitCost(inventory.getIvTotalCost().divide(new BigDecimal(bod.getBodAmount()),2,4));
            inventory.setIvUnitCost(bod.getBodBuyPrice());
            inventory.setIvTotalCost(bod.getBodTotalPrice());
            inventory.setBodImeiList(bod.getBodImeiList());
            inventory.setBoDate(buyOrder.getBoDate());
            inventory.setIvType("bo");
            System.out.println("inventory--"+inventory);
            ivList.add(inventory);
        }
        System.out.println("ivList--"+ivList);
        inventoryMapper.insertList(ivList);
        return i;
    }
}
