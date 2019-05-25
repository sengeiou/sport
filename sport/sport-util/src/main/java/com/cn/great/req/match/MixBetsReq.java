package com.cn.great.req.match;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

/**
 * 体育下注 request
 */
@Data
public class MixBetsReq {
    @NotNull
    private BigDecimal betFormAmount;
    @NotBlank
    private String sportType;
    @NotNull
    private BigDecimal mrate;
    @NotNull
    private BigDecimal winableAmount;
    @NotNull
    private List<SportBetsReq> betVal;
}
