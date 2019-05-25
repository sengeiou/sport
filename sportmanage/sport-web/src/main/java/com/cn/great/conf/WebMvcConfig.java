package com.cn.great.conf;

import com.cn.great.common.AuthenticationInterceptor;
import com.cn.great.common.CookieInterceptor;
import com.google.common.collect.ImmutableList;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private AuthenticationInterceptor authenticationInterceptor;
    @Autowired
    private CookieInterceptor cookieInterceptor;
    ImmutableList excludeTokenPaths = ImmutableList.of("/login", "/goLogin", "/static/js/**", "/static/adminlte/**",
            "/static/plugins/**","/static/css/**", "/static/img/**");


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticationInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(excludeTokenPaths)
                .order(1000);
        registry.addInterceptor(cookieInterceptor).addPathPatterns("/**").order(999);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }


}
