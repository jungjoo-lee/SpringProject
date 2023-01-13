package com.spring.project.mappers;

import org.springframework.stereotype.Repository;

import com.spring.project.vo.OrderVO;

@Repository
public interface OrderDAO {
	int getNextVal();
	void orderRegister(OrderVO orderVO);
}