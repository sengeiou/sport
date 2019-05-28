package com.cn.great.service;

import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.*;
import com.cn.great.req.user.*;

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
     * @Description: 修改用户登录状态
     * @Param: [loginInfoEntity]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/19
     */
    void updateLoginInfo(String userName);

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
    Integer addUserInfo(UserInfoEntity user);

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
     * @Description: 查询管理员信息
     * @Param: [jobReq]
     * @return: java.util.List<com.cn.great.model.user.AdminInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/10
     */
    List<AdminInfoEntity> fetchAdminList(UserReq userReq);

    /**
     * @Description: 查询管理员总数
     * @Param: [jobReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    Integer countAdmins(UserReq userReq);

    /**
     * @Description: 会员列表查询
     * @Param: [userInfoReq]
     * @return: java.util.List<com.cn.great.model.user.UserEntity>
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    List<UserEntity> fetchUserList(UserInfoReq userInfoReq);

    /**
     * @Description: 会员数统计
     * @Param: [userInfoReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    Integer countUsers(UserInfoReq userInfoReq);

    /**
     * @Description: 新增管理员
     * @Param: [userAddReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/13
     */
    void addSystemAdmin(UserAddReq userAddReq);

    /**
     * @Description: 校验管理员用户名是否已存在
     * @Param: [userName]
     * @return: boolean
     * @Author: Stamp
     * @Date: 2019/4/13
     */
    boolean checkAdminNameExist(String userName);

    /**
     * @Description: 校验会员是否已经存在
     * @Param: [userName]
     * @return: boolean
     * @Author: Stamp
     * @Date: 2019/5/15
     */
    boolean checkUserNameExist(String userName);

    /**
     * @Description: 修改账号
     * @Param: [userUpdateReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/13
     */
    void updateSystemAdmin(UserUpdateReq userUpdateReq);

    /**
     * @Description: 删除管理员
     * @Param: [id]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/13
     */
    void deleteSystemAdmin(Integer id);

    /**
     * @Description: 查询所有的权限
     * @Param: []
     * @return: java.util.List<com.cn.great.model.auth.AuthInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/16
     */
    List<AuthInfoEntity> fetchAllAuths();

    /**
     * @Description: 查询用户所有的权限
     * @Param: [userName]
     * @return: java.util.List<com.cn.great.model.auth.AuthInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/16
     */
    List<AuthInfoEntity> fetchOwenAuths(String userName);

    /**
     * @Description: 管理员查询
     * @Param: [userName]
     * @return: java.util.List<com.cn.great.model.user.AdminInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/17
     */
    List<AdminInfoEntity> fetchAdminByName(String userName);

    /**
     * @Description: 重置代理用户的密码
     * @Param: [resetPwdReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/26
     */
    void updateAgentPwd(ResetPwdReq resetPwdReq);

    /**
     * @Description: 查询所有的支付层级信息
     * @Param: []
     * @return: java.util.List<com.cn.great.model.user.PayLevelEntity>
     * @Author: Stamp
     * @Date: 2019/5/14
     */
    List<PayLevelEntity> fetchAllPayLevel();

    /**
     * @Description: 根据用户名查询会员
     * @Param: [userName]
     * @return: com.cn.great.model.user.UserInfoEntity
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    UserInfoEntity fetchUserByName(String userName);

    /**
     * @Description: 修改会员信息
     * @Param: [userOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/16
     */
    void updateUserInfo(UserOpeReq userOpeReq);

    /**
     * @Description: 修改会员篮球下注限制
     * @Param: [userInfoReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/19
     */
    void updateMemberBkLimit(UserInfoReq userInfoReq);

    /**
     * @Description: 修改会员足球下注限制
     * @Param: [userInfoReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/19
     */
    void updateMemberFTLimit(UserInfoReq userInfoReq);

}
