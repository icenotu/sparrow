package com.icenotu.service.impl;

import com.icenotu.dao.SupplierMapper;
import com.icenotu.entity.PageData;
import com.icenotu.entity.Supplier;
import com.icenotu.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016-08-29.
 */
@Service("supplierService")
public class SupplierServiceImpl extends BaseServiceImpl<Supplier> implements SupplierService{

//    @Autowired
//    private SupplierMapper supplierMapper;
//    @Override
//    public int insert(Supplier supplier) throws Exception {
//        return supplierMapper.insert(supplier);
//    }
//
//    @Override
//    public int update(Supplier entity) throws Exception {
//        return supplierMapper.update(entity);
//    }
//
//    @Override
//    public int delete(Supplier entity) throws Exception {
//        return 0;
//    }

    /*@Override
    public PageData<Supplier> selectTest() throws Exception {
        List<Supplier> supplierList = supplierMapper.select();
        int selectCount = supplierMapper.selectCount();
        PageData<Supplier> pageData = new PageData<>();
        List<List<String>> arrayData = new ArrayList<>();
        for (Supplier supplier:supplierList
             ) {
            ArrayList<String> strings = new ArrayList<>();
            strings.add(String.valueOf(supplier.getSupId()));
            strings.add(supplier.getSupName());
            strings.add(supplier.getSupLinkman());
            strings.add(supplier.getSupPhone());
            strings.add(supplier.getSupAddress());
            strings.add(supplier.getSupRemark());
            System.out.println(strings);
            arrayData.add(strings);
        }
        System.out.println(arrayData);
//        pageData.setAaData(supplierList);
//        pageData.setData(arrayData);
        pageData.setiTotalRecords(selectCount);
        pageData.setiTotalDisplayRecords(selectCount);
        return pageData;
    }*/

    /*@Override
    public PageData<Supplier> selectWithCondition(PageData<Supplier> pageData) throws Exception {
        List<Supplier> supplierList = supplierMapper.selectWithCondition(pageData);
        int selectCount = supplierMapper.selectCountWithCondition(pageData);
        pageData.setData(supplierList);
        pageData.setiTotalRecords(selectCount);
        pageData.setiTotalDisplayRecords(selectCount);
        return pageData;
    }*/

    /*@Override
    public int deleteAll(String[] pks) throws Exception {
        return supplierMapper.deleteAll(pks);
    }*/


}
