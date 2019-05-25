package com.cn.great.service.impl;

import com.cn.great.mapper.auth.AuthMapper;
import com.cn.great.mapper.auth.RoleMapper;
import com.cn.great.model.auth.RoleInfoEntity;
import com.cn.great.req.auth.RoleReq;
import com.cn.great.service.RoleService;
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
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private AuthMapper authMapper;


    @Override
    public List<RoleInfoEntity> fetchRoleList(RoleReq roleReq) {
        return roleMapper.fetchRoleList(roleReq);
    }

    @Override
    public Integer countRoles(RoleReq roleReq) {
        return roleMapper.countRoles(roleReq);
    }

    @Override
    public boolean checkRoleNameExist(RoleReq roleReq) {
        return !CollectionUtils.isEmpty(roleMapper.checkRoleNameExists(roleReq));
    }

    @Transactional
    @Override
    public void addRoleInfo(RoleReq roleReq) {
        roleMapper.addRoleInfo(roleReq);
    }

    @Transactional
    @Override
    public void updateRoleInfo(RoleReq roleReq) {
        roleMapper.updateRoleInfo(roleReq);
    }

    @Transactional
    @Override
    public void deleteRoleInfo(Integer id) {
        authMapper.deleteMapperByRoleId(id);
        roleMapper.deleteRoleInfo(id);
    }

}
