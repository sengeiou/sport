package com.cn.great.mapper.auth;

import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.auth.RoleAuthMapper;
import com.cn.great.req.auth.AuthAddReq;
import com.cn.great.req.auth.AuthReq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 权限Mapper
 * @author: Stamp
 * @create: 2019-04-14 13:45
 **/
@Mapper
public interface AuthMapper {

    List<AuthInfoEntity> fetchParentAuths();

    List<AuthInfoEntity> fetchAuthList(AuthReq authReq);

    Integer countAuths(AuthReq authReq);

    List<AuthInfoEntity> validAuthNameExists(AuthAddReq authAddReq);

    void addAuthInfo(AuthAddReq authAddReq);

    void updateAuthInfo(AuthAddReq authAddReq);

    void deleteAuthInfo(Integer id);

    List<AuthInfoEntity> fetchAuthsAll();

    List<RoleAuthMapper> fetchSelectedAuths(Integer id);

    void configAuths(List<RoleAuthMapper> mappers);

    void deleteMapperByRoleId(Integer roleId);

    void deleteMapperByAuthId(Integer authId);
}
