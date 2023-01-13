package com.spring.project.common.interceptor;

import java.io.PrintWriter;

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
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('권한이 없습니다.');location.href = '/project/main/userMain.do';</script>");
			
			return false;
		} else if (result == null && userVO == null) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('로그인 해주세요');location.href = '/project/user/loginForm.do';</script>");
			
			return false;
		}
		return true;
	}
}