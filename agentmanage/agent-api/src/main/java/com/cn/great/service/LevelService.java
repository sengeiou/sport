package com.cn.great.service;

import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.user.MemberLevelEntity;
import com.cn.great.req.user.LevelOpeReq;

import java.util.List;

/**
 * @program: agentmanage
 * @description: 会员等级service
 * @author: Stamp
 * @create: 2019-04-17 11:16
 **/
public interface LevelService {
    /**
     * @Description: 查询会员等级列表
     * @Param: [serverAdmin]
     * @return: java.util.List<com.cn.great.model.user.MemberLevelEntity>
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    List<MemberLevelEntity> fetchUserLevelList(BaseEntity baseEntity);

    /**
     * @Description: 会员总数统计
     * @Param: [serverAdmin]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    Integer countUserLevels(BaseEntity baseEntity);

    /**
     * @Description: 新增会员等级信息
     * @Param: [levelOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    void addLevelInfo(LevelOpeReq levelOpeReq);

    /**
     * @Description: 修改会员等级信息
     * @Param: [levelOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    void updateLevelInfo(LevelOpeReq levelOpeReq);

    /**
     * @Description: 删除会员等级信息
     * @Param: [id]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    void deleteLevelInfo(Integer id);

}
