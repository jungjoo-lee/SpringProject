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
public class GoodsVO {
	private int goods_id;
	private String status_name; // status_name
	private String cover;
	private String real_cover;
	private String thumbnail;
	private String real_thumbnail;
	private String book_title;
	private int price;
	private String content_image;
	private String real_content_image;
	private String author;
	private String publisher;
	private String publisher_content;
	private String book_index;
	private String introduce;
	private String release_date;
	private int page_number;
	private String book_size;
	private String point;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp regidate;
}