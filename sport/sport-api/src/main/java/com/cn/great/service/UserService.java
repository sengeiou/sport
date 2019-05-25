package com.cn.great.service;

import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Description: 会员管理Service接口
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface UserService {

    /**
     * @Description: 查询所有会员信息
     * @Param: []
     * @return: java.util.List<com.cn.great.model.user.UserInfoEntity>
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    List<UserInfoEntity> fetchAllUsers();

    /**
     * @Description: 查询所有的代理信息
     * @Param: []
     * @return: java.util.List<com.cn.great.model.user.AgentInfoEntity>
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    List<AgentInfoEntity> fetchAllAgents();

    /**
     * @Description: 查询所有的管理员信息
     * @Param: []
     * @return: java.util.List<com.cn.great.model.user.AdminInfoEntity>
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    List<AdminInfoEntity> fetchAllAdmins();

    /**
     * @Description: 查询所有会员的在线信息
     * @Param: []
     * @return: java.util.List<com.cn.great.model.online.LoginInfoEntity>
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    List<LoginInfoEntity> fetchAllOnlines();

    /**
     * @Description: 获取用户登录信息
     * @Param: [userName]
     * @return: com.cn.great.model.online.LoginInfoEntity
     * @Author: Stamp
     * @Date: 2019/3/31
     */
    LoginInfoEntity getUserLoginInfo(String userName);

    /**
     * @Description: 获取用户信息
     * @Param: [userName]
     * @return: com.cn.great.model.user.UserInfoEntity
     * @Author: Stamp
     * @Date: 2019/3/31
     */
    UserInfoEntity fetchUserInfo(String userName);

    /**
     * @Description: 获取代理信息
     * @Param: [agentName]
     * @return: com.cn.great.model.user.AgentInfoEntity
     * @Author: Stamp
     * @Date: 2019/4/2
     */
    AgentInfoEntity fetchAgentInfo(String agentName);

    /**
     * @Description: 删除用户登录信息
     * @Param: [userName]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/3/31
     */
    void deleteUserLoginInfo(String userName);

    /**
     * @Description: 新增用户登录信息
     * @Param: [loginInfoEntity]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/3/31
     */
    void addUserLoginInfo(LoginInfoEntity loginInfoEntity);

    /**
     * @Description: 新增会员信息
     * @Param: [user]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/2
     */
    void addUserInfo(UserInfoEntity user);

    /**
     * @Description: 新增会员附表信息
     * @Param: [memberInfoEntity]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/2
     */
    void addMemberInfo(MemberInfoEntity memberInfoEntity);

    /**
     * @Description: 新增用户验证码
     * @Param: [userName, capText]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/3
     */
    void addUserCaptcha(String userName, String capText);

    /**
     * @Description: 删除用户注册验证码
     * @Param: [userName]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/3
     */
    void deleteUserCaptcha(String userName);

    /**
     * @Description: 获取验证码
     * @Param: [userName]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/3
     */
    String getCaptchaText(String userName);

    /**
     * @Description: 用户登出
     * @Param: [loginInfo]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/3
     */
    void userLoginout(LoginInfoEntity loginInfo);

    /**
     * @Description: 获取用户副表信息
     * @Param: [userId]
     * @return: com.cn.great.model.user.MemberInfoEntity
     * @Author: Stamp
     * @Date: 2019/4/3
     */
    MemberInfoEntity getMemberInfo(String userName);

    /**
     * @Description: 查询所有会员副表信息
     * @Param: []
     * @return: java.util.List<com.cn.great.model.user.AdminInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/3
     */
    List<MemberInfoEntity> fetchAllMemberInfos();

    /**
     * @Description: 修改会员提款密码
     * @Param: [memberInfo]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/4
     */
    void updateMemberDrawPassword(MemberInfoEntity memberInfo);

    /**
     * @Description: 修改会员密码
     * @Param: [userInfo]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/4
     */
    void updateUserPassword(UserInfoEntity userInfo);

    /**
     * @Description: 查询所有保密问题字典
     * @Param: []
     * @return: java.util.List<com.cn.great.model.user.QuestionEntity>
     * @Author: Stamp
     * @Date: 2019/4/4
     */
    List<QuestionEntity> fetchAllQuestions();

    /**
     * 额度转换 修改余额以及生成日志
     * @param username
     * @param transferType
     * @param amount
     * @param orderId
     */
    void transferBalance(String username, String transferType, BigDecimal amount, String orderId);


    /**
     * 修改用户余额
     * @param userId 用户id
     * @param amount 金额
     * @param reason 修改原因
     * @param id
     */
    void updateBalance(Integer userId, BigDecimal amount, String reason, Integer id);
}
