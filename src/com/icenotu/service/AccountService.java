package com.icenotu.service;

import com.icenotu.entity.Account;

/**
 * Created by Administrator on 2016-08-29.
 */
public interface AccountService extends BaseService<Account>{
    Account login(Account account) throws Exception;
}
