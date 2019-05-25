package com.cn.great.conf;

import com.cn.great.common.AuthenticationInterceptor;
import com.cn.great.common.SystemInterceptor;
import com.google.common.collect.ImmutableList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private AuthenticationInterceptor authenticationInterceptor;
    @Autowired
    private SystemInterceptor systemInterceptor;
    //非access-token请求路径集合
    ImmutableList excludeTokenPaths = ImmutableList.of("/main/register", "/main/login", "/index/Captcha");

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticationInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(excludeTokenPaths)
                .order(1000);
        registry.addInterceptor(systemInterceptor)
                .addPathPatterns("/**")
                .order(1001);
    }

    /**
     * @Description: 跨域访问配置
     * @Param: [registry]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/2
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowCredentials(true)
                .allowedMethods("GET", "POST", "DELETE", "PUT", "PATCH")
                .maxAge(3600);
    }
}
