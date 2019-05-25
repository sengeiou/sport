package com.cn.great.model.discount;

import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
public class WebDiscountEntity implements Serializable {

    private static final long serialVersionUID = -4884300323260301077L;
    
    //id
    private int id;
    //活动名称
    private String name;   
    //活动简介
    private String intro;
    //活动详情
    private String description;
    //开始时间
    private Date startTime;
    //结束时间
    private Date endTime;
    //1-pc展示0-不展示
    private int pc;
    //1-wap展示0-不展示
    private int wap;
    //0-草稿1-发布2-伪删除
    private int status;
    //排序
    private int level;
    //pc版活动详情页图片
    private String pcBigImg;
    //pc版活动列表页图片
    private String pcSmallImg;
    //wap版活动详情页图片
    private String wapBigImg;
    //wap版活动列表页图片
    private String wapSmallImg;
    //总代理
    private String serverAdmin;
}
