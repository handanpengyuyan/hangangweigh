package com.weigh.controller;

import java.awt.print.Book;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.common.Pager;
import com.weigh.pojo.SysPermission;
import com.weigh.pojo.SysRole;
import com.weigh.service.SysPermissionService;
import com.weigh.service.SysRoleService;


@Controller
@RequestMapping("/ce")
public class ceshiController {
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysPermissionService sysPermissionService;
	
	@RequestMapping("/rolelist")
	@ResponseBody
	public List<SysRole> rolelist(){
		
		return sysRoleService.getAll();
	}
	
	@RequestMapping(value="/add")
	@ResponseBody
	public List<SysRole> add() {
		List<SysRole> list = sysRoleService.getAll();
		//Map<String, Object> map = new HashMap<String, Object>();
		SysRole sysRole = new SysRole();
		sysRole.setName("最bu");
		sysRole.setAvailable("1");
		sysRoleService.add(sysRole);
		return list;	
	}
	
	
	@RequestMapping(value="/list")
	@ResponseBody
	public List<SysPermission> list() {
		
		List<SysPermission> list = sysPermissionService.getAll();
		return list;
	}
	@RequestMapping("/index")
	public String index() {
		return "sysermission/index";
	}
	
	@RequestMapping("/roleList")
	@ResponseBody
	public Pager roleList(Integer page, Integer rows,@RequestParam(defaultValue="id") String sort,@RequestParam(defaultValue="asc") String order,SysRole condition,String rolename) {
		Pager pager = new Pager();
		condition.setName(rolename);
		int start = (page - 1) * rows;
		List<SysRole> list = sysRoleService.getListByCondition(start, rows, condition, sort, order);
		int total = sysRoleService.getCountByCondition(condition);
		pager.setRows(list);
		pager.setTotal(total);
		return pager;
	}
	@RequestMapping("/GoRoleList")
	public String GoRoleList() {
		return "role/roleList";
	}
	@RequestMapping("/from")
	public String from(Integer rid,ModelMap modelMap) {
		
		return "role/sysrole_form";
	}
	@RequestMapping("/toAssign")
	public String toAssign(Integer roleId,ModelMap modelMap,Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		modelMap.put("roleId", roleId);
	
		return "role/assign";
		
	}
	@RequestMapping("/goassign")
	public String goassign() {
		return "role/assign";
	}
	@RequestMapping("/assign")
	@ResponseBody
	public Map<String, Object> assign(Integer roleId,Integer[] ids) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		sysPermissionService.deletePermissionsByRoleId(roleId);
		sysPermissionService.addRolePermissions(roleId, Arrays.asList(ids));
		map.put("result", true);
		return map;
	}

	@RequestMapping("/getPermissions")
	@ResponseBody
	public List<Integer> selectPermission(Integer roleId) throws Exception {
		return sysPermissionService.getPermissionIdsByRoleId(roleId);
	}
	
 
	
	
}
