package com.weixin.util;

import java.util.Random;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.weixin.entity.AccessToken;

/** 
 * @author :yanyonglin 
 * @version 创建时间：2016年8月23日 下午5:08:54 
 * 类说明 
 */
public class ThirdUtil {

	static Logger logger=Logger.getLogger(ThirdUtil.class);
	
	public static long lastGetJsApiTicketAccessTokenTime = 0;
	public static AccessToken jsApiTicketAccessToken = null;

	public static AccessToken getJsApiTicketAccessToken() {
	    long curTimeMillis = System.currentTimeMillis();
	    //如果当前获取时间距离上次获取时间，已经超过110分钟，重新获取(AccessToken2小时有效)
	    if((curTimeMillis-lastGetJsApiTicketAccessTokenTime)>110*60*1000){
	    	String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi"; 
	    	String requestUrl = ACCESS_TOKEN_URL.replace("ACCESS_TOKEN", WeixinUtil.getAccessToken().getToken());
	    	
		    JSONObject jsonObject = WeixinUtil.httpRequest(requestUrl, "GET", null);  
		    // 如果请求成功  
		    if (null != jsonObject) {  
		        try {  
		            jsApiTicketAccessToken = new AccessToken();  
		            jsApiTicketAccessToken.setToken(jsonObject.getString("ticket"));  
		            jsApiTicketAccessToken.setExpiresIn(jsonObject.getInteger("expires_in"));
		            lastGetJsApiTicketAccessTokenTime = System.currentTimeMillis();
		        } catch (Exception e) {  
		        	jsApiTicketAccessToken = null;  
		            // 获取token失败  
		            logger.error(jsonObject.getInteger("errcode"), e);  
		        }  
		    } 
	    } 
	    
	    return jsApiTicketAccessToken;  
	} 
	
	public static String getNonceStr(int length){
		
		String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";   
	    Random random = new Random();   
	    StringBuffer sb = new StringBuffer();   
	    for (int i = 0; i < length; i++) {   
	        int number = random.nextInt(base.length());   
	        sb.append(base.charAt(number));   
	    }   
	    return sb.toString();   
	}
}
