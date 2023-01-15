package com.spring.project;

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
import com.spring.project.vo.CartVO;
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
		
		List<CartVO> list = cartService.selectList(userVO.getUserid());
		
		int count = 0;
		for (int i = 0; i < list.size(); i++) {
			count += list.get(i).getCount();
		}
		
		int price = 0;
		for (int i = 0; i < list.size(); i++) {
			price += (list.get(i).getPrice() - list.get(i).getPrice() * (userVO.getDiscount() / 100)) * list.get(i).getCount() + list.get(i).getDelivery_price();
		}
		
		int orderNextVal = orderService.getNextVal();
		
		OrderVO orderVO = OrderVO.builder()
			.order_no(orderNextVal)
			.userid(userVO.getUserid())
			.name(userVO.getName())
			.phone(userVO.getPhone())
			.postcode(userVO.getPostcode())
			.address(userVO.getAddress())
			.detailaddress(userVO.getDetailaddress())
			.delivery_id(1)
			.order_count(count)
			.order_price(price)
			.recipient_name((String)map.get("name"))
			.recipient_phone((String)map.get("phone"))
			.recipient_postcode(Integer.parseInt(String.valueOf(map.get("postcode"))))
			.recipient_address((String)map.get("address"))
			.recipient_detailaddress((String)map.get("detailaddress"))
			.payment((String)map.get("payment"))
			.cardname((String)map.get("cardName"))
			.cardnum((String)map.get("cardNum"))
			.build();
		
		try {
			orderService.orderRegister(orderVO);
			for (int i = 0; i < list.size(); i++) {			
				OrderItemVO orderItemVO = OrderItemVO.builder()
						.OrderItem_no(0)
						.userid(userVO.getUserid())
						.order_no(orderNextVal)
						.goods_id(list.get(i).getGoods_id())
						.count(list.get(i).getCount())
						.build();
				orderService.orderItemRegister(orderItemVO);
			}
			cartService.completeOrder(userVO.getUserid());
			resultMap.put("status", true);
			resultMap.put("message", "주문 완료");
			resultMap.put("url", "/project/order/orderListForm.do");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", false);
			resultMap.put("message", "오류");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value = "/order/orderListForm.do", method = RequestMethod.GET)
	public String orderListForm(Model model, HttpServletRequest req) {
		logger.info("주문 리스트 페이지");
		
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		model.addAttribute("list", orderService.orderList(userVO.getUserid()));
		model.addAttribute("userVO", userVO);
		
		return "/order/orderListForm";
	}
}