package com.weigh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weigh.dao.SysUserDao;
import com.weigh.pojo.SysRole;
import com.weigh.pojo.SysUser;
import com.weigh.service.sysUserService;
@Service
public class SysUserServiceImpl implements sysUserService {
	@Autowired
	private SysUserDao sysUserDao;
	public SysUser getByUsername(String username) {
		
		return sysUserDao.getByUsername(username);
	}
	public List<SysUser> getListByCondition(int start, int limit, SysUser condition, String column, String orderBy) {

		return sysUserDao.getListByCondition(start, limit, condition, column, orderBy);
	}
	public Integer getCountByCondition(SysUser condition) {

		return sysUserDao.getCountByCondition(condition);
	}


}
