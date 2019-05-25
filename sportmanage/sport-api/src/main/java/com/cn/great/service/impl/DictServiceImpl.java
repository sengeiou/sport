package com.cn.great.service.impl;

import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.mapper.system.DictMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.system.DictEntity;
import com.cn.great.model.system.EnumType;
import com.cn.great.req.system.EnumOpeReq;
import com.cn.great.req.system.EnumReq;
import com.cn.great.service.DictService;
import com.cn.great.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


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
    public List<EnumType> fetchAllEnumTypes() {
        return dictMapper.fetchAllEnumTypes();
    }

    @Override
    public List<DictEntity> fetchEnums(EnumReq enumReq) {
        return dictMapper.fetchEnums(enumReq);
    }

    @Override
    public Integer countEnums(EnumReq enumReq) {
        return dictMapper.countEnums(enumReq);
    }

    @Transactional
    @Override
    public void addEnum(EnumOpeReq enumOpeReq) {
        dictMapper.addEnum(enumOpeReq);
    }

    @Transactional
    @Override
    public void updateEnum(EnumOpeReq enumOpeReq) {
        dictMapper.updateEnum(enumOpeReq);
    }

    @Transactional
    @Override
    public void deleteEnum(Integer id) {
        dictMapper.deleteEnum(id);
    }

    @Override
    public boolean checkEnumExist(EnumOpeReq enumOpeReq) {
        List<DictEntity> dictEntities = dictMapper.fetchEnumList(enumOpeReq);
        return CollectionUtils.isEmpty(dictEntities);
    }

    @Override
    public boolean checkEnumTypeExist(EnumOpeReq enumOpeReq, Integer type) {
        List<EnumType> types = dictMapper.fetchTypes(enumOpeReq);
        if(type == 0){
            return CollectionUtils.isEmpty(types);
        }else{
            return types.size() <= 1;
        }

    }


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
       return dictList.stream().sorted(Comparator.comparing(DictEntity::getSort)).collect(Collectors.toList());
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
    @Transactional
    @Override
    public void updateDictObj(List<DictEntity> data) {
        for(DictEntity dict:data){
            DictEntity dictEntity=(DictEntity) redisUtil.hget(Constant.SYSTEM_DICT,dict.getCode());
            if(dictEntity!=null){
                dictEntity.setValue(dict.getValue());
                redisUtil.hset(Constant.SYSTEM_DICT,dict.getCode(),dictEntity);
            }
            dictMapper.updateValue(dict);

        }

    }

    @Override
    public List<EnumType> fetchEnumTypes(EnumReq enumReq) {
        return dictMapper.fetchEnumTypes(enumReq);
    }

    @Override
    public Integer countEnumTypes(EnumReq enumReq) {
        return dictMapper.countEnumTypes(enumReq);
    }

    @Transactional
    @Override
    public void addEnumType(EnumOpeReq enumOpeReq) {
         dictMapper.addEnumType(enumOpeReq);
    }

    @Transactional
    @Override
    public void updateEnumType(EnumOpeReq enumOpeReq) {
        dictMapper.updateEnumType(enumOpeReq);
    }

    @Transactional
    @Override
    public void deleteEnumType(String code) {
        dictMapper.deleteEnumType(code);
    }
}
