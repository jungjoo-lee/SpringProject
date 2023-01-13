package com.spring.project.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
	private int order_no;
	private String userid;
	private String name;
	private String phone;
	private int postcode;
	private String address;
	private String detailaddress;
	private int delivery_id; // status_name
	private int order_count;
	private int order_price;
	private String recipient_name;
	private String recipient_phone;
	private int recipient_postcode;
	private String recipient_address;
	private String recipient_detailaddress;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp order_date;
}