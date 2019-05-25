package com.cn.great.mapper.discount;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ReceiveMapper {

    /**
     * 根据用户id,用户名字,用户登录的ip 判断是否领取过红包
     * @param userId
     * @param ip
     * @param conditionId
     * @return
     */
    int receiveBoolean(@Param("userId") int userId,@Param("ip") String ip,@Param("conditionId") int conditionId);

    /**
     * 领取红包之后，新增一条领取红包记录
     * @param userId
     * @param num
     * @param ip
     * @param format
     * @param id
     * @param admin
     */
    int addReceive(Integer userId, int num, String ip, String format, int id, String admin);
}
