package com.spring.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.service.GoodsService;

@Controller
public class GoodsController {	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping("/goods/goodsList.do")
	public String goodsList() {
		logger.info("상품 목록");
		
		return "/goods/goodsList";
	}
	
	@RequestMapping("/goods/goodsRegisterForm.do")
	public String goodsRegisterForm() {
		logger.info("상품 목록");
		
		return "/goods/goodsRegisterForm";
	}
}