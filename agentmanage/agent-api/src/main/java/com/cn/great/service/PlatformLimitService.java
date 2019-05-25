package com.cn.great.service;

import com.cn.great.model.game.MemberBkConfig;
import com.cn.great.model.game.MemberFtConfig;
import com.cn.great.req.game.MemberBKConfigReq;
import com.cn.great.req.game.MemberFTConfigReq;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 平台请求service
 * @author: Stamp
 * @create: 2019-05-16 16:25
 **/
public interface PlatformLimitService {

    /**
     * @Description: 查询平台限额
     * @Param: []
     * @return: java.util.List<com.cn.great.model.game.MemberBkConfig>
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    List<MemberBkConfig> fetchDefaultBKConfigs(Integer id);

    /**
     * @Description: 查询足球平台限额
     * @Param: []
     * @return: java.util.List<com.cn.great.model.game.MemberFtConfig>
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    List<MemberFtConfig> fetchDefaultFTConfigs(Integer id);

    /**
     * @Description: 新增平台篮球限额
     * @Param: [memberBkConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void addBkPlatformConfig(MemberBKConfigReq memberBKConfigReq);

    /**
     * @Description: 修改篮球平台限额
     * @Param: [memberBkConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void updateBkPlatformConfig(MemberBKConfigReq memberBKConfigReq);

    /**
     * @Description: 新增平台足球限额
     * @Param: [memberBkConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void addFTPlatformConfig(MemberFTConfigReq memberFTConfigReq);

    /**
     * @Description: 修改足球平台限额
     * @Param: [memberBkConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void updateFTPlatformConfig(MemberFTConfigReq memberFTConfigReq);

}
