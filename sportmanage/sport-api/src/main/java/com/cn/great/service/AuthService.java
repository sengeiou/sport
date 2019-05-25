package com.cn.great.service;

import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.auth.RoleAuthMapper;
import com.cn.great.req.auth.AuthAddReq;
import com.cn.great.req.auth.AuthReq;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 权限Service
 * @author: Stamp
 * @create: 2019-04-14 13:42
 **/
public interface AuthService {

    /**
     * @Description: 父权限查询
     * @Param: []
     * @return: java.util.List<com.cn.great.model.auth.AuthInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    List<AuthInfoEntity> fetchParentAuths();

    /**
     * @Description: 查询所有的权限
     * @Param: []
     * @return: java.util.List<com.cn.great.model.auth.AuthInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/15
     */
    List<AuthInfoEntity> fetchAuthsAll();

    /**
     * @Description: 权限查询
     * @Param: [userReq]
     * @return: java.util.List<com.cn.great.model.auth.AuthInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    List<AuthInfoEntity> fetchAuthList(AuthReq authReq);

    /**
     * @Description: 权限数查询
     * @Param: [userReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    Integer countAuths(AuthReq authReq);

    /**
     * @Description: 校验权限名称是否存在
     * @Param: [authAddReq]
     * @return: boolean
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    boolean checkAuthNameExist(AuthAddReq authAddReq);

    /**
     * @Description: 新增权限
     * @Param: [authAddReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    void addAuthInfo(AuthAddReq authAddReq);

    /**
     * @Description: 权限修改
     * @Param: [authAddReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    void updateAuthInfo(AuthAddReq authAddReq);

    /**
     * @Description: 删除权限
     * @Param: [id]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    void deleteAuthInfo(Integer id);

    /**
     * @Description: 根据角色ID查询所有被选中的权限
     * @Param: [id]
     * @return: java.util.List<java.lang.Integer>
     * @Author: Stamp
     * @Date: 2019/4/16
     */
    List<RoleAuthMapper> fetchSelectedAuths(Integer id);
    
    /** 
    * @Description: 权限配置
    * @Param: [authConfigReq] 
    * @return: void 
    * @Author: Stamp 
    * @Date: 2019/4/16 
    */
    void configAuths(List<RoleAuthMapper> mappers);
}
