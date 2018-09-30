package com.weigh.realms;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

public class Myrealm extends AuthorizingRealm {

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//取出认证成功后的主身份信息
		String principal = (String) principals.getPrimaryPrincipal();
		//拿主身份去数据库查询所有权限信息（模拟）
		List<String> list = new ArrayList<String>();
		list.add("user:create");
		list.add("role:delete");
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addStringPermissions(list);
		return info;
	}

	/**
	 * 用户身份认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//取出身份信息
		String principal=(String) token.getPrincipal();
		//调用dao方法，根据身份从数据库查询用户信息
		if(!"aptech".equals(principal)) {
			return null;
		}

		//返回认证信息
		//盐，一般是随机数，盐要存放到数据库中
		String salt = "qwert";
		//返回认证信息
		return new SimpleAuthenticationInfo(principal, "e6b7bc4b60f2a303f28d0be3463de68d", ByteSource.Util.bytes(salt),
		getName());
	}



}
