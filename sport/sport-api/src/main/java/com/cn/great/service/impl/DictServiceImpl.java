package com.cn.great.service.impl;

import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.mapper.system.DictMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.system.DictEntity;
import com.cn.great.service.DictService;
import com.cn.great.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;


/** 
* @Description: 用户管理Service
* @Author: Stamp.M 
* @Date: 2019/3/21 
*/ 
@Service
public class DictServiceImpl implements DictService {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private DictMapper dictMapper;

    @Override
    public List<DictEntity> getAllType(String typeCode) {
        List<DictEntity> dictList=new ArrayList<>();
        //redis查询
       Map<Object,Object> keys= redisUtil.hmget(Constant.SYSTEM_DICT);
      for(Object key:keys.values()){
           DictEntity dict=(DictEntity)key;
           if(dict.getTypeCode().equals(typeCode)){
               dictList.add(dict);
           }
       }
       //没有查询数据库
       if(dictList.size()==0){
           DictEntity param=new DictEntity();
           param.setTypeCode(typeCode);
           dictList=dictMapper.listByObj(param);
       }
       return dictList;
    }

    @Override
    public DictEntity getByCode(String code) {
            Object timeObj= redisUtil.hget(Constant.SYSTEM_DICT, code);
            if (timeObj==null){
                DictEntity param=new DictEntity();
                param.setCode(code);
                List<DictEntity> entities=dictMapper.listByObj(param);
                timeObj=entities.size()==0?null:entities.get(0);
            }
            return timeObj==null?null:(DictEntity)timeObj;
    }

    @Override
    public String getDictValue(String key) {
        DictEntity dict = getByCode(key);
        if (dict == null) {
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.DICT_NOT_VALUE);
        }
        return dict.getValue();
    }
}
