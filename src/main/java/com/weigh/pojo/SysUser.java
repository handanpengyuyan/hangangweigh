package com.weigh.pojo;

import java.io.Serializable;
import java.util.List;

public class SysUser implements Serializable {
	private Integer id;
	private String username;
	private String password;
	private String salt;
	private String locked;
	private List<SysRole> sysRoles;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getLocked() {
		return locked;
	}
	public void setLocked(String locked) {
		this.locked = locked;
	}
	public List<SysRole> getSysRoles() {
		return sysRoles;
	}
	public void setSysRoles(List<SysRole> sysRoles) {
		this.sysRoles = sysRoles;
	} 
	
	
}
