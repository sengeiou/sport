package com.cn.great.mapper.user;

import com.cn.great.model.user.MoneyChangeEntity;
import com.cn.great.req.user.TransferLogReq;

import java.util.List;

public interface MoneyChangeMapper {

    int insert(MoneyChangeEntity record);

    List<MoneyChangeEntity> getTransferLog(TransferLogReq req);
}