package com.cn.great.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cn.great.mapper.payment.*;
import com.cn.great.mapper.user.MoneyChangeMapper;
import com.cn.great.mapper.user.UserMapper;
import com.cn.great.model.payment.*;
import com.cn.great.model.user.MoneyChangeEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.payment.DepositReq;
import com.cn.great.req.payment.PaymentChannelReq;
import com.cn.great.req.payment.SetBankCardReq;
import com.cn.great.req.payment.WithdrawReq;
import com.cn.great.req.user.TransferLogReq;
import com.cn.great.service.PaymentService;
import com.cn.great.util.DateUtils;
import com.cn.great.util.IPUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Service
public class PaymentServiceImpl implements PaymentService {


    @Autowired
    private BankNameMapper bankNameMapper;

    @Autowired
    private PayTypeNameMapper payTypeNameMapper;

    @Autowired
    private PayLevelMapper payLevelMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PaymentDataMapper paymentDataMapper;

    @Autowired
    private BankDataMapper bankDataMapper;

    @Autowired
    private PayOutMapper payOutMapper;

    @Autowired
    private PayInMapper payInMapper;

    @Autowired
    private MoneyChangeMapper moneyChangeMapper;

    @Autowired
    private MemberBankMapper memberBankMapper;
    /**
     * 获取可用开户行列表
     *
     * @return
     */
    @Override
    public List<BankNameEntity> getBanks() {
        return bankNameMapper.getBanks();
    }

    /**
     * 获取支付类型
     *
     * @return
     */
    @Override
    public String getPayTypes() {
        JSONObject payTypeJson = new JSONObject();
        List<PayTypeEntity> onlines = payTypeNameMapper.getPaymentType("1"); //线上支付
        JSONObject onlineJson = JSONObject.parseObject(JSON.toJSONString(onlines));
        payTypeJson.put("online", onlineJson);
        List<PayTypeEntity> offlinees = payTypeNameMapper.getPaymentType("2"); //线下支付
        JSONObject offlineeJson = JSONObject.parseObject(JSON.toJSONString(offlinees));
        payTypeJson.put("offline", offlineeJson);
        return payTypeJson.toString();
    }

    /**
     * 获取支付类目所有通道
     *
     * @param channelReq
     * @param user
     * @return
     */
    @Override
    @Transactional
    public List getPaymentChannel(PaymentChannelReq channelReq, UserInfoEntity user) {
        Integer cTime = user.getCtime();
        BigDecimal cMoney = user.getCmoney();
        List<PayLevelEntity> levels = payLevelMapper.getLevels();
        //获取用户支付分层
        Integer levelId = levels.stream().filter(level -> limit(cTime, level.getMixCtime(), level.getMaxCtime())
                || (cMoney.compareTo(level.getMixAmount()) != -1 && cMoney.compareTo(level.getMaxAmount()) != 1)
        ).max(Comparator.comparing(PayLevelEntity::getId)).get().getId();

        //分配用户分层   --- 规则？
        if(user.getLevelId() != levelId){
            user.setLevelId(levelId);
            userMapper.updateUserLevel(user);
        }

        channelReq.setLevelId(levelId);
        List channels = null;
        if(StringUtils.equals(channelReq.getType(),"1")){ //线上
            channels = paymentDataMapper.getOnlineChannel(channelReq);
        }else if(StringUtils.equals(channelReq.getType(),"2")){ //线下
            channels = bankDataMapper.getOfflineChannel(channelReq);
        }

        return channels;
    }

    /**
     * 申请提款
     *
     * @param req
     * @param user
     * @param request
     * @return
     */
    @Override
    @Transactional
    public int applyWithdrawal(WithdrawReq req, UserInfoEntity user, HttpServletRequest request) {
        int count = payOutMapper.checkNotApprovalOrder(user.getId());
        if(count <= 0) //存在未审核的提款申请
            return -1;
        PayOutEntity out = PayOutEntity.builder()
                .add_date(DateUtils.format(DateUtils.getCurrentTime(DateUtils.DATE_PATTERN_S)))
                .auditor(0)
                .bankId(Integer.valueOf(req.getBank_id()))
                .gold(new BigDecimal(req.getAmount()))
                .goldf(user.getMoney())
                .golds(user.getMoney().add(new BigDecimal(req.getAmount())))
                .ip(IPUtils.getRealIp(request,0))
                .notes("会员出款")
                .operator(0)
                .order_code(getOrderId("Withdraw"))
                .payId(0)
                .serverAdmin(user.getServerAdmin())
                .status(0).type(0).userid(user.getId()).build();
        int result = payOutMapper.insert(out);
        return result;
    }

