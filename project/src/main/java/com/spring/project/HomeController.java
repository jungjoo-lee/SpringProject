package com.spring.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.project.service.BoardService;
import com.spring.project.service.GoodsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	GoodsService goodsService;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/main/userMain.do", method = RequestMethod.GET)
	public String userMain(Model model) {
		logger.info("userMain");
		
		return "/main/userMain";
	}
}