package com.cn.great.service;

import com.cn.great.model.system.DictEntity;

import java.util.List;

/**
 * @Description: 会员管理Service接口
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface DictService {

    /**
     * 获取所有维护相关的i洗脑洗
     * @return
     * @param typeCode
     */
    List<DictEntity> getAllType(String typeCode);

    /**
     * 根据code获取对象
     * @param code
     * @return
     */
    DictEntity getByCode(String code);

    /**
     *
     * @param key
     * @return
     */
    String getDictValue(String key);
}
