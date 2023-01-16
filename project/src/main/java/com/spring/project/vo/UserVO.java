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
public class UserVO {
	private String userid;
	private String pwd;
	private String name;
	private String sex;
	private String phone;
	private String birthday;
	private String email;
	private int postcode;
	private String address;
	private String detailaddress;
	private int gno; // gname
	private String grade;
	private int discount;
	private int point;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp regi_Date;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp login_Date;
	private String login_Check;
	private String admin_check;
}