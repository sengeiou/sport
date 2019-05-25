package com.cn.great.model.pay;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class PayLevelEntity implements Serializable {

    private static final long serialVersionUID = -3503345671305572793L;
    private Integer id;

    private String levelName;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date regStart;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date regEnd;

    private Integer mixCtime;

    private Integer maxCtime;

    private BigDecimal mixAmount;

    private BigDecimal maxAmount;

    private String notes;

    private String serverAdmin;

    private Integer status;

}