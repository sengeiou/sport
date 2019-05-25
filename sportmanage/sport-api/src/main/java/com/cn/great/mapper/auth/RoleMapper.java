package com.cn.great.mapper.auth;

import com.cn.great.model.auth.RoleInfoEntity;
import com.cn.great.req.auth.RoleReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 角色Mapper
 * @author: Stamp
 * @create: 2019-04-14 13:45
 **/
@Mapper
public interface RoleMapper {

    List<RoleInfoEntity> fetchRoleList(RoleReq roleReq);

    Integer countRoles(RoleReq roleReq);

    List<RoleInfoEntity> checkRoleNameExists(RoleReq roleReq);

    void addRoleInfo(RoleReq roleReq);

    void updateRoleInfo(RoleReq roleReq);

    void deleteRoleInfo(Integer id);
}
