package com.cn.great.service;

import com.cn.great.model.discount.WebDiscountEntity;

import java.util.HashMap;
import java.util.List;

public interface WebDiscountService {

    List<WebDiscountEntity> discountList();

    WebDiscountEntity DiscountDetail(int discountId);


    List<HashMap<String, String>> bannerList(int type);
}
