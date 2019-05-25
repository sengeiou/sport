package com.cn.great.req.match;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Data
@Builder
@Document(collection = "championships")
public class Championships implements Serializable {

    private static final long serialVersionUID = -2866902944961533502L;

    private Integer mleagueid;	//联赛id
    private String mleague;	//	联赛名
    private Integer egid;	//	冠军id
    private String egn;	//	冠军日期中例如 法国甲组联赛2018/2019
    private Integer mid;	//	赛事id
    private String  mdate;	//	开赛日期
    private String  mtime;	//	开赛时间
    private Long datetimes;	//	开赛日期时间 时间戳
    private String deletimes;	//	主要用于删除和本次刷水数据不同的数据
    private String type;	//	球赛种类
    private String mtype;	//	球赛类型 or冠军
    private String value;	//	处理后的数据
}
