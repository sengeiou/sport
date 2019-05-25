package com.cn.great.controller;

import com.cn.great.exception.GeneralException;
import com.cn.great.req.user.CaptchaReq;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @program: sport
 * @description: 生成验证码实体类
 * @author: Stamp
 * @create: 2019-04-02 16:16
 **/
@RestController
@RequestMapping("/index")
@Slf4j
public class IndexController {

    @Autowired
    private Producer captchaProducer = null;

    /** 
    * @Description: 获取验证码
    * @Param: [request, response] 
    * @return: void 
    * @Author: Stamp 
    * @Date: 2019/4/3 
    */
    @PostMapping(value = "/Captcha", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public void captcha(@RequestBody @Valid CaptchaReq captchaReq, HttpServletRequest request, HttpServletResponse response) throws GeneralException, IOException {

        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        //生成验证码
        String capText = captchaProducer.createText();
       /* //由于前后端分离可能存在跨域问题，验证码不能存在session中，必要时将验证码存放在redis和数据库中
        String userName = captchaReq.getUsername();
        userService.deleteUserCaptcha(userName);
        userService.addUserCaptcha(userName, capText);
        redisTemplate.opsForValue().set(userName+ Constant.USER_CAPTCHA_CACHE_SALT, capText);*/
        //在保证没有跨域或者跨域了能保证sessionid一致的前提下，可以将验证码缓存在session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        //向客户端写出
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
    }
}
