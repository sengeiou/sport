package com.cn.great.req.agent;

import com.cn.great.model.common.BaseEntity;
import lombok.Data;
import java.math.BigDecimal;

@Data
public class AgentOpeReq extends BaseEntity {

    // 用户名
    private String userName;
    // 余额
    private BigDecimal money;
    // 登陆密码
    private String password;
    // 取款密码
    private String passwordSafe;
    // 注册时间
    private String addDate;
    // 中文名
    private String alias;
    //关联银行卡ID
    private Integer bankId;
    // 注释
    private String notes;
    // 总代理
    private String serverAdmin;
    // 手机号
    private String phone;
    // 状态 0-正常1-冻结2-伪删除
    private Integer status;
    //变更后额度
    private Integer changeFlag;

}
