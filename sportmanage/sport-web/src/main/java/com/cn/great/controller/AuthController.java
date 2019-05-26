package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.auth.RoleAuthMapper;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.req.auth.AuthAddReq;
import com.cn.great.req.auth.AuthReq;
import com.cn.great.service.AuthService;
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
import java.util.ArrayList;
import java.util.List;

/**
 * @program: sport
 * @description: 权限管理类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("auth")
@Slf4j
public class AuthController {

    @Resource
    private AuthService authService;


    /**
     * @Description: 权限管理列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("authPage")
    public String userPage(Model model, HttpServletRequest request) {
        List<AuthInfoEntity> parents = authService.fetchParentAuths();
        model.addAttribute("parentAuths", parents);
        request.getSession().setAttribute(Constant.AUTH_PARENT_SESSION, parents);
        return "auth/auth";
    }

    /**
     * @Description: 权限管理列表查询
     * @Param: [loginReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @PostMapping(value = "authList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity authList(@RequestBody AuthReq authReq, HttpServletRequest request) throws GeneralException {
        List<AuthInfoEntity> auths = authService.fetchAuthList(authReq);
        Integer recordsTotal = authService.countAuths(authReq);
        return ResponseEntity.initGeneralResponseRes(auths, recordsTotal);
    }


    /** 
    * @Description: 新增权限
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody AuthAddReq authAddReq, HttpServletRequest request) throws GeneralException {
        //校验权限名是否已存在
        if(authService.checkAuthNameExist(authAddReq))
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.AUTH_IS_EXIST);
        authService.addAuthInfo(authAddReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
    * @Description: 修改权限
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody AuthAddReq authAddReq, HttpServletRequest request) throws GeneralException {
        authService.updateAuthInfo(authAddReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
    * @Description: 物理删除权限
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
        authService.deleteAuthInfo(baseEntity.getId());
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 获取父权限
    * @Param: [request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/14 
    */
    @PostMapping(value = "parent", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity parent(HttpServletRequest request) throws GeneralException {
        List<AuthInfoEntity> parents = new ArrayList<>();
        Object obj =  request.getSession().getAttribute(Constant.AUTH_PARENT_SESSION);
        if(obj != null)
            parents.addAll((List<AuthInfoEntity>)obj);
        return ResponseEntity.initGeneralResponseObj("success", parents);
    }

    /** 
    * @Description: 查询所有的权限
    * @Param: [request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/15 
    */
    @PostMapping(value = "all", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity all(HttpServletRequest request) throws GeneralException {
        List<AuthInfoEntity> auths = authService.fetchAuthsAll();
        return ResponseEntity.initGeneralResponseRes(auths, auths.size());
    }

    /** 
    * @Description: 根据角色查询已经选中的权限
    * @Param: [request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/16 
    */
    @PostMapping(value = "auth", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity auth(@RequestBody BaseEntity baseEntity,  HttpServletRequest request) throws GeneralException {
        if(baseEntity.getId() == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
        List<RoleAuthMapper> ids = authService.fetchSelectedAuths(baseEntity.getId());
        return ResponseEntity.initGeneralResponseRes(ids, ids.size());
    }


    
}
