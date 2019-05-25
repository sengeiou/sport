package com.cn.great.mapper.user;


import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.*;
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

    Integer addUserInfo(UserInfoEntity user);

    void addMemberInfo(MemberInfoEntity memberInfoEntity);

    void addUserCaptcha(@Param("userName") String userName, @Param("capText") String capText);

    void deleteUserCaptcha(String userName);

    String getCaptchaText(String userName);

    void userLoginout(LoginInfoEntity loginInfo);

    MemberInfoEntity getMemberInfo(String userName);

    List<MemberInfoEntity> fetchAllMemberInfos();

    void updateMemberDrawPassword(MemberInfoEntity memberInfo);

    Integer updateUserBalence(UserInfoEntity user);

    void updateUserPassword(UserInfoEntity userInfo);

    List<QuestionEntity> fetchAllQuestions();

    /**
      * 领取红包之后，将领取的钱存入用户余额中
      * @param userId
      * @return
      */
     int userConditionInMoney(int num,int userId);

     void updateMemberCollect(MemberInfoEntity memberInfo);

     void updateUserLevel(UserInfoEntity infoEntity);

     int updateDefaultBank(@Param("bankId") Integer bankId,@Param("userId") Integer userId);

    UserInfoEntity getMemberById(Integer userid);
}
