package com.cn.great.model.common;

/**
 * @program: meet
 * @description: 常量类
 * @author: Stamp.M
 * @create: 2019-03-21 10:20
 **/
public class Constant {

    //AES密钥
    public static final String SECURITY_KEY = "ur&sCawWSJKBiGR@";
    //JWT密钥
    public static final String JWT_SECURITY_KEY = "PM$@AXMh3WiKDQOu";
    //密码加密随机盐
    public static final String PASSWORD_MD5_SALT = "_X9pRjim2";
    //错误响应枚举
    public static final String ERROR_SESSION_ENUM="errorSessionEnum";
    //缓存会员信息的随机盐
    public static final String USER_INFO_CACHE_SALT = "_MwKB5xH7";
    //缓存会员副表随机盐
    public static final String MEMBER_INFO_CACHE_SALT = "_GDVtlkfa";
    //缓存会员登录信息的随机盐
    public static final String USER_LOGIN_CACHE_SALT = "_WwYZSXus";
    //缓存代理信息随机盐
    public static final String AGENT_INFO_CACHE_SALT = "_zwM4H3Vq";
    //缓存管理员信息随机盐
    public static final String ADMIN_INFO_CACHE_SALT = "_CWe6xQ5G";

    public static final String NOTICE_STR="initNoticesCache";

    public static final String SYSTEM_DICT="initDictCache";
    //保密问题字典
    public static final String QUESTION_ENUM_CACHE = "questionEnumCache";
    //常用数据分隔符
    public static final String SPLIT_STR="@88@";
    //session缓存userName
    public static final String USER_SESSION_NAME = "userNameSession";
    public static final String LOGIN_INFO_SESSION = "loginInfoSession";
    //父权限缓存到session
    public static final String AUTH_PARENT_SESSION = "parentAuthsSession";
    //角色缓存到session
    public static final String ROLES_SESSION="rolesSession";
    //权限缓存到session
    public static final String AUTHS_ALL_SESSION="allAuthsSession";
    //用户权限缓存到session
    public static final String AUTH_OWEN_SESSION="owenAuthsSession";
    //用户权限缓存到session
    public static final String AUTH_OWEN_SESSION_STR="owenAuthsSessionStr";
    //缓存银行卡信息
    public static final String BANK_INFO_SESSION="banksInfoSession";
    //缓存代理信息
    public static final String AGENT_INFO_SESSION="agentInfoSession";
    //缓存球赛类型信息
    public static final String BALL_TYPE_SESSION="ballTypeSession";
    //缓存玩法类型信息
    public static final String PLAY_BALL_TYPE_SESSION="ballPlayTypeSession";
    //缓存注单确认信息
    public static final String BILL_CONFIRMED_SESSION="ballConfirmedSession";
    //缓存支付层级信息
    public static final String PAY_LEVEL_SESSION="payLevelSession";

}
