package com.kjh.bbs.vo;

import java.util.List;
import java.util.Map;

public class Pagination {
	private int total;	//전체 행의수 : 70
	private int currentPage;	//현재 페이지 번호
	private List<Map<String, Object>> content;	//게시글 목록
	private int totalPages;	//전체 페이지 개수 : 7
	private int startPage;	//시작 페이지 번호 [*1] [2] [3] [4] [5] 다음
	private int endPage;	//종료 페이지 번호 [1] [2] [3] [4] [*5] 다음
	
	
	public Pagination(int total, int currentPage, int size, List<Map<String, Object>> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		if(total==0) {
			totalPages = 0;
			startPage = 0;
			this.endPage = 0;
		}else {
			totalPages = total / size;
			if(total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;
			
			startPage = currentPage / 5 * 5 + 1;
			if(modVal==0) {
				startPage -= 5;
			}
				
			endPage = startPage + 4;
			if(endPage > totalPages) {
				endPage = totalPages;
			}
			
		}
	} // end constructor


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public List<Map<String, Object>> getContent() {
		return content;
	}


	public void setContent(List<Map<String, Object>> content) {
		this.content = content;
	}


	public int getTotalPages() {
		return totalPages;
	}


	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	@Override
	public String toString() {
		return "Pagination [total=" + total + ", currentPage=" + currentPage + ", content=" + content + ", totalPages="
				+ totalPages + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
	
	

}
