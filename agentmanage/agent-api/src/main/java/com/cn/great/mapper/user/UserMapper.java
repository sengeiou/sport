package com.cn.great.mapper.user;


import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.*;
import com.cn.great.req.user.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    List<UserInfoEntity> fetchAllUsers();

    List<AgentInfoEntity> fetchAllAgents();

    List<AdminInfoEntity> fetchAllAdmins();

    List<LoginInfoEntity> fetchAllOnlines();

    LoginInfoEntity getUserLoginInfo(String userName);

    UserInfoEntity fetchUserInfo(String userName);

    AgentInfoEntity fetchAgentInfo(String agentName);

    void deleteUserLoginInfo(String userName);

    void addUserLoginInfo(LoginInfoEntity loginInfoEntity);

    void updateLoginInfo(LoginInfoEntity loginInfoEntity);

    Integer addUserInfo(UserInfoEntity user);

    void addMemberInfo(MemberInfoEntity memberInfoEntity);

    void addUserCaptcha(@Param("userName") String userName, @Param("capText") String capText);

    void deleteUserCaptcha(String userName);

    String getCaptchaText(String userName);

    void userLoginout(LoginInfoEntity loginInfo);

    MemberInfoEntity getMemberInfo(String userName);

    List<MemberInfoEntity> fetchAllMemberInfos();

    void updateMemberDrawPassword(MemberInfoEntity memberInfo);

    void updateUserPassword(UserInfoEntity userInfo);

    List<QuestionEntity> fetchAllQuestions();

    List<AdminInfoEntity> fetchAdminList(UserReq userReq);

    Integer countAdmins(UserReq userReq);

    Integer addSystemAdmin(UserAddReq userAddReq);

    List<AdminInfoEntity> fetchAdminByName(String userName);

    List<UserInfoEntity> fetchUserByName(String userName);

    List<AdminInfoEntity> fetchAdminById(Integer id);

    void updateSystemAdmin(UserUpdateReq userUpdateReq);

    void deleteSystemAdmin(Integer id);

    List<AuthInfoEntity> fetchAllAuths();

    List<AuthInfoEntity> fetchOwenAuths(String userName);

    List<UserEntity> fetchUserList(UserInfoReq userInfoReq);

    Integer countUsers(UserInfoReq userInfoReq);

    List<PayLevelEntity> fetchAllPayLevel();

    void updateUserInfo(UserOpeReq userOpeReq);

    void updateMemberInfo(UserOpeReq userOpeReq);

    void updateMemberBkLimit(UserInfoReq userInfoReq);

    void updateMemberFTLimit(UserInfoReq userInfoReq);

    void updateAgentPwd(ResetPwdReq resetPwdReq);
}
