package com.spring.project;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.service.UserService;
import com.spring.project.vo.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	UserService userService;

	@RequestMapping(value = "/admin/adminMain.do", method = RequestMethod.GET)
	public String adminMain(Model model) {
		logger.info("메인");
		
		return "/admin/adminMain";
	}
	
	@RequestMapping(value = "/admin/userList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberList(Model model) {
		logger.info("회원 리스트");
		
		int amount = 10;
		Map<String, Object> inpoMap = new HashMap<String, Object>();
		inpoMap.put("searchType", "");
		inpoMap.put("keyword", "");
		int total = userService.totalUsers(inpoMap);
		PageVO pageVO = new PageVO(1, amount, total);
		inpoMap.put("pageVO", pageVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("list", userService.listUsers(inpoMap));
		
		return "/admin/userList";
	}
	
	@RequestMapping(value = "/admin/goodsList.do", method = RequestMethod.GET)
	public String goodsList(Model model) {
		logger.info("상품 리스트");
		
		return "/admin/goodsList";
	}
	
	@RequestMapping(value = "/admin/goodsRegisterForm.do", method = RequestMethod.GET)
	public String goodsRegister(Model model) {
		logger.info("상품 등록 페이지");
		
		return "/admin/goodsRegisterForm";
	}
}