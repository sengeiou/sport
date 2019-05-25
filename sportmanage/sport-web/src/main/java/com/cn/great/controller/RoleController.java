package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.auth.RoleInfoEntity;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.req.auth.RoleReq;
import com.cn.great.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: sport
 * @description: 角色管理类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("role")
@Slf4j
public class RoleController {

    @Resource
    private RoleService roleService;


    /**
     * @Description: 权限管理列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("rolePage")
    public String userPage(Model model, HttpServletRequest request) {
        return "auth/role";
    }

    /**
     * @Description: 角色列表查询
     * @Param: [loginReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @PostMapping(value = "roleList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity roleList(@RequestBody RoleReq roleReq, HttpServletRequest request) throws GeneralException {
        List<RoleInfoEntity> roles = roleService.fetchRoleList(roleReq);
        Integer recordsTotal = roleService.countRoles(roleReq);
        return ResponseEntity.initGeneralResponseRes(roles, recordsTotal);
    }


    /** 
    * @Description: 新增角色
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody RoleReq roleReq, HttpServletRequest request) throws GeneralException {
        //校验角色名是否已存在
        if(roleService.checkRoleNameExist(roleReq))
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ROLE_IS_EXIST);
        roleService.addRoleInfo(roleReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
    * @Description: 修改角色
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody RoleReq roleReq, HttpServletRequest request) throws GeneralException {
        roleService.updateRoleInfo(roleReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
    * @Description: 物理删除角色
    * @Param: [id, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "remove", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity remove(@RequestBody BaseEntity baseEntity, HttpServletRequest request) throws GeneralException {
        if(baseEntity.getId() == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
        roleService.deleteRoleInfo(baseEntity.getId());
        return ResponseEntity.initGeneralSuccessResponse();
    }

    
}
