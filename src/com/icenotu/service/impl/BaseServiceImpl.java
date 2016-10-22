package com.icenotu.service.impl;

import com.icenotu.dao.*;
import com.icenotu.entity.PageData;
import com.icenotu.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.PostConstruct;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by Administrator on 2016-09-28.
 */
public class BaseServiceImpl<T> implements BaseService<T> {
    protected BaseMapper<T> baseMapper;

    @Autowired
    protected SupplierMapper supplierMapper;

    @Autowired
    protected AccountMapper accountMapper;

    @Autowired
    protected SysParamMapper sysParamMapper;

    @Autowired
    protected GoodsMapper goodsMapper;

    @Autowired
    protected AccountRecordsMapper accountRecordsMapper;

    @Autowired
    protected BuyOrderMapper buyOrderMapper;

    @Autowired
    protected BuyOrderDetailMapper buyOrderDetailMapper ;

    @Autowired
    protected StoreHouseMapper storeHouseMapper ;

    @Autowired
    protected DistributorMapper distributorMapper ;

    @Autowired
    protected InventoryMapper inventoryMapper ;

    @Autowired
    protected SalesContractMapper salesContractMapper  ;

    @Autowired
    protected SalesContractDetailMapper salesContractDetailMapper  ;

    @Autowired
    protected SalesCostReportMapper salesCostReportMapper   ;


    @PostConstruct//在构造方法后，初化前执行
    private void initBaseMapper() throws Exception{
        //完成以下逻辑，需要对研发本身进行命名与使用规范
        //this关键字指对象本身，这里指的是调用此方法的实现类（子类）
        System.out.println("=======this :"+this);
        System.out.println("=======父类基本信息："+this.getClass().getSuperclass());
        System.out.println("=======父类和泛型的信息："+this.getClass().getGenericSuperclass());

        ParameterizedType type =(ParameterizedType) this.getClass().getGenericSuperclass();
        //获取第一个参数的class
        Class clazz = (Class)type.getActualTypeArguments()[0];
        System.out.println("=======class:"+clazz);
        //转化为属性名（相关的Mapper子类的引用名）Supplier  supplierMapper
        String localField = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1)+"Mapper";
        System.out.println("=======localField:"+localField);
        //getDeclaredField:可以使用于包括私有、默认、受保护、公共字段，但不包括继承的字段
        Field field=this.getClass().getSuperclass().getDeclaredField(localField);
        System.out.println("=======field:"+field);
        System.out.println("=======field对应的对象:"+field.get(this));
        Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");

        System.out.println("=======baseField:"+baseField);
        System.out.println("=======baseField对应的对象:"+baseField.get(this));
        //field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中
        baseField.set(this, field.get(this));
        System.out.println("========baseField对应的对象:"+baseMapper);

    }

    @Override
    public int insert(T entity) throws Exception {
        return baseMapper.insert(entity);
    }

    @Override
    public int update(T entity) throws Exception {
        return baseMapper.update(entity);
    }

    @Override
    public int delete(T entity) throws Exception {
        return baseMapper.delete(entity);
    }

    @Override
    public List<T> select() throws Exception {
        return baseMapper.select();
    }

    @Override
    public PageData<T> selectWithCondition(PageData<T> pageData) throws Exception {
        pageData.setData(baseMapper.selectWithCondition(pageData));
        int i = baseMapper.selectCountWithCondition(pageData);
        pageData.setiTotalRecords(i);
        pageData.setiTotalDisplayRecords(i);
        return pageData;
    }

    @Override
    public int deleteAll(String[] pks) throws Exception {
        return baseMapper.deleteAll(pks);
    }
}
