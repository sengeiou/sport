package com.cn.great.enums;

/**
 * @program: sport
 * @description: 响应码配置枚举
 * @author: Stamp.M
 * @create: 2019-03-21 19:54
 **/
public enum  ResponseCodeEnum {

    SUCCESS_CODE(0, "success"),
    INNER_ERROR(500, "系统出错"),
    TOKEN_NON_ERROR(300000, "token err"),
    USER_SESSION_TIME_OUT(40000,"用户session已过期"),
    TOTAL_STATION_MAINTENANCE(200000, "全站维护"),
    PASSWORD_ERROR(2001, "密码错误"),
    USER_NOT_EXIST_ERROR(2002, "用户不存在"),
    ACCOUNT_DISABLE_ERROR(2003, "账户被停用"),
    FIELD_NOT_STANDARD_ERROR(2011, "字段不符合规范"),
    ACCOUNT_EXISTS_ERROR(2012,"会员账户已经存在"),
    AGENT_NOT_EXIST_ERROR(2013,"代理账号不存在"),
    VERIFY_CODE_ERROR(2014, "验证码不正确"),
    ENCRYPT_QUESTION_NON_ERROR(2015, "密保问题不能为空"),
    UPDATE_PASSWORD_ERROR(2021,"修改密码成功"),
    OLD_PASSWORD_ERROR(2022,"原密码错误"),
    ENCRYPT_QUESTION_ERROR(2023, "密保问题错误"),
    BANK_CODE_NON_ERROR(2031, "银行编码不存在"),
    WITHDRAW_QUESTION_ERROR(2032,"您当前还有未处理的提款请求"),
    DRAW_PASSWORD_ERROR(2033,"提款密码错误"),
    DRAW_AMOUNT_ERROR(2034, "提款金额必须大于/等于100!"),
    BANK_CARD_ERROR(2035, "出款账号最多绑定四张银行卡"),
    PREPAID_CLOSED_ERROR(2041,"该线下充值通道已关闭"),
    INCOME_QUESTION_ERROR(2042,"您还有未处理的入款请求"),
    PARAMETER_CHECK_ERROR(502, "必填参数不能为空"),
    CONDITION_USERID_EXIST_ERROR(1,"您已领取过！"),
    CONDITION_IP_EXIST_ERROR(1,"此IP已领取过！"),
    CONDITION_START_EXIST_ERROR(1,"活动时间未到！"),
    CONDITION_END_EXIST_ERROR(1,"活动已经关闭！"),
    CONDITION_STATUS_EXIST_ERROR(1,"活动暂未开启！"),
    CONDITION_BLACK_EXIST_ERROR(1,"您的账号异常，请联系客服。"),
    CONDITION_CMONEY_EXIST_ERROR(1,"历史存款金额至少5001元!"),
    CONDITION_MONEY_EXIST_ERROR(1,"今日存款不足：100"),
    DELETE_MESSAGE_FAILURE(1001,"删除失败"),
    REPLY_MESSAGE_FAILURE(1002,"回复失败"),
    USER_NOT_GAME(403, "用户未开通此游戏"),
    REGISTER_REQUEST_FAILED(502,"请求第三方注册接口失败" ),
    REGISTER_THIRD_FAILED(502 ,"注册到第三方时失败" ),
    LOGIN_REQUEST_FAILED(502 ,"请求第三方登陆接口失败" ),
    LOGIN_THIRD_FAILED(502 ,"登陆到第三方时失败" ),
    GET_BALANCE_REQUEST_FAILED(502 ,"请求第三方获取余额接口失败" ),
    GET_BALANCE_THIRD_FAILED(502 ,"获取余额时失败" ),
    TRANSFER_REQUEST_FAILED(502 ,"请求第三方余额转换接口失败" ),
    USER_BALANCE_NOT_ENOUGH(403,"用户余额不足"),
    USER_LOTTERY_BALANCE_NOT_ENOUGH(403,"用户在彩票游戏中的余额不足"),
    TRANSFER_THIRD_FAILED(502 ,"余额转换时失败" ),
    NO_ID_ERROR(1003,"该id不存在"),
    NOT_ENOUGH_ERROR(2043,"您的账户金额不足,请充值后再进行游戏"),
    USER_AMOUNT_NOT_ENOUNGH_ERROR(2034, "用户余额不足"),
    NOT_FOUND_MATCH_ERROR(7001,"未查询到该赛事"),
    SEALED_UP_ERROR(2044,"赛事已封盘"),
    BET_FAILURE_ERROR(2045,"下注失败"),
    DICT_NOT_VALUE(502,"字典值缺失" ),
    USER_NOT_REGISTER_THIRD(502,"用户在第三方未注册" ),
    REPEATED_BINDING_BANK_CARD_ERROR(502,"重复绑定银行卡"),
    SET_DEFAULT_BANK_ERROR(502,"改用户未绑定此银行卡"),
    GET_TOKEN_REQUEST_FAILED(502 ,"请求第三方获取token接口失败" ),
    GET_TOKEN_THIRD_FAILED(502 ,"获取token时失败" );

    private Integer code;
    private String message;

    ResponseCodeEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public final Integer getCode() {
        return this.code;
    }

    public final String getMessage() {
        return this.message;
    }

}
