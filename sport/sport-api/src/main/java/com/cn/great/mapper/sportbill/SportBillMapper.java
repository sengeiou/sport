package com.cn.great.mapper.sportbill;


import com.cn.great.model.match.*;
import com.cn.great.req.match.SportBetLogReq;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SportBillMapper {

    List<SportBillEntity> getSportBetLog(SportBetLogReq req);

    BasketballQuotaEntity getBasketballQuotaConfig();

    FootballQuotaEntity getFootballQuotaConfig();

    List<SportHotEntity> getSportHotById(int mid, int mLeagueId);

    Integer addBet(SportBillEntity sportBill);

    void batchSaveMixBill(@Param("list") List<SportMixBillEntity> list);
}
