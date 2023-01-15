package com.spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.OrderDAO;
import com.spring.project.mappers.OrderItemDAO;
import com.spring.project.vo.OrderItemVO;
import com.spring.project.vo.OrderVO;

@Service
public class OrderService {
	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	OrderItemDAO orderItemDAO;
	
	public int getNextVal() {
		return orderDAO.getNextVal();
	}
	
	public void orderRegister(OrderVO orderVO) {
		orderDAO.orderRegister(orderVO);
	}
	
	public void orderItemRegister(OrderItemVO orderItemVO) {
		orderItemDAO.orderItemRegister(orderItemVO);
	}
	
	public List<OrderVO> orderList(String userid) {
		return orderDAO.orderList(userid);
	}
}