package com.cn.great.mapper.discount;

import com.cn.great.model.discount.WebDiscountEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface WebDiscountMapper {

    /**
     *  查询优惠活动列表
     * @return List<WebDiscountEntity>
     */
    List<WebDiscountEntity> discountList();

    /**
     * 查询优惠活动详情
     * @param discountId
     * @return
     */
    WebDiscountEntity DiscountDetail(@Param("discountId") int discountId);


    List<HashMap<String, String>> bannerList(@Param("type") int type);
}
