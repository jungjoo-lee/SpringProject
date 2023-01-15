package com.spring.project;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.service.CartService;
import com.spring.project.vo.CartVO;
import com.spring.project.vo.UserVO;

@Controller
public class CartController {	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	CartService cartService;
	
	@RequestMapping("/cart/cartRegister.do")
	public @ResponseBody Map<String, Object> registerForm(@RequestBody Map<String, String> map, HttpServletRequest req) {
		logger.info("장바구니 담기");

		Map<String, Object> resultMap = new HashMap<>();
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		CartVO cartVO = CartVO.builder()
				.cart_no(0)
				.userid(userVO.getUserid())
				.goods_id(Integer.parseInt(map.get("goods_id")))
				.count(Integer.parseInt(map.get("count")))
				.build();
		
		try {
			cartService.cartRegister(cartVO);
			resultMap.put("status", true);
			resultMap.put("message", "장바구니에 담았습니다.\n확인하러 가시겠습니까?");
			resultMap.put("url", "/project/cart/cartListForm.do");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "장바구니 담기 실패");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/cart/cartListForm.do")
	public String cartListForm(Model model, HttpServletRequest req) {
		logger.info("장바구니 페이지");
		
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		try {
			model.addAttribute("userVO", userVO);
			model.addAttribute("list", cartService.cartList(userVO.getUserid()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/cart/cartListForm";
	}
	
	@RequestMapping("/cart/deleteCart.do")
	public @ResponseBody Map<String, Object> deleteCart(@RequestBody Map<String, String> map) {
		logger.info("장바구니 삭제");

		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			cartService.deleteCart(Integer.parseInt(map.get("cart_no")));
			resultMap.put("status", true);
			resultMap.put("message", "삭제 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/cart/updateCart.do")
	public @ResponseBody Map<String, Object> updateCart(@RequestBody Map<String, String> map) {
		logger.info("장바구니 수정");

		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			cartService.updateCart(map);
			resultMap.put("status", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/cart/updateCountCart.do")
	public @ResponseBody Map<String, Object> updateCountCart(@RequestBody Map<String, String> map) {
		logger.info("장바구니 수량 수정");

		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			cartService.updateCountCart(map);
			resultMap.put("status", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
}