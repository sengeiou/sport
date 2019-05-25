package com.cn.great.common;


import com.cn.great.mapper.message.NoticesMapper;
import com.cn.great.mapper.system.DictMapper;
import com.cn.great.service.UserService;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

/**
 * @program: sport
 * @description: 初始化缓存
 * @author: Stamp.M
 * @create: 2019-03-28 14:47
 **/
@Slf4j
@Component
public class InitCache {

    @Autowired
    private RedisUtil redisUtil;
    @Resource
    private UserService userService;
    @Autowired
    private NoticesMapper noticesMapper;
    @Autowired
    private DictMapper dictMapper;

    @PostConstruct
    public void initCache() {
        log.info("init cache begin......");
        //根据用户名缓存所有会员信息(用户名加随机盐)
     /*   List<UserInfoEntity> users = userService.fetchAllUsers();
        log.info(" cur size of users is : {}", users.size());
        users.forEach(a -> {
            redisUtil.set(a.getUserName() + Constant.USER_INFO_CACHE_SALT, a);
        });
        //根据用户名初始化所有会员副表信息
        List<MemberInfoEntity> members = userService.fetchAllMemberInfos();
        log.info(" cur size of members is :{}", members.size());
        members.forEach(a -> {
            redisUtil.set(a.getUserName() + Constant.MEMBER_INFO_CACHE_SALT, a);
        });
        //根据代理名称缓存所有的代理信息
        List<AgentInfoEntity> agents = userService.fetchAllAgents();
        log.info(" cur size of agents is : {}", agents.size());
        agents.forEach(a -> {
            redisUtil.set(a.getUserName() + Constant.AGENT_INFO_CACHE_SALT, a);
        });
        //根据用户名称缓存所有管理员信息
        List<AdminInfoEntity> admins = userService.fetchAllAdmins();
        log.info(" cur size of admins is :", admins.size());
        admins.forEach(a -> {
            redisUtil.set(a.getUserName() + Constant.ADMIN_INFO_CACHE_SALT, a);
        });
        //根据用户名缓存所有登录会员信息
        List<LoginInfoEntity> onlines = userService.fetchAllOnlines();
        log.info(" cur size of onlines is : {}", onlines.size());
        onlines.forEach(a -> {
            redisUtil.set(a.getUserName() + Constant.USER_LOGIN_CACHE_SALT, a);
        });
        //缓存所有的公告信息
        List<NoticesEntity> notices = noticesMapper.listAll(null);
        redisUtil.set(Constant.NOTICE_STR, notices);
        //缓存保密问题字典
        List<QuestionEntity> questions = userService.fetchAllQuestions();
        log.info("cur questions size is : {}", questions.size());
        redisUtil.set(Constant.QUESTION_ENUM_CACHE, questions);
        //缓存所有的维护相关的信息
        List<DictEntity> dictEntities = dictMapper.listByObj(new DictEntity());
        dictEntities.forEach(p -> redisUtil.hset(Constant.SYSTEM_DICT, p.getCode(), p));*/
        log.info("init cache end......");
    }
}
