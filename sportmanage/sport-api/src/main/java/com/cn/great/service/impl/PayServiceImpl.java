package com.cn.great.service.impl;

import com.cn.great.mapper.pay.PayInMapper;
import com.cn.great.mapper.pay.PayOutMapper;
import com.cn.great.mapper.sport.SportBillMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.pay.PayInEntity;
import com.cn.great.model.pay.PayOutEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.pay.PayOutRep;
import com.cn.great.req.pay.PayReq;
import com.cn.great.service.PayService;
import com.cn.great.service.UserService;
import com.cn.great.util.RSAUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


/**
 * @Description: 用户管理Service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */
@Service
public class PayServiceImpl implements PayService {
    @Autowired
    private PayInMapper payInMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private PayOutMapper payOutMapper;
    @Autowired
    private SportBillMapper sportBillMapper;
    @Override
    public Integer countPayIn(PayReq payReq) {
        return payInMapper.count(payReq);
    }

    @Override
    public List<PayInEntity> fetchPayInList(PayReq payReq) {
        return payInMapper.fetchList(payReq);
    }
    @Transactional
    @Override
    public void payInCheck(Integer id) {
        PayInEntity payIn=payInMapper.selectById(id);
        int mul=1;
        String reason="线下入款审核";
        if(payIn.getStatus()==2){
            mul=-1;
            reason="线下入款反审核";
            payIn.setStatus(0);
        }else{
            payIn.setStatus(2);
        }
        userService.updateBalance(payIn.getUserid(), payIn.getGold().multiply(new BigDecimal(mul)),reason,id);
        payInMapper.update(payIn);
    }

    @Override
    public List<PayOutEntity> fetchPayOutList(PayReq pay) {
        List<PayOutEntity> list=payOutMapper.fetchList(pay);
        list.stream().filter(p-> StringUtils.isNotBlank(p.getBankAccount())).forEach(p->p.setBankAccount(RSAUtils.privateDecrypt(p.getBankAccount(),Constant.USER_RSA_PRIVATE_KEY)));
        return list;
    }

    @Override
    public Integer countPayOut(PayReq pay) {
        return  payOutMapper.count(pay);
    }

    @Override
    public PayOutRep count4PayOut(Integer userId) {
        PayOutRep payOutRep=new PayOutRep();
        PayInEntity payIn=payInMapper.selectLast(userId);
        if(payIn!=null){
            payOutRep.setLastPayIn(payIn.getGold());
            BigDecimal LastAmount=sportBillMapper.countUserBetting(userId,payIn.getAddDate().getTime());
            payOutRep.setLastFlowCount(LastAmount);
        }
        BigDecimal amount=sportBillMapper.countUserBetting(userId,null);
        payOutRep.setFlowCount(amount);
        BigDecimal payInAmount=payInMapper.sumAmount(userId);
        payOutRep.setPayInCount(payInAmount==null?BigDecimal.ZERO:payInAmount);
        UserInfoEntity userInfo=userService.getUserById(userId);
        MemberInfoEntity memberInfo=userService.getMemberInfo(userInfo.getUserName());
        payOutRep.setAlias(RSAUtils.privateDecrypt(memberInfo.getAlias(), Constant.USER_RSA_PRIVATE_KEY));
        return payOutRep;
    }

    @Override
    public void updateStatus(Integer id, Integer toStatus) {
        //0-未审核1-审核成功2-已出款-3-审核失败-4-出款中-5-撤销出款
        PayOutEntity entity=payOutMapper.selectById(id);
        entity.setStatus(toStatus);
        String str="出款";
        int mul=-1;
        if("5".equals(toStatus)){
            str="撤销出款";
            mul=1;
        }
        payOutMapper.updateStatus(entity);
        if("2".equals(toStatus)||"5".equals(toStatus)){
            userService.updateBalance(entity.getUserid(),entity.getGold().multiply(new BigDecimal(mul)),str,id);
        }

    }
}
