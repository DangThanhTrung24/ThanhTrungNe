package com.trungdt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.trungdt.entity.Account;
import com.trungdt.service.ShoppingCartService;
import com.trungdt.utils.SessionService;

@Component
public class LoggerInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService sessionService;

	@Autowired
	ShoppingCartService shoppingCartService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("postHandle()->" + request.getRequestURI());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Account user = sessionService.get("user");
		if (user != null) {
			request.setAttribute("isLogin", true);
			request.setAttribute("admin", user.isAdmin());
			request.setAttribute("fullname", user.getFullname());
			request.setAttribute("username", user.getUsername());
			request.setAttribute("photo", user.getPhoto());
			request.setAttribute("email", user.getEmail());
		} else {
			request.setAttribute("isLogin", false);
		}
		request.setAttribute("cart", shoppingCartService);
		System.out.println("postHandle()->" + request.getRequestURI());
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("postHandle()->" + request.getRequestURI());
	}
}
