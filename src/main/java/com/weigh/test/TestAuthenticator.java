package com.weigh.test;


import java.util.ArrayList;
import java.util.Arrays;

import org.apache.jasper.security.SecurityUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Test;


public class TestAuthenticator {
	@Test
	public void test() {
		
		//MD5加密，加盐，一次散列
		String pwdWithSalt = new Md5Hash("aptech", "qwert").toString();
		System.out.println("加盐：" + pwdWithSalt);
		// 构建SecurityManager工厂，IniSecurityManagerFactory可以从ini文件中初始化

		Factory<SecurityManager> factory = new
		IniSecurityManagerFactory("classpath:shiro.ini");
		// 通过工厂创建SecurityManager
		SecurityManager securityManager = factory.getInstance();
		// 将securityManager设置到运行环境中

		SecurityUtils.setSecurityManager(securityManager);
		// 创建一个Subject实例，该实例认证要使用上边创建的securityManager进行
		Subject subject = SecurityUtils.getSubject();
		// 创建token令牌，记录用户认证的身份和凭证即账号和密码
		UsernamePasswordToken token = new UsernamePasswordToken("aptech", "aptech");
		try {
		//用户登录
		subject.login(token);
		} catch (AuthenticationException e) {
		System.out.println("Login Denied!");
		e.printStackTrace();
		}
		//用户认证的状态
		System.out.println("state:" + subject.isAuthenticated());
		
		System.out.println("是否有role1角色"+subject.hasRole("role1"));
		System.out.println("是否有多个觉得角色"+subject.hasAllRoles(Arrays.asList("role1","role2")));
		System.out.println("是否有user资源的create权限"+subject.isPermitted("user:create"));
		System.out.println("是否有user资源的carray权限"+subject.isPermitted("user:query"));
		System.out.println("是否有user资源的delete权限"+subject.isPermitted("user:delete"));
		boolean isPermittedAll = subject.isPermittedAll("user:create","user:delete:1");
		System.out.println("isPermittedAll:" + isPermittedAll);
		
		//用户退出
		subject.logout();
		System.out.println("state:" + subject.isAuthenticated());
		
	}
}
