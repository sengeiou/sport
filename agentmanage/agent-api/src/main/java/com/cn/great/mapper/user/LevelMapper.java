package com.cn.great.mapper.user;


import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.user.MemberLevelEntity;
import com.cn.great.req.user.LevelOpeReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LevelMapper {

    List<MemberLevelEntity> fetchUserLevelList(BaseEntity baseEntity);

    Integer countUserLevels(BaseEntity baseEntity);

    void addLevelInfo(LevelOpeReq levelOpeReq);

    void updateLevelInfo(LevelOpeReq levelOpeReq);

    void deleteLevelInfo(Integer id);

}
