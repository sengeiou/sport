package com.cn.great.service;

import com.cn.great.model.auth.RoleInfoEntity;
import com.cn.great.req.auth.RoleReq;

import java.util.List;

/**
 * @program: sportmanage
 * @description: 角色Service
 * @author: Stamp
 * @create: 2019-04-14 13:42
 **/
public interface RoleService {


    /**
     * @Description: 角色查询
     * @Param: [userReq]
     * @return: java.util.List<com.cn.great.model.auth.AuthInfoEntity>
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    List<RoleInfoEntity> fetchRoleList(RoleReq roleReq);

    /**
     * @Description: 角色数查询
     * @Param: [userReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    Integer countRoles(RoleReq roleReq);

    /**
     * @Description: 校验角色名称是否存在
     * @Param: [authAddReq]
     * @return: boolean
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    boolean checkRoleNameExist(RoleReq roleReq);

    /**
     * @Description: 新增角色
     * @Param: [authAddReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    void addRoleInfo(RoleReq roleReq);

    /**
     * @Description: 角色修改
     * @Param: [authAddReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    void updateRoleInfo(RoleReq roleReq);

    /**
     * @Description: 删除角色
     * @Param: [id]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/14
     */
    void deleteRoleInfo(Integer id);
}
