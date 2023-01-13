package com.spring.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.spring.project.vo.UserVO;

@Controller
public class GoodsController {	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping("/goods/goodsImage.do/{filename}/{type}")
	public @ResponseBody void goodsImage(HttpServletRequest req, HttpServletResponse res, @PathVariable String filename, @PathVariable int type) {
		Util util = new Util();
		util.returnImage(res, filename, type);
	}
	
	@RequestMapping("/goods/goodsList.do")
	public String goodsList(Model model) {
		logger.info("상품 목록");
		
		int amount = 20;
		Map<String, Object> inpoMap = new HashMap<String, Object>();
		inpoMap.put("searchType", "");
		inpoMap.put("keyword", "");
		
		List<GoodsVO> list = new ArrayList<>();

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
	
	@RequestMapping("/goods/goodsView.do/{goods_id}")
	public String goodsView(@PathVariable("goods_id") int goods_id, Model model, HttpServletRequest req) {
		logger.info("상품 상세보기");
		
		try {
			HttpSession session = req.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userVO");
			model.addAttribute("vo", goodsService.goodsView(goods_id));
			model.addAttribute("userVO", userVO);
			logger.info("" + goodsService.goodsView(goods_id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/goods/goodsView";
	}
}