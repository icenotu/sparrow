package com.icenotu.service;

import com.icenotu.entity.AccountRecords;
import com.icenotu.entity.BuyOrder;

/**
 * Created by Administrator on 2016-10-10.
 */
public interface BuyOrderService extends BaseService<BuyOrder> {
    int insertBuyOrder(BuyOrder buyOrder) throws Exception;
}
