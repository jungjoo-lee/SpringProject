package com.spring.project;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.service.UserService;
import com.spring.project.vo.PageVO;

@RestController
public class AdminRestController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/admin/userPage.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userPage(@RequestBody HashMap<String, Object> map) {
		logger.info("페이지 번호 : " + map);
		
		int amount = 10;
		int num = (Integer) map.get("num");
		int total = userService.totalUsers();
		PageVO pageVO = new PageVO(num, amount, total);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		try {
			resultMap.put("listUsers", userService.listUsers(pageVO));
			resultMap.put("status", true);
			resultMap.put("pageVO", pageVO);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "목록을 불러오지 못했습니다.");
		}
		
		return resultMap;
	}
}