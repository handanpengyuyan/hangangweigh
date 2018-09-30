package com.weigh.pojo;

import java.io.Serializable;

public class SysRole implements Serializable {
	private int id;
	private String name;
	private String available;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	
}
