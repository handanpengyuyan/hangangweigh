package com.common;

import java.io.Serializable;

public class BaseBean implements Serializable{

	private int status;   //状态为400，错误请求  / 服务器不理解请求的语法
	private String msg;     //msg 是字符串形式
	private Object rows;    //rows 表示内容、行
	private Object total;    //total表示总数
	
	
	public void setStatus(int status) {
		this.status = status;
	}
	public int getStatus() {
		return status;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMsg() {
		return msg==null?"":msg;
	}
	public Object getRows() {
		return rows;
	}
	public void setRows(Object rows) {
		this.rows = rows;
	}
	public Object getTotal() {
		return total;
	}
	public void setTotal(Object total) {
		this.total = total;
	}
	
}
