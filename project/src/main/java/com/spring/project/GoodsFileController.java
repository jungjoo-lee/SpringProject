package com.spring.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.project.service.GoodsFileService;

@Controller
public class GoodsFileController {	
	private static final Logger logger = LoggerFactory.getLogger(GoodsFileController.class);
	
	@Autowired
	GoodsFileService goodsFileService;
}