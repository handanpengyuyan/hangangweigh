package com.weigh.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weigh.pojo.SysPermission;


public interface SysPermissionDao extends CommonDao<SysPermission, Integer>{

	public List<Integer> getPermissionIdsByRoleId(Integer roleId);
	
	public void deletePermissionsByRoleId(Integer roleId);
	
	public void addRolePermissions(@Param("roleId") Integer roleId,@Param("perIds") List<Integer> perIds);
	
	public List<SysPermission> getPermissionsByUserId(@Param("userId")Integer userId,@Param("type")String type);
	
	public List<String> getPermissionCodeByUserId(Integer userId);
}








