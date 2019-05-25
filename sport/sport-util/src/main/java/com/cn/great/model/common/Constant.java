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
    //错误响应枚举
    public static final String ERROR_SESSION_ENUM="errorSessionEnum";
    //常用数据分隔符
    public static final String SPLIT_STR="@88@";
    //缓存会员信息的随机盐
    public static final String USER_INFO_CACHE_SALT = "_MwKB5xH7";
    //缓存会员副表随机盐
    public static final String MEMBER_INFO_CACHE_SALT = "_GDVtlkfa";
    //缓存会员登录信息的随机盐
    public static final String USER_LOGIN_CACHE_SALT = "_WwYZSXus";
    //缓存代理信息随机盐
    public static final String AGENT_INFO_CACHE_SALT = "_zwM4H3Vq";
    //用户验证码缓存随机盐
    public static final String USER_CAPTCHA_CACHE_SALT = "_EdXs4JsL";
    //session缓存用户登录信息
    public static final String USER_NAME_SESSION ="userNameSession";
    //token 缓存
    public static final String USER_TOKEN = "accessToken";

    public static final String NOTICE_STR="initNoticesCache";

    public static final String QUOTA_CONFIG_CACHE_SALT = "_741F2035";

    public static final String SYSTEM_DICT="initDictCache";
    //保密问题字典
    public static final String QUESTION_ENUM_CACHE = "questionEnumCache";

    //用户是否注册彩票的盐
    public static final String USER_REGISTER_LOTTERY_SALT="_QcRgDmOo";
    //缓存用户登陆彩票后users随即盐
    public static final String USER_LOGIN_LOTTERY_SALT="_FG9MXRMd";

    //缓存用户登陆名第三方的随机盐
    public static final String THIRD_LOGIN_NAME_SALT="MWgK";

    //缓存用户第三方的登陆密码
    public static final String THIRD_PASSWORD="_hyord";

    //用户是否注册AG的盐
    public static final String USER_REGISTER_AG_SALT="_KuKor6xTD6";
    //缓存用户登陆AG后users随即盐
    public static final String USER_LOGIN_AG_SALT="_VjxO2SKoI2";

    public static final String AG_PARAM_SPLIT = "/\\\\/";

    public static final String LOTTERY_TRANSFER_ME="5";//彩票转体育
    public static final String ME_TRANSFER_LOTTERY="6";//体育转彩票
    public static final String MG_TRANSFER_ME="3";//MG转体育
    public static final String ME_TRANSFER_MG="4";//体育转MG
    public static final String AG_TRANSFER_ME="1";//AG转体育
    public static final String ME_TRANSFER_AG="2";//体育转AG

    //缓存mg token的随即盐
    public static final String USER_TOKEN_AG_SALT ="_5LCptIbQ" ;
    //缓存mg登陆后的随机盐
    public static final String USER_LOGIN_MG_SALT = "_bMvF55rf";
    //缓存mg注册后的随即盐
    public static final String USER_REGISTER_MG_SALT ="_Ll5HS82j";
    //mg主键的随即盐
    public static final String THIRD_USER_ID_SALT ="_RVDF8HJM";
    public static final String TYPE_ADD = "add";   //添加收藏
    public static final String TYPE_DEL = "del";   //删除收藏

    public static final String MENUE_CACHE_SALT = "_eF0Q50c";

    public static final String BANK_CARDS_CACHE_SALT = "_6D266A12";

    //刷赛事导航数据url
    public static final String MATCH_CATEGORY_POST_URL = "http://landing-sb-asia.prdasbb18a1.com/zh-cn/serv/getmenu";
    //刷赛事信息数据URL
    public static final String MATCH_ODDS_POST_URL = "http://landing-sb-asia.prdasbb18a1.com/zh-cn/serv/getodds";
    //刷单场赛事数据URL
    public static final String MATCH_ODD_POST_URL = "http://landing-sb-asia.prdasbb18a1.com/zh-cn/serv/getamodds";
    //刷当前直播赛事数据URL
    public static final String MATCH_LIVE_STREAM_GET_URL = "http://landing-sb-asia.prdasbb18a1.com/zh-cn/serv/getDataLCSB";
    //热门赛事的缓存盐
    public static final String SPORT_HOT_SALT="_cC7dbm4a";
    //屏蔽联赛赛事的缓存盐
    public static final String SPORT_MLEAGUE_SHIELD_SALT="_k9RIEIiv";
    //屏蔽单场赛事的缓存盐
    public static final String SPORT_SHIELD_SALT="_cC7dbm4a1";

    //缓存sport的key
    public static final String SPORT_LIST_SALT="sportList";
    //缓存sport的key
    public static final String SPORT_OR_LIST_SALT="sportOrList";


}
