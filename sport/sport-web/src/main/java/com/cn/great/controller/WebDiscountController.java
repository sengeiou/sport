package com.cn.great.controller;

import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.discount.ConditionEntity;
import com.cn.great.model.discount.WebDiscountEntity;
import com.cn.great.model.online.LoginInfoEntity;
import com.cn.great.model.user.UserInfoEntity;
import com.cn.great.service.ConditionService;
import com.cn.great.service.ReceiveService;
import com.cn.great.service.UserService;
import com.cn.great.service.WebDiscountService;
import com.cn.great.util.IPUtils;
import com.cn.great.util.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @program: sport
 * @description: 活动类
 * @author: Chris
 * @create: 2019-04-03 11:10
 **/
@RestController
@RequestMapping("/Activity")
@Slf4j
public class WebDiscountController {

    @Autowired
    private WebDiscountService webDiscountService;

    // 支持多类型的数据缓存
    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private UserService userService;

    @Autowired
    private ConditionService conditionService;

    @Autowired
    private ReceiveService receiveService;

    @PostMapping(value = "DiscountList")
    public ResponseEntity discountList() throws GeneralException {
        log.info("【优惠活动列表查询开始--------by Chris】");
        List<WebDiscountEntity> webDiscountEntities = webDiscountService.discountList();
        log.info("【优惠活动列表查询完成--------by Chris】");

        return ResponseEntity.initGeneralResponseObj("优惠活动列表", webDiscountEntities);
    }

    @PostMapping(value = "DiscountDetail")
    public ResponseEntity DiscountDetail(@RequestParam("id") int discountId) throws GeneralException {
        log.info("【优惠活动详情查询开始--------by Chris】");
        WebDiscountEntity webDiscountEntities = webDiscountService.DiscountDetail(discountId);
        if (null == webDiscountEntities) {
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.NO_ID_ERROR);
        }
        log.info("【优惠活动详情查询完成--------by Chris】");

        return ResponseEntity.initGeneralResponseObj("优惠活动详情", webDiscountEntities);
    }

    @PostMapping(value = "RedRain")
    public ResponseEntity RedRain(@RequestParam("id") int id, HttpServletRequest request) throws GeneralException {

        log.info("【红包活动开始--------by Chris】");
        String ip = IPUtils.getRealIp(request, 0);
        Object userName = request.getSession().getAttribute(Constant.USER_NAME_SESSION);
        if (!StringUtils.isEmpty(String.valueOf(userName))) {
            Object obj = redisUtil.get(userName + Constant.USER_INFO_CACHE_SALT);
            UserInfoEntity user;
            if (obj == null) {
                log.info("从缓存中获取会员信息失败，从数据库获取会员信息......");
                user = userService.fetchUserInfo(String.valueOf(userName));
                if (user == null) {
                    log.error("<<<用户{}登录失败>>> 用户不存在", userName);
                    throw GeneralException.initEnumGeneralException(ResponseCodeEnum.USER_NOT_EXIST_ERROR);
                }
            } else {
                log.info("从缓存中获取用户信息成功......");
                user = (UserInfoEntity) obj;
            }
            /**
             * 获取当前活动对象
             */
            ConditionEntity condition = conditionService.ConditionById(id);

            /**
             * 通过userID查询，判断是否已领取红包
             */
            if (true == receiveService.receiveBoolean(user.getId(), null, condition.getId())) {
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CONDITION_USERID_EXIST_ERROR);
            }
            /**
             * 通过IP查询，判断是否已领取红包
             */
            if (true == receiveService.receiveBoolean(0, ip, condition.getId())) {
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CONDITION_IP_EXIST_ERROR);
            }
            Date date = new Date();
            long time = date.getTime();
            long StartTime = condition.getStartTime().getTime();
            long EndTime = condition.getEndTime().getTime();

            /**
             * 当前时间和开始时间对比，判断活动是否开启
             */
            if (time < StartTime) {
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CONDITION_START_EXIST_ERROR);
            }
            /**
             * 当前时间和结束时间对比，判断活动是否关闭
             */
            if (time > EndTime) {
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CONDITION_END_EXIST_ERROR);
            }
            /**
             * 判断状态,活动是否开启
             */
            if (1 != condition.getStatus()) {
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CONDITION_STATUS_EXIST_ERROR);
            }
            /**
             * 判断是否为黑名单
             */
            if (StringUtils.isNotEmpty(condition.getBlack())) {
                if (condition.getBlack().contains("," + user.getId() + ",")) {
                    throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CONDITION_BLACK_EXIST_ERROR);
                }
            }
            /**
             * 判断累计存款是否大于等于5001元
             */
            if (user.getCmoney().compareTo(BigDecimal.valueOf(5001)) < 0) {
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CONDITION_CMONEY_EXIST_ERROR);
            }

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String format = simpleDateFormat.format(date);
            System.out.println(format + "=====================================================");
            Date parse = null;
            try {
                parse = simpleDateFormat.parse(format);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            /**
             * 判断今日存款是否大于等于100元
             */
            String info = conditionService.monryInfo(user.getId(), parse.getTime());
            if (StringUtils.isEmpty(info) || Integer.valueOf(info) < 100) {
                throw GeneralException.initEnumGeneralException(ResponseCodeEnum.CONDITION_MONEY_EXIST_ERROR);
            }

            /**
             * 当所有条件都满足的情况下,开始进行领取红包，并扣款操作
             */
            int modify = conditionService.conditionModify(condition.getTotal(), condition.getTotal(), id, user.getId(), ip, user.getServerAdmin());
            if (modify > 0) {
                LoginInfoEntity userLoginInfo = userService.getUserLoginInfo(String.valueOf(userName));
                redisUtil.set(userName + Constant.USER_LOGIN_CACHE_SALT, userLoginInfo);
                log.info("【红包活动操作完成-----------by Chris】");
                return ResponseEntity.initGeneralResponseObj("领取成功", modify);
            }
        }
        return ResponseEntity.initGeneralResponseObj("失败", ResponseCodeEnum.INNER_ERROR);
    }

    @PostMapping(value = "IndexBanner")
    public ResponseEntity IndexBanner(@RequestParam("type") int type, HttpServletRequest request) throws GeneralException {
        log.info("【轮播图查询开始-----------by Chris】");
        List<HashMap<String, String>> bannerList = webDiscountService.bannerList(type);
        log.info("【轮播图查询完成-----------by Chris】");
        return ResponseEntity.initGeneralResponseObj("首页轮播图", bannerList);
    }


}
