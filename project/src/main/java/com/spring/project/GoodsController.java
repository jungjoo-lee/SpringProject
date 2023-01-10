package com.spring.project;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.service.GoodsService;
import com.spring.project.util.Util;
import com.spring.project.vo.GoodsVO;
import com.spring.project.vo.PageVO;

@Controller
public class GoodsController {	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	static final String bookThumbnailPath = "C://book//thumbnail//";
	static final String bookImagePath = "C://book//image//";
	static final String bookContentPath = "C://book//content//";
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping("/goods/goodsImage.do/{filename}")
	public @ResponseBody void goodsImage(HttpServletRequest req, HttpServletResponse res, @PathVariable("filename") String filename) {
		Util util = new Util();
		util.thumbnail(res, filename);
	}
	
	@RequestMapping("/goods/goodsList.do")
	public String goodsList(Model model) {
		logger.info("상품 목록");
		
		int amount = 20;
		Map<String, Object> inpoMap = new HashMap<String, Object>();
		inpoMap.put("searchType", "");
		inpoMap.put("keyword", "");
		
		List<GoodsVO> list = new ArrayList<>();
		List<String> stringList = new ArrayList<>();
		Util util = new Util();

		try {			
			int total = goodsService.totalGoods(inpoMap);
			PageVO pageVO = new PageVO(1, amount, total);
			inpoMap.put("pageVO", pageVO);
			model.addAttribute("pageVO", pageVO);
			list = goodsService.listGoods(inpoMap);
			
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/goods/goodsList";
	}
	
	@RequestMapping("/goods/goodsRegisterForm.do")
	public String goodsRegisterForm() {
		logger.info("상품 목록");
		
		return "/goods/goodsRegisterForm";
	}
}