package com.cn.great.req.match;

import lombok.Data;

@Data
public class CollectionReq {

    //联赛 ID
    private String mleagueid;
    //联赛名
    private String mleague;
    //添加add 取消收藏del 展示收藏show
    private String type;
}
