package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.auth.AuthInfoEntity;
import com.cn.great.model.common.Constant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.user.AdminInfoEntity;
import com.cn.great.model.user.AgentInfoEntity;
import com.cn.great.model.user.BankInfoEntity;
import com.cn.great.req.user.LoginReq;
import com.cn.great.req.user.UserReq;
import com.cn.great.service.AgentService;
import com.cn.great.service.UserService;
import com.cn.great.util.GeneralUtils;
import com.cn.great.util.MD5Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Collections;
import java.util.List;
import java.util.Set;


/**
* @Description: 用户登录和登出
* @Author: Stamp
* @Date: 2019/4/9
*/
@Controller
@RequestMapping("/")
public class LoginController {

	@Resource
	private AgentService agentService;
	@Resource
	private UserService userService;

	@RequestMapping("/")
	public String index(Model model, HttpServletRequest request) {
		//查询银行卡信息
		List<BankInfoEntity> banks = agentService.fetchBanks();
		model.addAttribute("banks", banks);
		Object obj = request.getSession().getAttribute(Constant.USER_SESSION_NAME);
		if(obj != null)
			model.addAttribute("loginNameSession", obj);
		request.getSession().setAttribute(Constant.BANK_INFO_SESSION, banks);
		return "bill/sportbill";
	}


	@RequestMapping("/goLogin")
	public String toLogin(Model model, HttpServletRequest request) {
		if(request.getSession().getAttribute(Constant.USER_SESSION_NAME) == null)
			return "login";
		else
			return "redirect:/";
	}

	@PostMapping(value="login")
	@ResponseBody
	public ResponseEntity login(@RequestBody @Valid LoginReq loginReq, HttpServletRequest request){
		String userName = loginReq.getUserName();
		List<AuthInfoEntity> auths = userService.fetchAllAuths();
		Set<String> authUrls = GeneralUtils.filterToList(auths);
		request.getSession().setAttribute(Constant.AUTHS_ALL_SESSION, authUrls);
		List<AuthInfoEntity> owenAuths = userService.fetchOwenAuths(userName);
		owenAuths.removeAll(Collections.singleton(null));
		Set<String> ownAuthUrls = GeneralUtils.filterToList(owenAuths);
		request.getSession().setAttribute(Constant.AUTH_OWEN_SESSION, ownAuthUrls);
		String authOwenUrls = GeneralUtils.filterToString(owenAuths);
		request.getSession().setAttribute(Constant.AUTH_OWEN_SESSION_STR, authOwenUrls);
		UserReq userReq = new UserReq();
		userReq.setUserName(userName);
		String encryptPwd = MD5Utils.encodeByMD5(loginReq.getPassword());
		if(StringUtils.equals(userName, "admin")){
			List<AdminInfoEntity> admins =  userService.fetchAdminByName(userName);
			if(CollectionUtils.isEmpty(admins))
				throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_ERROR);
			AdminInfoEntity admin = admins.get(0);
			if(!StringUtils.equals(encryptPwd, admin.getPassword()) || admin.getStatus() != 0)
				throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_ERROR);
		}else{
			List<AgentInfoEntity> agents = agentService.fetchAgentByName(userName);
			if(CollectionUtils.isEmpty(agents))
				throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_ERROR);
			AgentInfoEntity agent = agents.get(0);
			if(!StringUtils.equals(encryptPwd, agent.getPassword()) || agent.getStatus() != 0)
				throw GeneralException.initEnumGeneralException(ResponseCodeEnum.LOGIN_ERROR);
		}
		request.getSession().setAttribute(Constant.USER_SESSION_NAME, userName);
		return ResponseEntity.initGeneralResponseMsg("success");
	}
	
	@RequestMapping(value="logout", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity logout(HttpServletRequest request, HttpServletResponse response){
		request.getSession().removeAttribute(Constant.USER_SESSION_NAME);
		return ResponseEntity.initGeneralResponseMsg("success");
	}

	/** 
	* @Description: 权限不足页面跳转 
	* @Param: [request, response] 
	* @return: java.lang.String
	* @Author: Stamp 
	* @Date: 2019/4/20 
	*/
	@RequestMapping(value="noPerm" , method= RequestMethod.GET)
	public String noPerm(Model model,HttpServletRequest request){
		Object obj = request.getSession().getAttribute(Constant.USER_SESSION_NAME);
		if(obj != null)
			model.addAttribute("loginNameSession", obj);
		return "noPerm";
	}

}
