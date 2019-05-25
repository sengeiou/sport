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
    //参数类型
    public static final String ENUM_TYPE_SESSION="enumTypeSession";

    //客户银行卡信息的rsa加解密的公私钥
    public static final String USER_RSA_PRIVATE_KEY="MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAJjcJ1jzE67DoJeUQBx8JsNjV" +
            "+0sxDIcLcYk5op0KVYiOs2mUMXTYRBob4bvbuUTvU79032AUnRQz6GgqqtD8WVFhGqDn8TOXFwLs3yyHZDdPJ3VmYLZV9MWAwkKWMquPGaXH8Q0V/jCC5GkwMQDUk7NK" +
            "+LGa5OKrg8K7avvFRI7AgMBAAECgYBuD12ZUvOiCqLPYOPEXrO+TQIa9/ePqPBgUWNY3wiARwcV2SEhPvANU1Sx0CWFdPACNwoWu9UigKju0/Lue24Lgt0JeLjdKOoaAfFFGRf5yeMl" +
            "+7KpkJG6wdKT1dKFpETkeMk4HDncaB8q1kjGhxnAuMQofz/JKhE1tDm6h+c30QJBAMiEE5FibWMIm25kVBM4LWQh3rDM7rtmYvpp973TSgXdoAse" +
            "/EeOdUyoNs5O2dZSWSdwUD4ktw7f2uO7waCwK5MCQQDDKEc/OMH/u5NH9UX64r9DXjRfb9ahAm2OEXzYq1oRuD/wIJFh" +
            "/QiOPk0AO24lHvMLv87dMNwYAwvwYbDrkze5AkBIatL6Xdbtvm0MSHXI3zAditH3fnv1+HtkvyK3Tvjb93fWrGEmor" +
            "+gaNwqVHX+Ho2OXdTNLMtkNtrCBsxecWG7AkAcknoT5IBqq5C9mUhcmfP8rf8m9d3Lhup5QVAw/K1cKMibpHkEiqJFCRQG86yFnMlir" +
            "/teYPfoQBHwaK0ZYF1pAkBbdeEhReTMkTOx2JkpPwk9ekCwJm+GzcCjiks7MnD3yVpuI8sjbghRJyNZnY/b4Jud6+j4ypxyHUEKJ/vX0hXK";
    public static final String USER_RSA_PUBLIC_KEY="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCY3CdY8xOuw6CXlEAcfCbDY1ftLMQyHC3GJOaKdClWIjrNplDF02EQaG+G727lE71O" +
            "/dN9gFJ0UM+hoKqrQ/FlRYRqg5/EzlxcC7N8sh2Q3Tyd1ZmC2VfTFgMJCljKrjxmlx/ENFf4wguRpMDEA1JOzSvixmuTiq4PCu2r7xUSOwIDAQAB";

}
