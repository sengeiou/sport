package com.cn.great.mapper.system;

import com.cn.great.model.system.PayRecord;

public interface PayRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PayRecord record);

    int insertSelective(PayRecord record);

    PayRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PayRecord record);

    int updateByPrimaryKey(PayRecord record);
}