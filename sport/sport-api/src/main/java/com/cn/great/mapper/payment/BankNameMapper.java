package com.cn.great.mapper.payment;

import com.cn.great.model.payment.BankNameEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BankNameMapper {

    List<BankNameEntity> getBanks();

    int checkBankCode(@Param("code") String code);
}