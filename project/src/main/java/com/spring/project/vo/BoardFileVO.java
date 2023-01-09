package com.spring.project.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardFileVO {
	private int bf_no;
	private int bno;
	private String userid;
	private String orgName;
	private String realName;
	private String content_type;
	private long fileSize;
}