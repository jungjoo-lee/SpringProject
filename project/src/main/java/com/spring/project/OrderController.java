package com.spring.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.service.CartService;
import com.spring.project.service.OrderService;
import com.spring.project.vo.OrderItemVO;
import com.spring.project.vo.OrderVO;
import com.spring.project.vo.UserVO;

@Controller
public class OrderController {	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value = "/order/orderForm.do", method = RequestMethod.GET)
	public String orderForm(Model model, HttpServletRequest req) {
		logger.info("주문 페이지");
		
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		model.addAttribute("list", cartService.selectList(userVO.getUserid()));
		model.addAttribute("userVO", userVO);
		
		StringTokenizer st = new StringTokenizer(userVO.getPhone(), "-");
		model.addAttribute("num1", st.nextToken());
		model.addAttribute("num2", st.nextToken());
		model.addAttribute("num3", st.nextToken());
		
		return "/order/orderForm";
	}
	
	@RequestMapping(value = "/order/orderRegister.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> orderRegister(@RequestBody Map<String, Object> map, HttpServletRequest req) {
		logger.info("주문");
		
		Map<String, Object> resultMap = new HashMap<>();
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		OrderVO orderVO = OrderVO.builder()
			.order_no(0)
			.userid(userVO.getUserid())
			.name(userVO.getName())
			.phone(userVO.getPhone())
			.postcode(userVO.getPostcode())
			.address(userVO.getAddress())
			.detailaddress(userVO.getDetailaddress())
			.delivery_id(1)
			.order_count(0)
			.order_price(0)
			.recipient_name((String)map.get("name"))
			.recipient_phone((String)map.get("phone"))
			.recipient_postcode((int)map.get("postcode"))
			.recipient_address((String)map.get("address"))
			.recipient_detailaddress((String)map.get("detailaddress"))
			.build();
		
		int orderNextVal = orderService.getNextVal();
		
		Map<String, Object> parameterMap = new HashMap<>();
		OrderItemVO orderItemVO = OrderItemVO.builder()
			.OrderItem_no(0)
			.userid(userVO.getUserid())
			.order_no(0)
			.build();
		parameterMap.put("orderItemVO", orderItemVO);
		parameterMap.put("orderList", map.get("orderList"));
		parameterMap.put("orderNextVal", orderNextVal);
		
		List<Integer> cartnoList = new ArrayList<>();
		cartnoList.add((Integer) map.get("orderList"));
		
		try {
			orderService.orderRegister(orderVO);
			orderService.orderItemRegister(parameterMap);
			resultMap.put("status", true);
			resultMap.put("message", "주문 완료");
			resultMap.put("url", "/project/user/orderListForm.do");
			cartService.completeOrder(cartnoList);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
}