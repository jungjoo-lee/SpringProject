package com.spring.project.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.project.vo.CartVO;

@Repository
public interface CartDAO {
	void cartRegister(CartVO vo);
	List<CartVO> cartList(String userid);
	void deleteCart(int cart_no);
}