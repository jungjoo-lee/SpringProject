package com.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.GoodsFileDAO;

@Service
public class GoodsFileService {
	@Autowired
	GoodsFileDAO goodsFileDAO;
}