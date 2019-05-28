package com.cn.great.service.impl;

import com.cn.great.exception.GeneralException;
import com.cn.great.mapper.user.UserMapper;
import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.*;
import com.cn.great.req.user.*;
import com.cn.great.service.UserService;
import com.cn.great.util.DateUtils;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;


/**
 * @Description: 用户管理Service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */
@Service
@Slf4j
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RedisUtil redisUtil;

    @Override
    public List<UserInfoEntity> fetchAllUsers() {
        List<UserInfoEntity> users = new ArrayList<>();
        users.addAll(userMapper.fetchAllUsers());
        return users;
    }

    @Override
    public List<AgentInfoEntity> fetchAllAgents() {
        List<AgentInfoEntity> agents = new ArrayList<>();
        agents.addAll(userMapper.fetchAllAgents());
        return agents;
    }

    @Override
    public List<AdminInfoEntity> fetchAllAdmins() {
        List<AdminInfoEntity> admins = new ArrayList<>();
        admins.addAll(userMapper.fetchAllAdmins());
        return admins;
    }

    @Override
    public List<LoginInfoEntity> fetchAllOnlines() {
        List<LoginInfoEntity> onlines = new ArrayList<>();
        onlines.addAll(userMapper.fetchAllOnlines());
        return onlines;
    }

    @Override
    public LoginInfoEntity getUserLoginInfo(String userName) {
        Object obj = redisUtil.getObj(userName + Constant.USER_LOGIN_CACHE_SALT);
        LoginInfoEntity loginInfo;
        if (obj == null) {
            log.info("从redis缓存获取用户登录信息失败,从数据库中获取用户登录信息......");
            loginInfo = userMapper.getUserLoginInfo(userName);
        } else {
            loginInfo = (LoginInfoEntity) obj;
        }
        return loginInfo;
    }

    @Transactional
    @Override
    public void updateLoginInfo(String userName) {
        LoginInfoEntity loginInfoEntity = userMapper.getUserLoginInfo(userName);
        if(loginInfoEntity != null){
            loginInfoEntity.setToken("");
            loginInfoEntity.setOnline("1");
            loginInfoEntity.setLogoutTime(DateUtils.getDateTime());
        }
        userMapper.userLoginout(loginInfoEntity);
        //更新用户登录信息缓存
        redisUtil.set(userName + Constant.USER_LOGIN_CACHE_SALT, loginInfoEntity);
    }

    @Override
    public UserInfoEntity fetchUserInfo(String userName) {
        Object obj = redisUtil.getObj(userName + Constant.USER_INFO_CACHE_SALT);
        UserInfoEntity user;
        if (obj == null) {
            log.info("从缓存中获取会员信息失败，从数据库获取会员信息......");
            user = userMapper.fetchUserInfo(userName);
        } else {
            log.info("从缓存中获取用户信息成功......");
            user = (UserInfoEntity) obj;
        }
        return user;
    }

    @Override
    public AgentInfoEntity fetchAgentInfo(String agentName) {
        Object obj = redisUtil.getObj(agentName + Constant.AGENT_INFO_CACHE_SALT);
        AgentInfoEntity agent;
        if (obj == null) {
            agent = userMapper.fetchAgentInfo(agentName);
        } else {
            agent = (AgentInfoEntity) obj;
        }
        return agent;
    }

    @Transactional
    @Override
    public void deleteUserLoginInfo(String userName) {
        userMapper.deleteUserLoginInfo(userName);
    }

    @Transactional
    @Override
    public void addUserLoginInfo(LoginInfoEntity loginInfoEntity) {
        userMapper.addUserLoginInfo(loginInfoEntity);
    }

    @Transactional
    @Override
    public Integer addUserInfo(UserInfoEntity user) {
        userMapper.addUserInfo(user);
        String userName = user.getUserName();
        UserInfoEntity userInfo = userMapper.fetchUserByName(userName).get(0);
        redisUtil.set(userName + Constant.USER_INFO_CACHE_SALT, userInfo);
        return userInfo.getId();
    }

    @Transactional
    @Override
    public void addMemberInfo(MemberInfoEntity memberInfoEntity) {
        userMapper.addMemberInfo(memberInfoEntity);
        String userName = memberInfoEntity.getUserName();
        MemberInfoEntity memberInfo = userMapper.getMemberInfo(userName);
        redisUtil.set(userName + Constant.MEMBER_INFO_CACHE_SALT, memberInfo);
    }

    @Transactional
    @Override
    public void addUserCaptcha(String userName, String capText) {
        userMapper.addUserCaptcha(userName, capText);
    }

    @Transactional
    @Override
    public void deleteUserCaptcha(String userName) {
        userMapper.deleteUserCaptcha(userName);
    }

    @Override
    public String getCaptchaText(String userName) {
        return userMapper.getCaptchaText(userName);
    }

    @Transactional
    @Override
    public void userLoginout(LoginInfoEntity loginInfo) {
        userMapper.userLoginout(loginInfo);
    }

    @Override
    public MemberInfoEntity getMemberInfo(String userName) {
        MemberInfoEntity memberInfo;
        Object memObj = redisUtil.getObj(userName + Constant.MEMBER_INFO_CACHE_SALT);
        if (memObj == null) {
            log.info("从redis缓存获取用户副表信息失败,从数据库中获取用户副表信息......");
            memberInfo = userMapper.getMemberInfo(userName);
        } else {
            memberInfo = (MemberInfoEntity) memObj;
        }
        return memberInfo;
    }

    @Override
    public List<MemberInfoEntity> fetchAllMemberInfos() {
        List<MemberInfoEntity> members = new ArrayList<>();
        members.addAll(userMapper.fetchAllMemberInfos());
        return members;
    }

    @Transactional
    @Override
    public void updateMemberDrawPassword(MemberInfoEntity memberInfo) {
        userMapper.updateMemberDrawPassword(memberInfo);
    }

    @Transactional
    @Override
    public void updateUserPassword(UserInfoEntity userInfo) {
        userMapper.updateUserPassword(userInfo);
    }

    @Override
    public List<QuestionEntity> fetchAllQuestions() {

        Object obj = redisUtil.getObj(Constant.QUESTION_ENUM_CACHE);
        List<QuestionEntity> questions = new ArrayList<>();
        if (obj == null) {
            questions.addAll(userMapper.fetchAllQuestions());
        } else {
            questions.addAll((List<QuestionEntity>) obj);
        }
        return questions;
    }

    @Override
    public List<AdminInfoEntity> fetchAdminList(UserReq userReq) {
        return userMapper.fetchAdminList(userReq);
    }

    @Override
    public Integer countAdmins(UserReq userReq) {
        return userMapper.countAdmins(userReq);
    }

    @Override
    public List<UserEntity> fetchUserList(UserInfoReq userInfoReq) {
        return userMapper.fetchUserList(userInfoReq);
    }

    @Override
    public Integer countUsers(UserInfoReq userInfoReq) {
        return userMapper.countUsers(userInfoReq);
    }

    @Transactional
    @Override
    public void addSystemAdmin(UserAddReq userAddReq) {
        userMapper.addSystemAdmin(userAddReq);
        AdminInfoEntity admin = userMapper.fetchAdminByName(userAddReq.getUserName()).get(0);
        redisUtil.set(userAddReq.getUserName() + Constant.ADMIN_INFO_CACHE_SALT, admin);
    }

    @Override
    public boolean checkAdminNameExist(String userName) throws GeneralException {
        return CollectionUtils.isEmpty(userMapper.fetchAdminByName(userName));
    }

    @Override
    public boolean checkUserNameExist(String userName) throws GeneralException {
        return CollectionUtils.isEmpty(userMapper.fetchUserByName(userName));
    }

    @Transactional
    @Override
    public void updateSystemAdmin(UserUpdateReq userUpdateReq) {
        userMapper.updateSystemAdmin(userUpdateReq);
        AdminInfoEntity admin = userMapper.fetchAdminByName(userUpdateReq.getUserName()).get(0);
        redisUtil.set(userUpdateReq.getUserName() + Constant.ADMIN_INFO_CACHE_SALT, admin);
    }

    @Transactional
    @Override
    public void deleteSystemAdmin(Integer id) {
        List<AdminInfoEntity> list = userMapper.fetchAdminById(id);
        if (CollectionUtils.isEmpty(list))
            return;
        AdminInfoEntity admin = list.get(0);
        userMapper.deleteSystemAdmin(id);
        redisUtil.delObj(admin.getUserName() + Constant.ADMIN_INFO_CACHE_SALT);
    }

    @Override
    public List<AuthInfoEntity> fetchAllAuths() {
        return userMapper.fetchAllAuths();
    }

    @Override
    public List<AuthInfoEntity> fetchOwenAuths(String userName) {
        return userMapper.fetchOwenAuths(userName);
    }

    @Override
    public List<AdminInfoEntity> fetchAdminByName(String userName) {
        return userMapper.fetchAdminByName(userName);
    }

    @Transactional
    @Override
    public void updateAgentPwd(ResetPwdReq resetPwdReq) {
        userMapper.updateAgentPwd(resetPwdReq);
    }


    @Override
    public List<PayLevelEntity> fetchAllPayLevel() {
        return userMapper.fetchAllPayLevel();
    }

    @Override
    public UserInfoEntity fetchUserByName(String userName) {
        List<UserInfoEntity> users = userMapper.fetchUserByName(userName);
        if (!CollectionUtils.isEmpty(users))
            return users.get(0);
        else
            return null;
    }

    @Transactional
    @Override
    public void updateUserInfo(UserOpeReq userOpeReq) {
        userMapper.updateUserInfo(userOpeReq);
        userMapper.updateMemberInfo(userOpeReq);
        String userName = userOpeReq.getUserName();
        UserInfoEntity userInfo = userMapper.fetchUserByName(userName).get(0);
        redisUtil.set(userName + Constant.USER_INFO_CACHE_SALT, userInfo);
        MemberInfoEntity memberInfo = userMapper.getMemberInfo(userName);
        redisUtil.set(userName + Constant.MEMBER_INFO_CACHE_SALT, memberInfo);
    }

    @Transactional
    @Override
    public void updateMemberBkLimit(UserInfoReq userInfoReq) {
        userMapper.updateMemberBkLimit(userInfoReq);
        String userName = userInfoReq.getUserName();
        MemberInfoEntity memberInfo = userMapper.getMemberInfo(userName);
        redisUtil.set(userName + Constant.MEMBER_INFO_CACHE_SALT, memberInfo);
    }

    @Transactional
    @Override
    public void updateMemberFTLimit(UserInfoReq userInfoReq) {
        userMapper.updateMemberFTLimit(userInfoReq);
        String userName = userInfoReq.getUserName();
        MemberInfoEntity memberInfo = userMapper.getMemberInfo(userName);
        redisUtil.set(userName + Constant.MEMBER_INFO_CACHE_SALT, memberInfo);
    }

}
