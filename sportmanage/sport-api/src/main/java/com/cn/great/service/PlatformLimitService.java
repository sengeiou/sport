package com.cn.great.service;

import com.cn.great.model.game.MemberBkConfig;
import com.cn.great.model.game.MemberBkDeConfig;
import com.cn.great.model.game.MemberFtConfig;
import com.cn.great.model.game.MemberFtDeConfig;

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
    List<MemberBkConfig> fetchDefaultBKConfigs();

    /**
     * @Description: 查询足球平台限额
     * @Param: []
     * @return: java.util.List<com.cn.great.model.game.MemberFtConfig>
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    List<MemberFtConfig> fetchDefaultFTConfigs();

    /**
     * @Description: 新增平台篮球限额
     * @Param: [memberBkConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void addBkPlatformConfig(MemberBkConfig memberBkConfig);

    /**
     * @Description: 新增篮球默认限额
     * @Param: [memberBkDeConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void addBkDePlatformConfig(MemberBkDeConfig memberBkDeConfig);

    /**
     * @Description: 修改篮球平台限额
     * @Param: [memberBkConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void updateBkPlatformConfig(MemberBkConfig memberBkConfig);

    /**
     * @Description: 修改默认篮球限额
     * @Param: [memberBkDeConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void updateBkDeConfig(MemberBkDeConfig memberBkDeConfig);

    /**
     * @Description: 新增平台足球限额
     * @Param: [memberBkConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void addFTPlatformConfig(MemberFtConfig memberFtConfig);

    /**
     * @Description: 新增足球默认限额
     * @Param: [memberBkDeConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void addFTDePlatformConfig(MemberFtDeConfig memberFtDeConfig);

    /**
     * @Description: 修改足球平台限额
     * @Param: [memberBkConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void updateFTPlatformConfig(MemberFtConfig memberFtConfig);

    /**
     * @Description: 修改默认足球限额
     * @Param: [memberBkDeConfig]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/17
     */
    void updateFTDeConfig(MemberFtDeConfig memberFtDeConfig);

}
