package com.spring.project.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GoodsVO {
	private int goods_id;
	private String status_id; // status_name
	private String thumbnail;
	private String book_title;
	private String content_image;
	private String author;
	private String publisher;
	private String publisher_content;
	private String book_index;
	private String introduce;
	private String release_date;
	private String page_number;
	private String book_size;
	private String rating;
	private String point;
	private String buy_count;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private String regidate;
}