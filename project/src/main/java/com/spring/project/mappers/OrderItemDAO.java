package com.spring.project.mappers;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemDAO {
	void orderItemRegister(Map<String, Object> map);
}