package com.spring.project.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.project.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");

		if (userVO == null) {
			response.sendRedirect("/project/user/loginForm.do");
			return false;
		}
		return true;
	}
}