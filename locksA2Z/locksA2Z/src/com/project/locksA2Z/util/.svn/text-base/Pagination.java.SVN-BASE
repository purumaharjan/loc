package com.project.locksA2Z.util;

public class Pagination {
	private int currentPage=1;
	private int nextPage;
	private long totalCount;
 	private int pageSize=6;
 	@SuppressWarnings("unused")
	private long maxPageSize;
 	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNextPage() {
		return nextPage;
	}
	
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	public long getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(long number) {
		this.totalCount = number;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public long getMaxPageSize() {
		if(getTotalCount()%pageSize==0){
			return getTotalCount()/pageSize;
		}
		else {
			return getTotalCount()/pageSize+1;
		}
	}
	
	public void setMaxPageSize(long maxPageSize) {
		this.maxPageSize = maxPageSize;
	}

}