    /**
     * 线下入款申请
     *
     * @param req
     * @param user
     * @param request
     * @return
     */
    @Override
    @Transactional
    public int applyDeposit(DepositReq req, UserInfoEntity user, HttpServletRequest request) {
        int count = payInMapper.checkNotApprovalIn(user.getId());
        if(count <= 0) //存在未审核的入款申请
            return -1;
        Double discountRate = bankDataMapper.getValidChannel(req.getId());//线下充值优惠百分比
        if(discountRate == null) //该线下充值通道已关闭
            return -2;

        BigDecimal youhuiGold = new BigDecimal(req.getGold()). //优惠金额 = 充值金额*优惠百分比
                multiply(new BigDecimal(discountRate).
                divide(new BigDecimal(100)));

        PayInEntity in = PayInEntity.builder()
                .add_date(DateUtils.format(req.getDatetime()))
                .youhuiGold(youhuiGold)
                .gold(new BigDecimal(req.getGold()))
                .goldf(user.getMoney())
                .golds(user.getMoney().                     //充值后金额 = 用户余额+充值金额+优惠金额
                        add(new BigDecimal(req.getGold())).add(youhuiGold))
                .ip(IPUtils.getRealIp(request,0))
                .notes("入款申请")
                .operator(0).order_code(req.getTrans_number()/*getOrderId("OfflinePayIn")*/)
                .pay_type_id(req.getId())
                .paymentNameId(0).pay_type_id(0).serverAdmin(user.getServerAdmin())
                .status(0).type(2).userid(user.getId()).build();
        return payInMapper.insert(in);
    }

    /**
     * 出款记录
     *
     * @param req
     * @return
     */
    @Override
    public List<PayOutEntity> getWithdrawalLog(WithdrawReq req) {
        return payOutMapper.getWithdrawalLog(req);
    }

    /**
     * 存款记录
     *
     * @param req
     * @return
     */
    @Override
    public List<PayInEntity> getDepositLog(DepositReq req) {
        return payInMapper.getDepositLogs(req);
    }

    /**
     * 额度转换记录
     *
     * @param req
     * @return
     */
    @Override
    public List<MoneyChangeEntity> getTransferLog(TransferLogReq req) {
        return moneyChangeMapper.getTransferLog(req);
    }

    /**
     * 设置银行卡
     *
     * @param req
     * @return
     */
    @Override
    @Transactional
    public int setBankCard(SetBankCardReq req) {
        int count = memberBankMapper.checkBank(req.getBank_account(),req.getCode(),req.getUserId());
        if(count <= 0) //重复绑定
            return -1;
        int countValid = bankNameMapper.checkBankCode(req.getCode());
        if(countValid <= 0) //银行卡编码不存在
            return -2;
        MemberBankEntity bank = MemberBankEntity.builder().bankNameId(1)
                .bank_account(req.getBank_account())//未加密
                .bank_address(req.getBank_address())//未加密
                .memberId(req.getUserId())
                .type(0).status(0).build();
        return memberBankMapper.insert(bank);
    }

    /**
     * 解绑银行卡
     *
     * @param bankId
     * @return
     */
    @Override
    @Transactional
    public int unbindBankcard(Integer bankId,Integer userId) {
        return memberBankMapper.unbindBankcard(bankId,userId);
    }

    /**
     * 查看用户银行卡
     *
     * @param userId
     * @return
     */
    @Override
    public List<MemberBankEntity> getMyBankCards(Integer userId) {
        return memberBankMapper.getMyBankCards(userId);
    }

    /**
     * 设置用户默认银行卡
     *
     * @param bankId
     * @param userId
     * @return
     */
    @Override
    @Transactional
    public int updateDefaultBank(Integer bankId, Integer userId) {
        int count = memberBankMapper.checkValidBank(bankId,userId);
        if(count <= 0)
            return -1;
        return userMapper.updateDefaultBank(bankId,userId);
    }

    //生成唯一订单号
    private static String getOrderId(String machine){
        int hashCode = UUID.randomUUID().toString().hashCode();
        if(hashCode < 0)
            hashCode = -hashCode;
        return machine + String.format("%015d",hashCode);
    }

    private boolean limit(int current, int min, int max) {
        return Math.max(min, current) == Math.min(current, max);
    }
}
