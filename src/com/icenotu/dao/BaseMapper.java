package com.icenotu.dao;

import com.icenotu.entity.PageData;

import java.util.List;

/**
 * Created by Administrator on 2016-09-05.
 */
public interface BaseMapper<T> {
    int insert(T entity) throws Exception;
    int update(T entity) throws Exception;
    int delete(T entity) throws Exception;
    List<T> select() throws Exception;
    int selectCount() throws Exception;

    List<T> selectWithCondition(PageData<T> pageData) throws Exception;
    int selectCountWithCondition(PageData<T> pageData) throws Exception;

    //    int select(T entity);
    int deleteAll(String[] pks);
}
