package com.cn.great.mapper.system;

import com.cn.great.model.system.ProxyIp;

public interface ProxyIpMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProxyIp record);

    int insertSelective(ProxyIp record);

    ProxyIp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProxyIp record);

    int updateByPrimaryKey(ProxyIp record);
}