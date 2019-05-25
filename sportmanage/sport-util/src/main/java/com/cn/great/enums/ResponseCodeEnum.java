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
    TOTAL_STATION_MAINTENANCE(200000, "全站维护"),
    PASSWORD_ERROR(2001, "密码错误"),
    USER_NOT_EXIST_ERROR(2002, "用户不存在"),
    ACCOUNT_DISABLE_ERROR(2003, "账户被停用"),
    FIELD_NOT_STANDARD_ERROR(2011, "字段不符合规范"),
    ACCOUNT_EXISTS_ERROR(2012,"账户已经存在"),
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
    USER_AMOUNT_NOT_ENOUNGH_ERROR(2034, "用户余额不足"),
    BANK_CARD_ERROR(2035, "出款账号最多绑定四张银行卡"),
    PREPAID_CLOSED_ERROR(2041,"该线下充值通道已关闭"),
    INCOME_QUESTION_ERROR(2042,"您还有未处理的入款请求"),
    ENUM_REPEAT_ERROR(2043,"参数已经存在"),
    PARAMETER_CHECK_ERROR(502, "必填参数不能为空"),
    AUTH_IS_EXIST(3000,"权限名称已经存在"),
    ROLE_IS_EXIST(3001,"角色名称已经存在"),
    LOGIN_ERROR(3002,"用户名或密码错误"),
    PERMISSION_NOT_ENOUGH(3003,"权限不足"),
    DICT_NOT_VALUE(3034,"字典值不存在");

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
