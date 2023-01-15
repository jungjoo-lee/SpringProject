package com.spring.project.mappers;

import org.springframework.stereotype.Repository;

import com.spring.project.vo.OrderItemVO;

@Repository
public interface OrderItemDAO {
	void orderItemRegister(OrderItemVO orderItemVO);
}