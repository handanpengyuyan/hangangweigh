package com.weigh.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.weigh.pojo.SysRole;

public interface SysRoleService {
	public List<SysRole> getAll();
	
	public Map<String, Object> add(SysRole sysRole);
	
	public List<SysRole> getListByCondition(@Param("start") int start,@Param("limit") int limit,@Param("condition") SysRole condition,@Param("column") String column,@Param("orderBy") String orderBy);
	public Integer getCountByCondition(@Param("condition") SysRole condition);
}
