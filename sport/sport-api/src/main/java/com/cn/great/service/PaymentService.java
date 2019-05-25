package com.cn.great.service;

import com.cn.great.model.payment.BankNameEntity;
import com.cn.great.model.payment.MemberBankEntity;
import com.cn.great.model.payment.PayInEntity;
import com.cn.great.model.payment.PayOutEntity;
import com.cn.great.model.user.MoneyChangeEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.payment.DepositReq;
import com.cn.great.req.payment.PaymentChannelReq;
import com.cn.great.req.payment.SetBankCardReq;
import com.cn.great.req.payment.WithdrawReq;
import com.cn.great.req.user.TransferLogReq;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 开户行列表
 */
public interface PaymentService {

    /**
     * 获取可用开户行列表
     * @return
     */
    List<BankNameEntity> getBanks();

    /**
     * 获取支付类型
     * @return
     */
    String getPayTypes();

    /**
     * 获取支付类目所有通道
     * @param channelReq
     * @param user
     * @return
     */
    List getPaymentChannel(PaymentChannelReq channelReq, UserInfoEntity user);

    /**
     * 申请提款
     * @param req
     * @param user
     * @param request
     * @return
     */
    int applyWithdrawal(WithdrawReq req, UserInfoEntity user, HttpServletRequest request);

    /**
     * 线下入款申请
     * @param req
     * @param user
     * @param request
     * @return
     */
    int applyDeposit(DepositReq req, UserInfoEntity user, HttpServletRequest request);

    /**
     * 出款记录
     * @param req
     * @return
     */
    List<PayOutEntity> getWithdrawalLog(WithdrawReq req);

    /**
     * 存款记录
     * @param req
     * @return
     */
    List<PayInEntity> getDepositLog(DepositReq req);

    /**
     * 额度转换记录
     * @param req
     * @return
     */
    List<MoneyChangeEntity> getTransferLog(TransferLogReq req);

    /**
     * 设置银行卡
     * @param req
     * @return
     */
    int setBankCard(SetBankCardReq req);

    /**
     * 解绑银行卡
     * @param bankId
     * @return
     */
    int unbindBankcard(Integer bankId,Integer userId);

    /**
     * 查看用户银行卡
     * @param userId
     * @return
     */
    List<MemberBankEntity> getMyBankCards(Integer userId);

    /**
     * 设置用户默认银行卡
     * @param bankId
     * @param userId
     * @return
     */
    int updateDefaultBank(Integer bankId, Integer userId);
}
