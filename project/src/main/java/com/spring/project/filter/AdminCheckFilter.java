package com.spring.project.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminCheckFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
	    HttpServletResponse httpResponse = (HttpServletResponse) response;
	    HttpSession session = httpRequest.getSession(false);
	    
	    try {
	    	if (session.getAttribute("adminLogin") == null) {
	    		httpResponse.sendRedirect("redirect:/main/userMain.do");
	    		return;
	    	}
	        
	        chain.doFilter(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public void destroy() {}
}