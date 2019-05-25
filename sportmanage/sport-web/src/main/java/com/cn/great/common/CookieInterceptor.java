package com.cn.great.common;


import com.cn.great.config.I18nUtil;
import com.cn.great.model.common.Constant;
import com.cn.great.util.FtlUtil;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;


/**
* @Description:  push cookies to model as cookieMap
* @Author: Stamp
* @Date: 2019/4/7
*/
@Component
public class CookieInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
						   ModelAndView modelAndView) throws Exception {

		if (modelAndView!=null && ArrayUtils.isNotEmpty(request.getCookies())) {
			HashMap<String, Cookie> cookieMap = new HashMap<>();
			for (Cookie ck : request.getCookies()) {
				cookieMap.put(ck.getName(), ck);
			}
			modelAndView.addObject("cookieMap", cookieMap);
		}
		if (modelAndView != null) {
			modelAndView.addObject("I18nUtil", FtlUtil.generateStaticModel(I18nUtil.class.getName()));

			Object obj = request.getSession().getAttribute(Constant.USER_SESSION_NAME);
			String userName = "";
			if(obj != null){
				userName = (String)obj;
			}
			modelAndView.addObject("loginName", userName);

			String authOwenUrls = "";
			Object authOwens = request.getSession().getAttribute(Constant.AUTH_OWEN_SESSION_STR);
			if(authOwens != null){
				authOwenUrls = (String)authOwens;
			}
			modelAndView.addObject("authOwenUrls", authOwenUrls);
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
