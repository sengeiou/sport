package com.cn.great.service.impl;

import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.mapper.user.MoneyLogMapper;
import com.cn.great.mapper.user.UserMapper;
import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.auth.RoleInfoEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.*;
import com.cn.great.req.user.ResetPwdReq;
import com.cn.great.req.user.UserAddReq;
import com.cn.great.req.user.UserReq;
import com.cn.great.req.user.UserUpdateReq;
import com.cn.great.service.UserService;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
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
    @Autowired
    private MoneyLogMapper moneyLogMapper;

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

        Object obj = redisUtil.get(userName + Constant.USER_LOGIN_CACHE_SALT);
        LoginInfoEntity loginInfo;
        if (obj == null) {
            log.info("从redis缓存获取用户登录信息失败,从数据库中获取用户登录信息......");
            loginInfo = userMapper.getUserLoginInfo(userName);
        } else {
            loginInfo = (LoginInfoEntity) obj;
        }
        return loginInfo;
    }

    @Override
    public UserInfoEntity fetchUserInfo(String userName) {
        Object obj = redisUtil.get(userName + Constant.USER_INFO_CACHE_SALT);
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

        Object obj = redisUtil.get(agentName + Constant.AGENT_INFO_CACHE_SALT);
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
        return userMapper.addUserInfo(user);
    }

    @Transactional
    @Override
    public void addMemberInfo(MemberInfoEntity memberInfoEntity) {
        userMapper.addMemberInfo(memberInfoEntity);
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
        Object memObj = redisUtil.get(userName + Constant.MEMBER_INFO_CACHE_SALT);
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
        Object obj = redisUtil.get(Constant.QUESTION_ENUM_CACHE);
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
    public List<RoleInfoEntity> fetchAllRoles() {
        return userMapper.fetchAllRoles();
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
    public void  updateBalance(Integer userid, BigDecimal amount, String reason, Integer thirdId) {
        UserInfoEntity users=userMapper.getMemberById(userid);
        BigDecimal oldMoney=users.getMoney();
        users.setMoney(users.getMoney().add(amount));
        if(users.getMoney().compareTo(BigDecimal.ZERO)<0){
            throw  new GeneralException(ResponseCodeEnum.USER_AMOUNT_NOT_ENOUNGH_ERROR);
        }
        userMapper.updateUserBalence(users);

        //生成转换记录
        MoneyLogEntity moneyLog = new MoneyLogEntity();
        moneyLog.setMoney(amount);
        moneyLog.setMoneyf(oldMoney);
        moneyLog.setMoneys(users.getMoney());
        moneyLog.setType(4);
        moneyLog.setUserid(userid);
        moneyLog.setOrderId(thirdId);
        moneyLog.setAddDate(String.valueOf(new Date().getTime() / 1000));
        moneyLog.setNotes(reason);
        moneyLogMapper.addMoneyLog(moneyLog);
        redisUtil.set(users.getUserName() + Constant.USER_INFO_CACHE_SALT, users);
    }

    @Override
    public UserInfoEntity getUserById(Integer userId) {
        return userMapper.getMemberById(userId);
    }

    @Transactional
    @Override
    public void updateAdminPwd(ResetPwdReq resetPwdReq) {
        userMapper.updateAdminPwd(resetPwdReq);
    }

}
