package com.weixin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.weixin.service.UserService;
import com.weixin.util.AbuttUtil;
import com.weixin.util.WeixinUtil;

/** 
 * @author :yanyonglin 
 * @version 创建时间：2017年11月21日 上午10:32:14 
 * 类说明 
 */
@Controller
@RequestMapping("/pasmPay")
public class PasmPayController extends BaseController{
	
	@Autowired
	private UserService userService;

	private Logger logger = Logger.getLogger(PasmPayController.class);
	
	@RequestMapping(value="/onlineVideoConsult")
	public String activity(HttpServletRequest request,HttpServletResponse response){
		logger.info("进入activity01......");
		String jsp = "activity/online_video_consult";
		try{
			String code=request.getParameter("code");
			//System.out.println("pasmPay....onlineVideoConsult...code:"+code);
			
			JSONObject userInfoJsonObject = WeixinUtil.getUserInfo(code);
			//request.setAttribute("code", code);
			
			
			if(userInfoJsonObject!=null){
				//OpenID = "oVmZMt2gJEdVzLMmPfMB_Rn4b0nM";
				JSONObject param = new JSONObject();
				param.put("OpenID", userInfoJsonObject.getString("OpenID"));
				param.put("Nickname", userInfoJsonObject.getString("Nickname"));
				param.put("Province", userInfoJsonObject.getString("Province"));
				param.put("City", userInfoJsonObject.getString("City"));
				//System.out.println("pasmPay....onlineVideoConsult...提交参数OpenID:"+userInfoJsonObject.getString("OpenID")+" Nickname:"+userInfoJsonObject.getString("Nickname"));
				//先写死域环境,等上线后,用正式地址
				//JSONObject resultObject=AbuttUtil.getResponseJSONForStation("http://api.r.ixinzang.com/","pay/getPASMPublicPlatformPayArguments", param.toJSONString());
				JSONObject resultObject = AbuttUtil.getResponseJSON("pay/getPASMPublicPlatformPayArguments", param.toJSONString());
				request.setAttribute("DetailInfo", resultObject.getJSONObject("DetailInfo"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
			logger.warn(e.getMessage());
		}
		return jsp;
	}
	@RequestMapping(value="/dynamicECGPay")
	public String dynamicECGPay(HttpServletRequest request,HttpServletResponse response){
		String jsp = "activity/ecg_monitoring_service";
		try{
			String code=request.getParameter("code");
			JSONObject userInfoJsonObject = WeixinUtil.getUserInfo(code);
			
			if(userInfoJsonObject!=null){
				JSONObject param = new JSONObject();
				param.put("OpenID", userInfoJsonObject.getString("OpenID"));
				param.put("Nickname", userInfoJsonObject.getString("Nickname"));
				param.put("OrderType", "2");
				param.put("Province", userInfoJsonObject.getString("Province"));
				param.put("City", userInfoJsonObject.getString("City"));
				param.put("Sex", userInfoJsonObject.getString("Sex"));
				
				JSONObject resultObject = AbuttUtil.getResponseJSON("pay/getPASMPublicPlatformPayArguments", param.toJSONString());
				request.setAttribute("DetailInfo", resultObject.getJSONObject("DetailInfo"));
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.warn(e.getMessage());
		}
		return jsp;
	}
	@RequestMapping(value="/getECGInfo")
	public String getECGInfo(HttpServletRequest request,HttpServletResponse response){
		String jsp = "activity/ecg_info";
		String AppID = WeixinUtil.getProperties("AppID");
		String WeiXinServerURL = WeixinUtil.getProperties("WeiXinServerURL");
		request.setAttribute("AppID", AppID);
		request.setAttribute("WeiXinServerURL", WeiXinServerURL);
		return jsp;
	}
	@RequestMapping("updateOrderPhone")
	public void updateOrderPhone(HttpServletRequest request,HttpServletResponse response){
		try{
			JSONObject param = new JSONObject();
			String OrderNumber = request.getParameter("OrderNumber");
			String MobilePhone = request.getParameter("MobilePhone");
			param.put("OrderNumber",OrderNumber);
			param.put("MobilePhone", MobilePhone);
			JSONObject resultObject = AbuttUtil.getResponseJSON("pay/updateOrderPhone", param.toJSONString());
			outJsonString(resultObject.toJSONString(), response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/updateOrderPhoneInit")
	public String updateOrderPhoneInit(HttpServletRequest request,HttpServletResponse response){
		String jsp = "activity/ecg_pay_success";
		String OrderNumber = request.getParameter("OrderNumber");
		request.setAttribute("OrderNumber", OrderNumber);
		return jsp;
	}
}
