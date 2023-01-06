package com.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.GoodsDAO;

@Service
public class GoodsService {
	@Autowired
	GoodsDAO goodsDAO;
}