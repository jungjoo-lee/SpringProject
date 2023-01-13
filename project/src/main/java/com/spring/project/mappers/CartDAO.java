package com.spring.project.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.project.vo.CartVO;

@Repository
public interface CartDAO {
	void cartRegister(CartVO vo);
	List<CartVO> cartList(String userid);
	void deleteCart(int cart_no);
	void updateCart(Map<String, String> map);
	List<CartVO> selectList(String userid);
	void completeOrder(List<Integer> list);
}