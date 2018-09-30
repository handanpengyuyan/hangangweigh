package com.weigh.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weigh.dao.SysRoleDao;
import com.weigh.pojo.SysRole;
import com.weigh.service.SysRoleService;
@Service
public class SysRoleServiceImpl implements SysRoleService {
	@Autowired
	private SysRoleDao sysRoleDao;

	public List<SysRole> getAll() {
		
		return sysRoleDao.getAll();
	}

	public Map<String, Object> add(SysRole sysRole) {
		Map<String, Object> map = new HashMap<String, Object>();
		sysRoleDao.add(sysRole);
		map.put("result", true);
		return map;
		
	}

	public List<SysRole> getListByCondition(int start, int limit, SysRole condition, String column, String orderBy) {
		// TODO Auto-generated method stub
		return sysRoleDao.getListByCondition(start, limit, condition, column, orderBy);
	}

	public Integer getCountByCondition(SysRole condition) {
		// TODO Auto-generated method stub
		return sysRoleDao.getCountByCondition(condition);
	}





}
