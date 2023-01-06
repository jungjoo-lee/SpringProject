package com.spring.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.spring.project.mappers.VisitDAO;
import com.spring.project.vo.VisitCountVO;


public class VisitService implements HttpSessionListener {
	private static final Logger logger = LoggerFactory.getLogger(VisitService.class);
	
	@Autowired(required = true)
	VisitDAO visitDAO;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
        if(se.getSession().isNew()){
            execute(se);
        }
    }
 
    private void execute(HttpSessionEvent se) {
        try {
        	HttpSession session = se.getSession();
            WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
            HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
            visitDAO = (VisitDAO) wac.getBean("visitDAO");
            VisitCountVO vo = new VisitCountVO();
            vo.setVisit_ip(req.getRemoteAddr());
            vo.setVisit_agent(req.getHeader("User-Agent"));
            vo.setVisit_refer(req.getHeader("referer"));
            visitDAO.insertVisitor(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {}
}