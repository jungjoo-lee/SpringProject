package com.spring.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.project.service.OrderService;

@Controller
public class OrderController {	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;
}