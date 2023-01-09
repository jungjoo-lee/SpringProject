package com.spring.project.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.CLOB;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int bno;
	private String userid;
	private int rowNum;
	private int parentno;
	private String category;
	private String title;
	private CLOB content;
	private int hit;
	private int like;
	private int dislike;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp regi_date;
}