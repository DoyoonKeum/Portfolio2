package com.studycafe.qna.domain;


public class SearchPage {

	int pageNo;
	int start;
	int end;
	int rowSize;
	String keyword;
	String choice;

	public SearchPage() {}
	public SearchPage(String keyword, String choice, int pageNo, int rowSize) {
		this.pageNo = pageNo;
		//this.start = (pageNo-1)*5;
		//this.end = pageNo*5;
		this.start = (pageNo-1)*rowSize;
		this.end = pageNo*rowSize;
		this.rowSize = rowSize;
		this.keyword = keyword;
		this.choice = choice;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getStart() {
		return start;
	}
	public int getRowSize() {
		return rowSize;
	}
	public void setRowSize(int rowSize) {
		this.rowSize = rowSize;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public void setEnd(int end) {
		this.end = end;
	}
//	@Override
//	public String toString() {
//		return "Page [pageNo=" + pageNo + ", start=" + start + ", end=" + end + "]";
//	}
//	@Override
//	public String toString() {
//		return "Page [pageNo=" + pageNo + ", start=" + start + ", end=" + end + ", rowSize=" + rowSize + "]";
//	}
	@Override
	public String toString() {
		return "SearchPage [pageNo=" + pageNo + ", start=" + start + ", end=" + end + ", rowSize=" + rowSize
				+ ", keyword=" + keyword + ", choice=" + choice + "]";
	}
	
	
	
}
