package com.cn.great.service.impl;

import com.cn.great.mapper.discount.ConditionMapper;
import com.cn.great.mapper.discount.ReceiveMapper;
import com.cn.great.mapper.user.UserMapper;
import com.cn.great.model.discount.ConditionEntity;
import com.cn.great.service.ConditionService;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Service
public class ConditionServiceImpl implements ConditionService {

    @Autowired
    private ConditionMapper conditionMapper;

    @Autowired
    private ReceiveMapper receiveMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public ConditionEntity ConditionById(int id) {
        return conditionMapper.ConditionById(id);
    }

    @Override
    public String monryInfo(Integer id, long time) {
        return conditionMapper.moneyInfo(id, time);
    }

    @Override
    @Transactional
    public int conditionModify(BigDecimal total, BigDecimal getMoney, int id, Integer userId, String ip, String admin) {
        Random random = new Random();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // 0-99
        int num = random.nextInt(100);
//        double ran = Math.random() * num;
        boolean flag = true;
        do {
            if (getMoney.compareTo(BigDecimal.valueOf(num)) > -1) {
                int receive = 0;
                int i = conditionMapper.conditionModify(id, num);
                if (i > 0) {
                    receive = receiveMapper.addReceive(userId, num, ip, simpleDateFormat.format(date), id, admin);
                }
                if (receive > 0) {
                    if (userMapper.userConditionInMoney(num, userId) > 0) {
                        return num;
                    } else {
                        return 0;
                    }
                }
                flag = false;
            } else {
                // 0-99
                num = random.nextInt(100);
//                ran = Math.random() * num;
            }
        } while (flag);
        return 0;
    }
}
