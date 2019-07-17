package com.weixin.controller;

import java.security.MessageDigest;
import java.util.Date;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weixin.entity.AccessToken;
import com.weixin.util.ThirdUtil;
import com.weixin.util.WeixinUtil;

/** 
 * @author :yanyonglin 
 * @version 创建时间：2016年8月23日 下午2:48:50 
 * 类说明 
 */
@Controller
@RequestMapping("third")
public class ThirdController extends BaseController{

	@RequestMapping("getJsApiArguments")
	public void getJsApiArguments(String shareURL,HttpServletRequest request,HttpServletResponse response){
		try {
			
			
			AccessToken jsApiTicketAccessToken = ThirdUtil.getJsApiTicketAccessToken();
			
			
			String nonceStr = ThirdUtil.getNonceStr(16);
			
			String timestamp = String.valueOf(new Date().getTime());
			
			String shaSignString = "jsapi_ticket="+jsApiTicketAccessToken.getToken()+"&noncestr="+nonceStr+"&timestamp="+timestamp+"&url="+shareURL;
			MessageDigest md =   MessageDigest.getInstance("SHA-1");  
			byte[] digest = md.digest(shaSignString.toString().getBytes());  
			String signature = byteToStr(digest); 
			
			LinkedHashMap<String, Object> map = new LinkedHashMap<String,Object>();
			map.put("appId", WeixinUtil.getAppID());
			map.put("timestamp", timestamp);
			map.put("nonceStr", nonceStr);
			map.put("signature", signature);
			response.setHeader("Access-Control-Allow-Origin", "*");
			WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
			
		} catch (Exception e) {
			e.printStackTrace();
			LinkedHashMap<String, Object> map = WeixinUtil.getResponseMap("Bool","500", "获取失败");
			WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
		}
	}	
	
	private static String byteToStr(byte[] byteArray) {  
        String strDigest = "";  
        for (int i = 0; i < byteArray.length; i++) {  
            strDigest += byteToHexStr(byteArray[i]);  
        }  
        return strDigest;  
    } 
	
	/** 
     * 将字节转换为十六进制字符串 
     *  
     * @param mByte 
     * @return 
     */  
    private static String byteToHexStr(byte mByte) {  
        char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };  
        char[] tempArr = new char[2];  
        tempArr[0] = Digit[(mByte >>> 4) & 0X0F];  
        tempArr[1] = Digit[mByte & 0X0F];  
  
        String s = new String(tempArr);  
        return s;  
    }  
}
