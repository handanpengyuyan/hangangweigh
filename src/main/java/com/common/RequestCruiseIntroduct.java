package com.common;

public class RequestCruiseIntroduct {

	private String typeName; //类别
	
	private String title;//标题
	
	private String cruiseCode;//船只代码
	
	private String categoryName;
	
	

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCruiseCode() {
		return cruiseCode;
	}

	public void setCruiseCode(String cruiseCode) {
		this.cruiseCode = cruiseCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
