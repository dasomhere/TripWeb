package com.webapp.model.response;

import java.util.Map;

public class BodyObject {
	Map<Object, Object> items;
	Long numOfRows;
	Long pageNo;
	Long totalCount;
	
	public Map<Object, Object> getItems() {
		return items;
	}
	public void setItems(Map<Object, Object> items) {
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
