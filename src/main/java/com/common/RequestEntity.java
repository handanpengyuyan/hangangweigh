package com.common;

public class RequestEntity {
	
	private String cruiseCode;
	private String voyageNo;
	private String startTimeSail;
	private String endTimeSail;
	private String nowDay;
	
	public String getStartTimeSail() {
		return startTimeSail;
	}
	public void setStartTimeSail(String startTimeSail) {
		this.startTimeSail = startTimeSail;
	}
	public String getEndTimeSail() {
		return endTimeSail;
	}
	public void setEndTimeSail(String endTimeSail) {
		this.endTimeSail = endTimeSail;
	}
	public String getCruiseCode() {
		return cruiseCode;
	}
	public void setCruiseCode(String cruiseCode) {
		this.cruiseCode = cruiseCode;
	}
	public String getVoyageNo() {
		return voyageNo;
	}
	public void setVoyageNo(String voyageNo) {
		this.voyageNo = voyageNo;
	}
	public String getNowDay() {
		return nowDay;
	}
	public void setNowDay(String nowDay) {
		this.nowDay = nowDay;
	}

	
}
