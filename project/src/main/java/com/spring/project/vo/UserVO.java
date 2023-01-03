package com.spring.project.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	private String userid;
	private String pwd;
	private String name;
	private String sex;
	private String phone;
	private String address;
	private Timestamp loginDateTime;
	private Timestamp regiDate;
	private String loginCheck;
	private String admincheck;
}