package com.cn.great.controller;

import com.cn.great.annotations.SecurityParameter;
import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.payment.BankNameEntity;
import com.cn.great.model.payment.MemberBankEntity;
import com.cn.great.model.payment.PayInEntity;
import com.cn.great.model.payment.PayOutEntity;
import com.cn.great.model.user.MemberInfoEntity;
import com.cn.great.model.user.MoneyChangeEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.req.payment.DepositReq;
import com.cn.great.req.payment.PaymentChannelReq;
import com.cn.great.req.payment.SetBankCardReq;
import com.cn.great.req.payment.WithdrawReq;
import com.cn.great.req.user.TransferLogReq;
import com.cn.great.service.PaymentService;
import com.cn.great.service.UserService;
import com.cn.great.util.DateUtils;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

import static com.cn.great.model.common.Constant.*;

/**
 * 支付controller
 */
@RestController
@RequestMapping("/payment")
@Slf4j
public class PaymentController {
    @Resource
    private PaymentService paymentService;

    @Resource
    private UserService userService;
    /**
     * 开户行列表
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/banks", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity banks(HttpServletRequest request) {
        List<BankNameEntity> bankNames = paymentService.getBanks();
        return ResponseEntity.initGeneralResponseObj("可用银行", bankNames);
    }

    /**
     * 支付类型列表
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/paymentCenter", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity paymentCenter(HttpServletRequest request) throws GeneralException {
        String result = paymentService.getPayTypes();
        return ResponseEntity.initGeneralResponseObj("支付中心", result);
    }

    /**
     * 支付通道
     * @param req
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/channel", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity channel(@RequestBody @Valid PaymentChannelReq req, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();

            UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
            if (user == null) {
                log.error("<<<用户{}登录失败>>> 用户不存在", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
            }
        List result = paymentService.getPaymentChannel(req, user);

        if (result.isEmpty()) {
            return ResponseEntity.initGeneralResponseObj("抱歉，暂时没有可用的支付通道", null);
        }
        return ResponseEntity.initGeneralResponseObj("", result);
    }

    /**
     * 会员提款申请
     * @param req
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/withdrawal", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity withdrawal(@RequestBody @Valid WithdrawReq req, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();

        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
            if (user == null) {
                log.error("用户{}不存在", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
            }


        MemberInfoEntity member= userService.getMemberInfo(String.valueOf(userName));
            if (member == null) {
                log.error("用户{}不存在", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
            }

        String withdrawPassword = req.getWithdraw_password();
        if(!StringUtils.equals(withdrawPassword,member.getWithdrawalPasswd())){
            log.error("用户{}申请提款，提款密码错误", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.DRAW_PASSWORD_ERROR);
        }
        int result = paymentService.applyWithdrawal(req,user,request);

        if(result <= 0){
            if(result == -1){
                log.error("用户{}当前还有未处理的提款请求!", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.WITHDRAW_QUESTION_ERROR);
            }else {
                log.error("用户{}申请提款，发生未知错误！", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TOKEN_NON_ERROR);
            }
        }
        return ResponseEntity.initGeneralResponseMsg("提交成功!");
    }


    /**
     * 会员提款申请
     * @param req
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/deposit", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity deposit(@RequestBody @Valid DepositReq req, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();
        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
            if (user == null) {
                log.error("用户{}不存在", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
            }
        int result = paymentService.applyDeposit(req,user,request);
        if(result <= 0){
            if(result == -1){
                log.error("用户{}还有未处理的入款请求!", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.INCOME_QUESTION_ERROR);
            }else if(result == -2){
                log.error("用户{}使用的该线下充值通道已关闭!", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.PREPAID_CLOSED_ERROR);
            }else {
                log.error("用户{}申请提款，发生未知错误！", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TOKEN_NON_ERROR);
            }
        }
        return ResponseEntity.initGeneralResponseMsg("提交成功!");
    }

    /**
     * 出款记录
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/withdrawalLog", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity withdrawalLog(@RequestBody @Valid WithdrawReq req, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();


           UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
            if (user == null) {
                log.error("用户{}不存在", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
            }
        String start_date = req.getStart_date();
        String end_date = req.getEnd_date();
        if(StringUtils.isEmpty(start_date)){
            start_date = DateUtils.getDate() + " 00:00:00";
            req.setStart_date(start_date);
        }
        if(StringUtils.isEmpty(end_date)){
            end_date = DateUtils.getDate() + " 23:59:59";
            req.setStart_date(end_date);
        }
        req.setUserId(user.getId());

        List<PayOutEntity> outLogs = paymentService.getWithdrawalLog(req);

        return ResponseEntity.initGeneralResponseObj("取款记录", outLogs);
    }

    /**
     * 存款记录
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/depositLog", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity depositLog(@RequestBody @Valid DepositReq req, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();
        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
        if (user == null) {
            log.error("用户{}不存在", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        }
        String start_date = req.getStart_date();
        String end_date = req.getEnd_date();
        if(StringUtils.isEmpty(start_date)){
            start_date = DateUtils.getDate() + " 00:00:00";
            req.setStart_date(start_date);
        }
        if(StringUtils.isEmpty(end_date)){
            end_date = DateUtils.getDate() + " 23:59:59";
            req.setStart_date(end_date);
        }
        req.setUserId(user.getId());

        List<PayInEntity> inLogs = paymentService.getDepositLog(req);

        return ResponseEntity.initGeneralResponseObj("存款记录", inLogs);
    }

    /**
     * 存款记录
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/transferLog", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity transferLog(@RequestBody @Valid TransferLogReq req, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();


       UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
        if (user == null) {
            log.error("用户{}不存在", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        }
        String start_date = req.getStart_date();
        String end_date = req.getEnd_date();
        if(StringUtils.isEmpty(start_date)){
            start_date = DateUtils.getDate() + " 00:00:00";
            req.setStart_date(start_date);
        }
        if(StringUtils.isEmpty(end_date)){
            end_date = DateUtils.getDate() + " 23:59:59";
            req.setStart_date(end_date);
        }
        req.setUserid(user.getId());

        List<MoneyChangeEntity> transferLogs = paymentService.getTransferLog(req);

        return ResponseEntity.initGeneralResponseObj("额度转换", transferLogs);
    }

    /**
     * 绑定银行卡
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/setBankCard", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity setBankCard(@RequestBody @Valid SetBankCardReq req, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();
        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
        if (user == null) {
            log.error("用户{}不存在", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        }
        req.setUserId(user.getId());

        int result = paymentService.setBankCard(req);
        if(result <= 0){
            if(result == -1){
                log.error("用户{} 重复绑定银行卡", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.REPEATED_BINDING_BANK_CARD_ERROR);
            }else if(result == -2){
                log.error("银行编码不存在");
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.BANK_CODE_NON_ERROR);
            }else {
                log.error("用户{}绑定银行卡，发生未知错误！", userName);
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.TOKEN_NON_ERROR);
            }
        }
        return ResponseEntity.initGeneralResponseMsg("设置成功");
    }

    /**
     * 解绑银行卡
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/unbindBankcard", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity unbindBankcard(@Param("bank_id") String bank_id, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();
        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
        if (user == null) {
            log.error("用户{}不存在", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        }
        int result = paymentService.unbindBankcard(Integer.valueOf(bank_id),user.getId());

        if(result <= 0){
            log.error("用户{}解绑银行卡失败！失败原因：该银行卡ID已经解绑或该卡ID与会员不匹配", userName);
            return ResponseEntity.initGeneralResponseMsg("解绑失败");
        }
        return ResponseEntity.initGeneralResponseMsg("解绑成功");
    }

    /**
     * 查看用户银行卡
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/bankCards", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity bankCards(HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();
        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
        if (user == null) {
            log.error("用户{}不存在", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        }
        List<MemberBankEntity> bankCards=paymentService.getMyBankCards(user.getId());
        return ResponseEntity.initGeneralResponseObj("用户银行卡",bankCards);
    }

    /**
     * 设置用户默认银行卡
     * @param bank_id
     * @param request
     * @return
     * @throws GeneralException
     */
    @SecurityParameter
    @PostMapping(value = "/setDefaultBank", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity setDefaultBank(@Param("bank_id") String bank_id, HttpServletRequest request) throws GeneralException {
        String userName = request.getSession().getAttribute(USER_NAME_SESSION).toString();
        UserInfoEntity user = userService.fetchUserInfo(String.valueOf(userName));
        if (user == null) {
            log.error("用户{}不存在", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
        }
        int result = paymentService.updateDefaultBank(Integer.valueOf(bank_id),user.getId());
        if(result == -1){
            log.error("用户{} 未绑定此银行卡", userName);
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.SET_DEFAULT_BANK_ERROR);
        }
        return ResponseEntity.initGeneralResponseMsg("操作成功");
    }
}
