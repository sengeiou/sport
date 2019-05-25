package com.cn.great.mapper.system;

import com.cn.great.model.system.CaptchaRecord;

public interface CaptchaRecordMapper {
    int insert(CaptchaRecord record);

    int insertSelective(CaptchaRecord record);
}