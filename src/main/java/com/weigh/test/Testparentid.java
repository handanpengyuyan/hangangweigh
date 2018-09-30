package com.weigh.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.weigh.pojo.SysPermission;
import com.weigh.service.SysPermissionService;

public class Testparentid {
	@Resource
	SysPermissionService sysPermissionService;

	public void setSysPermissionService(SysPermissionService sysPermissionService) {
		this.sysPermissionService = sysPermissionService;
	}
	

	public SysPermissionService getSysPermissionService() {
		return sysPermissionService;
	}


	@Test
	public void test() {
		List<SysPermission> list = sysPermissionService.getAll();
		for (SysPermission parent : list) {
			System.out.println(parent.getText());
			
		}
	}
}
