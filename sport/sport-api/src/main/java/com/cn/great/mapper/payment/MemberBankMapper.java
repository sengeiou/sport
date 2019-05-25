package com.cn.great.mapper.payment;

import com.cn.great.model.payment.MemberBankEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberBankMapper {

    int insert(MemberBankEntity record);

    List<MemberBankEntity> getMyBankCards(@Param("userId") Integer userId);

    int checkBank(@Param("bankAccount") String bankAccount,@Param("code") String code,@Param("memberId") int memberId);

    int checkValidBank(@Param("bankId") int bankId,@Param("userId")Integer userId);

    int unbindBankcard(@Param("bankId")Integer bankId,@Param("userId")Integer userId);

}