package com.spring.project;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.project.service.BoardFileService;

@Controller
public class BoardFileController {	
	private static final Logger logger = LoggerFactory.getLogger(BoardFileController.class);
	
	@Autowired
	BoardFileService boardFileService;
}