package com.webapp.model.response;

import java.util.Map;

public class Body {
	Items items;
	Long numOfRows;
	Long pageNo;
	Long totalCount;
	
	public Items getItems() {
		return items;
	}
	public void setItems(Items items) {
		this.items = items;
	}
	public Long getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(Long numOfRows) {
		this.numOfRows = numOfRows;
	}
	public Long getPageNo() {
		return pageNo;
	}
	public void setPageNo(Long pageNo) {
		this.pageNo = pageNo;
	}
	public Long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}
}
