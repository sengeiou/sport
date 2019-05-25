package com.cn.great.service.impl;

import com.cn.great.mapper.auth.AuthMapper;
import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.auth.RoleAuthMapper;
import com.cn.great.req.auth.AuthAddReq;
import com.cn.great.req.auth.AuthReq;
import com.cn.great.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 权限ServiceIml
 * @author: Stamp
 * @create: 2019-04-14 13:47
 **/
@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthMapper authMapper;

    @Override
    public List<AuthInfoEntity> fetchParentAuths() {
        return authMapper.fetchParentAuths();
    }

    @Override
    public List<AuthInfoEntity> fetchAuthsAll() {
        return authMapper.fetchAuthsAll();
    }

    @Override
    public List<AuthInfoEntity> fetchAuthList(AuthReq authReq) {
        return authMapper.fetchAuthList(authReq);
    }

    @Override
    public Integer countAuths(AuthReq authReq) {
        return authMapper.countAuths(authReq);
    }

    @Override
    public boolean checkAuthNameExist(AuthAddReq authAddReq) {
        return !CollectionUtils.isEmpty(authMapper.validAuthNameExists(authAddReq));
    }

    @Transactional
    @Override
    public void addAuthInfo(AuthAddReq authAddReq) {
        authMapper.addAuthInfo(authAddReq);
    }

    @Transactional
    @Override
    public void updateAuthInfo(AuthAddReq authAddReq) {
        authMapper.updateAuthInfo(authAddReq);
    }

    @Transactional
    @Override
    public void deleteAuthInfo(Integer id) {
        authMapper.deleteMapperByAuthId(id);
        authMapper.deleteAuthInfo(id);
    }

    @Override
    public List<RoleAuthMapper> fetchSelectedAuths(Integer id) {
        return authMapper.fetchSelectedAuths(id);
    }

    @Transactional
    @Override
    public void configAuths(List<RoleAuthMapper> mappers) {
        //删除相关的数据
        authMapper.deleteMapperByRoleId(mappers.get(0).getRoleId());
        authMapper.configAuths(mappers);
    }
}
