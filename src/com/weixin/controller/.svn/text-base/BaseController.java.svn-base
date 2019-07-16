package com.weixin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;


public class BaseController {
	Logger logger=Logger.getLogger(BaseController.class);
	
	/**
	 * 输出JSON
	 * @param json Ajax 字符串
	 * @param response
	 * @author qinyitao
	 * @date 2014.10.8
	 */
	protected void outJsonString(String json,HttpServletResponse response) {
		logger.info("***输出json***"+json);
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			logger.warn("###输出json异常###"+e.getMessage());
		}
	}
	/**
	 * 输出   bool true和false
	 * @param bool 
	 * @param response
	 * @author qinyitao
	 * @date 2014.10.8
	 */
	protected void outJsonString(boolean bool,HttpServletResponse response) {
		logger.info("***输出json***"+bool);
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().print(bool);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			logger.warn("###输出json异常###"+e.getMessage());
		}
	}
	/**
	 *  拼接JSON输出请求状态的字符串
	 * @param status Ajax返回状态
	 * @param msg Ajax返回信息
	 * @return JSON字符串
	 * @author qinyitao
	 * @date 2014.10.8
	 */
	protected String spliceJson(int status,String msg){
		JSONObject param=new JSONObject(); 
		param.put("Status", status);
		param.put("Message", msg);
		return param.toJSONString();
	}
	/**
	 * 封装请求参数的公共3项（UserID、LoginToken、DeviceID）
	 * @param id    -UserID
	 * @param token -LoginToken
	 * @return JSONObject 
	 * @author qinyitao
	 * @date 2014.10.8
	 */
	protected JSONObject setBaseParam(String id,String token){
		JSONObject param=new JSONObject(); 
		param.put("UserID", id);
		param.put("LoginToken", token);
		param.put("DeviceID", 4);
		return param;
	}
	
	/**
	 * @param status 状态码 
	 * @return boolean ==200 为true
	 * @author qinyitao
	 * @date 2014.10.8
	 */
	protected boolean isResponseOk(int status){
		if(status==200){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 依据key获取cookie中的值，没有此key返回""
	 * @param name  cookie的key
	 * @param request
	 * @return String cookie的value
	 * @author qinyitao
	 * @date 2014.10.8
	 */
	protected String getCookie(String name,HttpServletRequest request){
		Cookie[] cookies=request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if(StringUtils.equals(name, cookie.getName())){
				return cookie.getValue();
			}
		}
		return "";
	}
	
	/**
	 * 获取总页数
	 * @param dataCount
	 * @param pageSize
	 * @return
	 */
	protected Integer getPageCount(Integer dataCount,Integer pageSize){
		Integer pageCount = 0;
		pageCount = dataCount / pageSize;
		if(dataCount % pageSize != 0){
			pageCount += 1;
		}
		return pageCount;
	}
	
	/**
	 * @获取时间戳
	 * @author banliang
	 * @date 2016.1.5
	 */
	protected String getNowDate(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(d);
	}
	
	protected void saveCookie(final String key,final String val,final HttpServletResponse response){
		Cookie cookie3=new Cookie(key,val);
		cookie3.setPath("/");
		response.addCookie(cookie3);
	}
}
