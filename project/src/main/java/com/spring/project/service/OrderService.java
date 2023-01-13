package com.spring.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.OrderDAO;
import com.spring.project.mappers.OrderItemDAO;
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
	
	public void orderItemRegister(Map<String, Object> map) {
		orderItemDAO.orderItemRegister(map);
	}
}