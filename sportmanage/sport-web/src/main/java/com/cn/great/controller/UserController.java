package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.auth.RoleInfoEntity;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.user.AdminInfoEntity;
import com.cn.great.req.user.UserAddReq;
import com.cn.great.req.user.UserReq;
import com.cn.great.req.user.UserUpdateReq;
import com.cn.great.service.UserService;
import com.cn.great.util.DateUtils;
import com.cn.great.util.MD5Utils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: sport
 * @description: 用户管理类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("admin")
@Slf4j
public class UserController {

    @Resource
    private UserService userService;


    /**
     * @Description: 管理员列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("userPage")
    public String userPage(Model model, HttpServletRequest request) {
        //查询所有的角色
        List<RoleInfoEntity> roles = userService.fetchAllRoles();
        model.addAttribute("roles", roles);
        request.getSession().setAttribute(Constant.ROLES_SESSION, roles);
        return "user/userinfo";
    }

    /**
     * @Description: 管理员列表查询
     * @Param: [loginReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/3/30
     */
    @PostMapping(value = "userList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity userList(@RequestBody UserReq userReq, HttpServletRequest request) throws GeneralException {
        List<AdminInfoEntity> admins = userService.fetchAdminList(userReq);
        Integer recordsTotal = userService.countAdmins(userReq);
        return ResponseEntity.initGeneralResponseRes(admins, recordsTotal);
    }


    /** 
    * @Description: 新增管理员
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody @Valid UserAddReq userReq, HttpServletRequest request) throws GeneralException {
        String userName = userReq.getUserName();
        //校验用户名是否已存在
        if(!userService.checkAdminNameExist(userName))
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ACCOUNT_EXISTS_ERROR);
        userReq.setAddDate(DateUtils.getDateTime());
        String password = MD5Utils.encodeByMD5(userReq.getPassword());
        userReq.setPassword(password);
        userService.addSystemAdmin(userReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 修改管理员
    * @Param: [userReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/13 
    */
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody UserUpdateReq userReq, HttpServletRequest request) throws GeneralException {
        String password = userReq.getPassword();
        if(StringUtils.isNotBlank(password)){
            password = MD5Utils.encodeByMD5(password);
            userReq.setPassword(password);
        }
        userService.updateSystemAdmin(userReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /** 
    * @Description: 物理删除管理员
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
        userService.deleteSystemAdmin(baseEntity.getId());
        return ResponseEntity.initGeneralSuccessResponse();
    }


    /** 
    * @Description: 查询所有的角色
    * @Param: [roleReq, request] 
    * @return: com.cn.great.model.common.ResponseEntity 
    * @Author: Stamp 
    * @Date: 2019/4/16 
    */
    @PostMapping(value = "roles", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity roles(HttpServletRequest request) throws GeneralException {
        List<RoleInfoEntity> roles = new ArrayList<>();
        Object obj = request.getSession().getAttribute(Constant.ROLES_SESSION);
        if(obj != null){
            roles.addAll((List<RoleInfoEntity>)obj);
        }
        return ResponseEntity.initGeneralResponseRes(roles, roles.size());
    }

}
