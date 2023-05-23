package com.studycafe.article.domain;


public class Page {

	int pageNo;
	int start;
	int end;
	String searchTitle;

	public Page() {}
	public Page(int pageNo) {
		this.pageNo = pageNo;
		this.start = (pageNo-1)*5;
		this.end = pageNo*5;
	}
	public Page(int pageNo,String searchTitle) {
		this.pageNo = pageNo;
		this.start = (pageNo-1)*5;
		this.end = pageNo*5;
		this.searchTitle = searchTitle;
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
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	@Override
	public String toString() {
		return "Page [pageNo=" + pageNo + ", start=" + start + ", end=" + end + ", searchTitle=" + searchTitle + "]";
	}

	
	
	
}
