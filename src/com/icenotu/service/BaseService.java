package com.icenotu.service;

import com.icenotu.entity.PageData;

import java.util.List;


/**
 * Created by Administrator on 2016-09-05.
 */
public interface BaseService<T> {
    int insert(T entity) throws Exception;
    int update(T entity) throws Exception;
    int delete(T entity) throws Exception;
    List<T> select() throws Exception;
//    PageData<T> selectTest() throws Exception;
    PageData<T> selectWithCondition(PageData<T> pageData) throws Exception;
    int deleteAll(String[] pks) throws Exception;
}
