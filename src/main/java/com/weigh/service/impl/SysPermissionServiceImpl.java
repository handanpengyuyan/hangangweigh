package com.weigh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weigh.dao.SysPermissionDao;
import com.weigh.pojo.SysPermission;
import com.weigh.service.SysPermissionService;

@Service
public class SysPermissionServiceImpl implements SysPermissionService {
	@Autowired
	private SysPermissionDao sysPermissionDao;

	public List<SysPermission> getAll() {
		
		return sysPermissionDao.getAll();
	}

	public List<Integer> getPermissionIdsByRoleId(Integer roleId) {
		// TODO Auto-generated method stub
		return sysPermissionDao.getPermissionIdsByRoleId(roleId);
	}

	public void deletePermissionsByRoleId(Integer roleId) {
		sysPermissionDao.deletePermissionsByRoleId(roleId);
		
	}

	public void addRolePermissions(Integer roleId, List<Integer> perIds) {
		sysPermissionDao.addRolePermissions(roleId, perIds);
		
	}

	public List<SysPermission> getPermissionsByUserId(Integer userId, String type) {
		return sysPermissionDao.getPermissionsByUserId(userId, type);
	}

	public List<String> getPermissionCodeByUserId(Integer userId) {
		
		return sysPermissionDao.getPermissionCodeByUserId(userId);
	}

}
