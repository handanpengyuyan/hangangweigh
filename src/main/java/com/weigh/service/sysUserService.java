package com.weigh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weigh.pojo.SysRole;
import com.weigh.pojo.SysUser;

public interface sysUserService {
	public SysUser getByUsername(@Param("username") String username);
	
	public List<SysUser> getListByCondition(@Param("start") int start,@Param("limit") int limit,@Param("condition") SysUser condition,@Param("column") String column,@Param("orderBy") String orderBy);
	public Integer getCountByCondition(@Param("condition") SysUser condition);
}
