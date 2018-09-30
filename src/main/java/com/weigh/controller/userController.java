package com.weigh.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.Pager;
import com.weigh.pojo.SysPermission;
import com.weigh.pojo.SysRole;
import com.weigh.pojo.SysUser;
import com.weigh.service.SysPermissionService;
import com.weigh.service.sysUserService;

@Controller
public class userController {
	@Autowired
	private sysUserService sysUserService;
	
	@Autowired
	private SysPermissionService sysPermissionService;
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String username,String password,ModelMap modelMap,HttpSession httpSession) throws Exception{
		SysUser sysUser = sysUserService.getByUsername(username);
		if (sysUser == null) {
			modelMap.put("error", "用户名密码错误");
			return "login";
		}else {
			Md5Hash md5Hash = new Md5Hash(password,sysUser.getSalt());
			if(!md5Hash.toString().equals(sysUser.getPassword())) {
				modelMap.put("error", "用户名密码错误");
				return "login";
			}else {
				//查询登陆用户的所有权限
				List<SysPermission> permissionList = sysPermissionService.getPermissionsByUserId(sysUser.getId(), "menu");
				List<String> percodes = sysPermissionService.getPermissionCodeByUserId(sysUser.getId());
				httpSession.setAttribute("percodes", percodes.toString());
				httpSession.setAttribute("permissions", permissionList);
				httpSession.setAttribute("loginuser", sysUser);
				System.out.println(permissionList);
				return "redirect:/main";
			}
		}
		
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/hello")
	public String hello() {
		return "hello";
	}
	
	@RequestMapping("/userList")
	@ResponseBody
	public Pager userlist(Integer offset, Integer limit,@RequestParam(defaultValue="id") String sort,@RequestParam(defaultValue="asc") String order,SysUser condition){
		Pager pager = new Pager();
		List<SysUser> list = sysUserService.getListByCondition(offset, limit, condition, sort, order);
		int total = sysUserService.getCountByCondition(condition);
		pager.setRows(list);
		pager.setTotal(total);
		return pager;
	}
	@RequestMapping("user/index")
	public String index() {
		return "user/userList";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession httpSession) throws Exception{
		httpSession.removeAttribute("loginuser");
		return "redirect:/login";
	}

}
