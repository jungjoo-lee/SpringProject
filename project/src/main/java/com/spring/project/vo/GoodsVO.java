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
public class GoodsVO {
	private int goods_id;
	private String status_id; // status_name
	private String thumbnail;
	private String real_thumbnail;
	private String book_title;
	private int price;
	private String content_image;
	private String real_content_image;
	private String author;
	private String publisher;
	private CLOB publisher_content;
	private CLOB book_index;
	private CLOB introduce;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp release_date;
	private String page_number;
	private String book_size;
	private String rating;
	private String point;
	private String buy_count;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp regidate;
}