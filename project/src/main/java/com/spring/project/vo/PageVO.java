package com.spring.project.vo;

import lombok.Data;

@Data
public class PageVO {
	private int startPage; // 시작 페이지 번호
	private int endPage; // 종료 페이지 번호
	private int currentPage; // 현재 페이지 번호
	private int amount;
	private int total; // 전체 글의 행의 수
	private boolean prev;
	private boolean next;

	public PageVO(int currentPage, int amount, int total) {
		this.currentPage = currentPage;
		this.amount = amount;
		this.total = total;
		this.endPage = (int)Math.ceil(this.currentPage * 0.1) * 10;
		this.startPage = this.endPage - 10 + 1;
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		if(this.currentPage > realEnd) {
			this.currentPage = 1;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}