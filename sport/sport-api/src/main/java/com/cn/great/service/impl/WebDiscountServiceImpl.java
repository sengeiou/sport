package com.cn.great.service.impl;

import com.cn.great.mapper.discount.WebDiscountMapper;
import com.cn.great.model.discount.WebDiscountEntity;
import com.cn.great.service.WebDiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class WebDiscountServiceImpl implements WebDiscountService {

    @Autowired
    private WebDiscountMapper webDiscountMapper;

    @Override
    public List<WebDiscountEntity> discountList() {
        return webDiscountMapper.discountList();
    }

    @Override
    public WebDiscountEntity DiscountDetail(int discountId) {
        return webDiscountMapper.DiscountDetail(discountId);
    }

    @Override
    public List<HashMap<String, String>> bannerList(int type) {
        return webDiscountMapper.bannerList(type);
    }

}
