package com.cn.great.req.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: sport
 * @description: 用户登录请求Req
 * @author: Stamp.M
 * @create: 2019-03-16 20:21
 **/
@Data
public class MgLoginReq {
    //游戏id
    @NotNull
    private Integer game_id;
    //应用id
    @NotNull
    private Integer app_id;
    //0=正式游戏 1=试玩
    @NotNull
    private Integer actype;
}
