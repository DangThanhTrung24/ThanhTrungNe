package com.trungdt.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.trungdt.entity.Account;

@Service
public class SecurityInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)	throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null ){
			response.sendRedirect(request.getContextPath() + "/home/login");
			return false;
		}
		Account user =  (Account) session.getAttribute("user");
        if (!user.isAdmin()) { // Kiểm tra xem người dùng không phải là admin
            response.sendRedirect(request.getContextPath() + "/home/login");
            return false;
        }
		return true;
	}
}
