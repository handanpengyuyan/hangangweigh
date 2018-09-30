package com.weigh.dao;

import org.apache.ibatis.annotations.Param;

import com.weigh.pojo.SysUser;

public interface SysUserDao extends CommonDao<SysUser, Integer>{
	/**
	 * 根据用户名查询用户信息
	 * @param username
	 * @return
	 */
	public SysUser getByUsername(@Param("username") String username);
	 
}
