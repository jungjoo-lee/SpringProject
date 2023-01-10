package com.spring.project.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.project.vo.UserVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Boolean result = (Boolean) session.getAttribute("adminLogin");
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		if (result == null && userVO != null) {
			response.sendRedirect("/project/main/userMain.do");
			return false;
		} else if (result == null && userVO == null) {
			response.sendRedirect("/project/user/loginForm.do");
			return false;
		}
		return true;
	}
}