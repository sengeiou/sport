package com.cn.great.req.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 * @program: sport
 * @description: 用户登录请求Req
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class TransferLogReq {

    private Integer userid;
    private String start_date;
    private String end_date;
}
