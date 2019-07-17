package com.weixin.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.weixin.service.UserService;
import com.weixin.util.AbuttUtil;
import com.weixin.util.CookieUtil;
import com.weixin.util.WeixinUtil;

/** 
 * @author :yanyonglin 
 * @version 创建时间：2015年12月9日 下午1:34:09 jj
 * 类说明 
 */
@Service
public class UserServiceImpl implements UserService {

	 private Logger logger = Logger.getLogger(UserServiceImpl.class);
	 
	 private final String USER_WX_LOGIN = "user/userLoginByWXAccount";
	 private final String USER_ISLOGIN = "user/isUserLogin";
	 
	@Override
	public JSONObject isLogin(String OpenID,HttpServletRequest request,
			HttpServletResponse response) {
		JSONObject jsonObject  = new JSONObject();
		
		int clientType = getClientType(request, response);
		if(clientType==4){
			//如果是PC端
			Object UserIDObj = request.getSession().getAttribute("UserID");
			Object TokenObj = request.getSession().getAttribute("LoginToken");
			
			if(UserIDObj!=null&&StringUtils.isNotBlank(UserIDObj.toString())&&TokenObj!=null&&StringUtils.isNotBlank(TokenObj.toString())){
				JSONObject param = new JSONObject();
				param.put("DeviceID", 4);
				param.put("ApplicationID", 14);
				param.put("UserID", UserIDObj);
				param.put("LoginToken", TokenObj);
				JSONObject isLogin = AbuttUtil.getResponseJSON(USER_ISLOGIN, param.toJSONString());
				jsonObject.put("ClientType", clientType);
				isLogin.put("LoginToken", TokenObj);
				jsonObject.put("DetailInfo", isLogin);
				//jsonObject = AbuttUtil.getResponseJSON(USER_ISLOGIN, param.toJSONString());
				jsonObject.put("Status",isLogin.getInteger("Status"));
				if(jsonObject.getInteger("Status")!=200){
					jsonObject.put("TargetPage", "jsp/mpage/login");
				}
				return jsonObject;
			}else{
				jsonObject = new JSONObject();
				jsonObject.put("TargetPage", "jsp/mpage/login");
				jsonObject.put("Status",-1);
				return jsonObject;
			}
		}
		
		if(OpenID==null||OpenID.trim().equals("")){
			jsonObject = new JSONObject();
			jsonObject.put("TargetPage", "jsp/bindAccount");
			jsonObject.put("Status",-1);
			jsonObject.put("ClientType", 5);
			return jsonObject;
		}else{
			JSONObject param = new JSONObject();
			param.put("DeviceID", 5);
			param.put("ApplicationID", 14);
			param.put("OpenID", OpenID);
			JSONObject isLogin = AbuttUtil.getResponseJSON(USER_WX_LOGIN, param.toJSONString());
			isLogin.put("ClientType", 5);
			isLogin.put("TargetPage", "jsp/bindAccount");
			return isLogin;
		}
		
		
	}

	@Override
	public String getOpenID(HttpServletRequest request,HttpServletResponse response) {
		String OpenID = "";
		String reqOpenID = request.getParameter("OpenID");//从request获取
		
		CookieUtil cu = new CookieUtil(request, response, -1);
		
		if(StringUtils.isBlank(reqOpenID)){
			OpenID = cu.getCookieValue("OpenID");
			if(StringUtils.isBlank(OpenID)){
				String code = request.getParameter("code");
				logger.info("--------------进入getOpenID code ="+code);
				if(StringUtils.isBlank(code)){
					OpenID=null;
				}else{
					OpenID = WeixinUtil.getOpenID(code);
					System.out.println("通过code:"+code+"从微信服务器获取OpenID:"+OpenID);
				}
			}else{
				System.out.println("从Cookie获取到OpenID:"+OpenID);
			}
		}else{
			System.out.println("从request中直接得到OpenID");
			OpenID = reqOpenID;
		}
		
		if(StringUtils.isNotBlank(OpenID)){
			cu.addCookie("OpenID", OpenID);
		}
		
		System.out.println("返回OpenID:"+OpenID);
		return OpenID;
	}
	
	
	public int getClientType(HttpServletRequest request,
			HttpServletResponse response){
		
		int curType = 0;
		
		String reqClientType = request.getParameter("ClientType");
		if(StringUtils.isNotBlank(reqClientType)){
			curType = Integer.parseInt(reqClientType);
			request.getSession().setAttribute("ClientType", curType);
			CookieUtil cu = new CookieUtil(request, response, -1);
			cu.addCookie("ClientType", curType+"");
		}else{
			Object typeSessionObj = request.getSession().getAttribute("ClientType");
			if(typeSessionObj!=null){
				curType = Integer.parseInt(typeSessionObj.toString());
			}else{
				CookieUtil cu = new CookieUtil(request, response, -1);
				String cClientType = cu.getCookieValue("ClientType");
				if(StringUtils.isNotBlank(cClientType)){
					curType = Integer.parseInt(cClientType.toString());
				}else{
					System.out.println("都没有取到");
				}
			}
		}
		System.out.println("当前的ClientType="+curType);
		return curType;
	}
	
	
	
	
}
