package com.spring.project.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemVO {
	private int OrderItem_no;
	private String userid;
	private int order_no;
	private int goods_id;
}