package com.icenotu.dao;

import com.icenotu.entity.Account;

public interface AccountMapper extends BaseMapper<Account>{
    /*int deleteByPrimaryKey(Integer accId);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer accId);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);*/

    Account login(Account account);
}