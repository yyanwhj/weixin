package com.weixin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

/** 
 * @author :yanyonglin 
 * @version 创建时间：2015年12月9日 下午1:33:44 
 * 类说明 
 */
public interface UserService {

	/**
	 * 判断是否登录
	 * @author 闫永林
	 * @date 2015年12月9日
	 * @param WXAccount
	 * @return
	 */
	public JSONObject isLogin(String WXAccount,HttpServletRequest request,
			HttpServletResponse response);
	
	/**
	 * 获取OpenID
	 * @author 闫永林
	 * @date 2015年12月23日
	 * @param request
	 * @param response
	 * @return
	 */
	public String getOpenID(HttpServletRequest request,HttpServletResponse response);
	
	/**
	 * 获取客户端类型
	 * @author 闫永林
	 * @date 2015年12月22日
	 * @param request
	 * @param response
	 * @return
	 */
	public  int getClientType(HttpServletRequest request,HttpServletResponse response);
}
