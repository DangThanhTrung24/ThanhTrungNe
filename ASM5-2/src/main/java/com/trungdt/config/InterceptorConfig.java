package com.trungdt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.trungdt.interceptor.LoggerInterceptor;
import com.trungdt.interceptor.SecurityInterceptor;


@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	@Autowired
	LoggerInterceptor loggerInterceptor;
	@Autowired
	SecurityInterceptor auth;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loggerInterceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("/assets/**");
		
		
		registry.addInterceptor(auth)
		.addPathPatterns("/user/**", "/category/**","/order/**", "/admin/**")
		.excludePathPatterns("/user/login", "/admin/index");
//		
//		registry.addInterceptor(aut)
//		.addPathPatterns("/account/edit", "/account/chgpwd", "/order/**", "/admin/**")
//		.excludePathPatterns("/assets/**", "/admin/home/index");
	}
}
