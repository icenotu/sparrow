package com.icenotu.service.impl;

import com.icenotu.dao.AccountMapper;
import com.icenotu.entity.Account;
import com.icenotu.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2016-09-06.
 */
@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService {
    /*@Override
    public int insert(Account entity) throws Exception {
        return 0;
    }

    @Override
    public int update(Account entity) throws Exception {
        return 0;
    }

    @Override
    public int delete(Account entity) throws Exception {
        return 0;
    }

    @Override
    public PageData<Account> selectTest() throws Exception {
        return null;
    }

    @Override
    public PageData<Account> selectWithCondition(PageData<Account> pageData) throws Exception {
        return null;
    }

    @Override
    public int deleteAll(String[] pks) throws Exception {
        return 0;
    }*/

    @Autowired
    private AccountMapper accountMapper;
    @Override
    public Account login(Account account) throws Exception {
        return accountMapper.login(account);
    }
}
