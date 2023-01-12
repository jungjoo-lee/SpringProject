package com.spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.mappers.CartDAO;
import com.spring.project.vo.CartVO;

@Service
public class CartService {
	@Autowired
	CartDAO cartDAO;
	
	public void cartRegister(CartVO vo) {
		cartDAO.cartRegister(vo);
	}
	
	public List<CartVO> cartList(String userid) {
		return cartDAO.cartList(userid);
	}
	
	public void deleteCart(int cart_no) {
		cartDAO.deleteCart(cart_no);
	}
}