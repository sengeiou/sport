package com.cn.great.service.impl;

import com.cn.great.mapper.message.NoticesMapper;
import com.cn.great.model.common.Constant;
import com.cn.great.model.user.NoticesEntity;
import com.cn.great.req.bulletin.NoticesReq;
import com.cn.great.service.NoticesService;
import com.cn.great.util.DateUtils;
import com.cn.great.util.RedisUtil;
import com.sun.javafx.geom.transform.Identity;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;


/**
 * @Description: 用户管理Service
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */
@Service
public class NoticesServiceImpl implements NoticesService {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private NoticesMapper noticesMapper;


    @Override
    public List<NoticesEntity> listAll(Integer alert) {
        //从redis里面拿
        List<NoticesEntity> noticesEntities = (List<NoticesEntity>) redisUtil.get(Constant.NOTICE_STR);
        if (alert != null){
            noticesEntities = noticesEntities.stream().filter(p -> p.getAlert().equals(alert)).collect(Collectors.toList());
        }else{
            //拿不到数据库查
            noticesEntities = noticesMapper.listAll(alert);
        }
        return noticesEntities;
    }

    @Override
    public Integer count(NoticesReq noticesReq) throws ParseException {
        //从redis里面拿
        List<NoticesEntity> noticesEntities =(List<NoticesEntity>) redisUtil.get(Constant.NOTICE_STR);
        Integer count=0;
        if(noticesEntities!=null){
            Iterator it=noticesEntities.iterator();
            filterRedisList(noticesReq, it);
            return noticesEntities.size();
        }else{
            return noticesMapper.count(noticesReq);
        }

    }

    @Override
    public List<NoticesEntity> fetchList(NoticesReq noticesReq) throws ParseException {

        List<NoticesEntity> noticesEntities = (List<NoticesEntity>) redisUtil.get(Constant.NOTICE_STR);
        if(noticesEntities!=null){
            Iterator it=noticesEntities.iterator();
            filterRedisList(noticesReq, it);
            return noticesEntities;
        }else{
            return noticesMapper.selectByReq(noticesReq);
        }
    }

    @Override
    public void delete(Integer id) {
        List<NoticesEntity> noticesEntities = (List<NoticesEntity>) redisUtil.get(Constant.NOTICE_STR);
        if(noticesEntities!=null){
            Iterator it=noticesEntities.iterator();
          while(it.hasNext()){
              NoticesEntity entity= (NoticesEntity)it.next();
              if(entity.getId().equals(id)){
                  it.remove();
              }
          }
            redisUtil.set(Constant.NOTICE_STR,noticesEntities);
        }
        noticesMapper.deleteById(id);
    }

    @Override
    public void save(NoticesEntity noticesEntity) {
        noticesEntity.setAddDate(new Date());
        noticesMapper.save(noticesEntity);
        List<NoticesEntity> noticesEntities = (List<NoticesEntity>) redisUtil.get(Constant.NOTICE_STR);
        if(noticesEntities!=null){
            noticesEntities.add(noticesEntity);
            redisUtil.set(Constant.NOTICE_STR,noticesEntities);
        }


    }

    @Override
    public void update(NoticesEntity noticesEntity) {
        List<NoticesEntity> noticesEntities = (List<NoticesEntity>) redisUtil.get(Constant.NOTICE_STR);
        if(noticesEntities!=null){
            Iterator it=noticesEntities.iterator();
            while(it.hasNext()){
                NoticesEntity entity= (NoticesEntity)it.next();
                if(entity.getId().equals(noticesEntity.getId())){
                    noticesEntity.setAddDate(entity.getAddDate());
                    it.remove();
                }
            }
            noticesEntities.add(noticesEntity);
            redisUtil.set(Constant.NOTICE_STR,noticesEntities);
        }
        noticesMapper.update(noticesEntity);
    }

    private void filterRedisList(NoticesReq noticesReq, Iterator it) throws ParseException {
        while(it.hasNext()){
            NoticesEntity entity =(NoticesEntity)it.next();
            if(StringUtils.isNotBlank(noticesReq.getTitle())&&!entity.getTitle().contains(noticesReq.getTitle())){
                it.remove();
            }
            if(StringUtils.isNotBlank(noticesReq.getBeginTime())&&StringUtils.isNotBlank(noticesReq.getEndTime())){
                Date start= DateUtils.format(noticesReq.getBeginTime());
                Date end=DateUtils.format(noticesReq.getEndTime());
                if(entity.getAddDate().compareTo(start)<0||entity.getAddDate().compareTo(end)>0){
                    it.remove();
                }
            }
        }
    }
}
