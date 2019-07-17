package com.weixin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.weixin.service.ICoreService;
import com.weixin.service.UserService;
import com.weixin.util.AbuttUtil;
import com.weixin.util.MD5Util;
import com.weixin.util.WeixinUtil;

/**
 * 同心微信用户相关类
 * @author luht
 *
 * Date 2016年1月28日
 */
@Controller
@RequestMapping("hst")
public class HSTController extends BaseController{
	
	@Autowired
	private UserService userService;
	@Autowired
	private ICoreService coreSerivce;
	
	private final String USER_CHECK_OPENID="user/checkAccountIsBind";
	private final String HST_USER_HSTBIND1="hst/user/hstBind1";
	
	/**
	 * @Description:  互生堂积分商城入口
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @Date          2016年3月3日 上午11:02:40
	 */
	@RequestMapping("goHSTGoodsList")
	public String goHSTGoodsList(HttpServletRequest request,HttpServletResponse response){
		logger.info("------------------goHSTGoodsList-------------");
		String jsp = "activity/hstIndex";
		
		String OpenID = userService.getOpenID(request, response);
		//String OpenID = request.getParameter("OpenID");
		logger.info("--------1.OpenID:"+OpenID);
		 
		if(OpenID!=null&&OpenID.length()>0){
			 logger.debug("OpenID is not empty. continue to check openid...");
			 JSONObject param = new JSONObject();
				param.put("OpenID",OpenID);
				param.put("TATID", 1);
				param.put("ApplicationID", 4);
				JSONObject resultObject=AbuttUtil.getResponseJSON(USER_CHECK_OPENID, param.toJSONString());
				
				logger.info("check openid result is ="+resultObject);
				if(resultObject.get("Status").equals("200")){//已经绑定过手机号
					
					JSONObject detail = resultObject.getJSONObject("DetailInfo");
					
					Integer UserID =  detail.getInteger("UserID");
					String TAAccessToken = "";
					
					//去验证，是否绑定护生堂
					//JSONObject param1 = new JSONObject();
					//param1.put("OpenID","pasm_"+UserID);
					//param1.put("TATID", 100);
					//param1.put("ApplicationID", 4);
					//JSONObject resultObject1=AbuttUtil.getResponseJSON(USER_CHECK_OPENID, param1.toJSONString());
					
					
					//if(resultObject1.get("Status").equals("200")){
						//如果护生堂和同心同时绑定
						//JSONObject detail1 = resultObject1.getJSONObject("DetailInfo");
						//TAAccessToken =  detail1.getString("TAAccessToken");
				//	}else{
						//只绑定了同心，自动去绑定护生堂
						JSONObject param2 = new JSONObject();
						param2.put("UserID",UserID);
						param2.put("ApplicationID", 4);
						param2.put("DeviceID", 5);
						
						param2.put("DeviceSN", "unknown");
						param2.put("OS", "unknown");
						param2.put("Osversion", "unknown");
						param2.put("Resolution", "unknown");
						
						
						JSONObject resultObject2=AbuttUtil.getResponseJSON(HST_USER_HSTBIND1, param2.toJSONString());
						if(resultObject2.get("Status").equals("200")){
							//如果绑定成功
							JSONObject detail2 = resultObject2.getJSONObject("DetailInfo");
							TAAccessToken =  detail2.getString("HSTAccessToken");
						}else{
							//如果绑定失败,提示绑定错误
						}
					//}
					
					//跳转到护生堂礼品兑换
					return "redirect:"+WeixinUtil.getProperties("ixinzangPageURL")+"hst/goodsList?ApplicationID=4&UserID="+UserID+"&AccessToken="+TAAccessToken+"&DeviceID=5";
				}else{
					request.setAttribute("IsBind", 0);
					request.setAttribute("OpenID", OpenID);
					//跳转到绑定界面
					return "redirect:/user/toBindAccountDirc?OpenID="+OpenID+"&ActionType=1";
				}
		 }
		
		return jsp;
	}
	
	/**
	 * @Description:  去请求护生汤全商场入口
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * @Date          2016年3月2日 下午5:54:21
	 */
	@RequestMapping("goHSTSHOP")
	public String goHSTSHOP(HttpServletRequest request,HttpServletResponse response){
		logger.info("------------------goHSTSHOP-------------");
		String jsp = "activity/hstIndex";
		
		String OpenID = userService.getOpenID(request, response);
		//String OpenID = request.getParameter("OpenID");
		logger.info("--------1.OpenID:"+OpenID);
		 
		if(OpenID!=null&&OpenID.length()>0){
			 logger.debug("OpenID is not empty. continue to check openid...");
			 JSONObject param = new JSONObject();
				param.put("OpenID",OpenID);
				param.put("TATID", 1);
				param.put("ApplicationID", 4);
				JSONObject resultObject=AbuttUtil.getResponseJSON(USER_CHECK_OPENID, param.toJSONString());
				
				logger.info("check openid result is ="+resultObject);
				if(resultObject.get("Status").equals("200")){//已经绑定过手机号
					
					JSONObject detail = resultObject.getJSONObject("DetailInfo");
					
					Integer UserID =  detail.getInteger("UserID");
					saveCookie("UserID",String.valueOf(UserID),response);//保存到cooki
					saveCookie("ApplicationID","4",response);
					String TAAccessToken = "";
					
					/*//去验证，是否绑定护生堂
					JSONObject param1 = new JSONObject();
					param1.put("OpenID","pasm_"+UserID);
					param1.put("TATID", 100);
					JSONObject resultObject1=AbuttUtil.getResponseJSON(USER_CHECK_OPENID, param1.toJSONString());
					
					
					if(resultObject1.get("Status").equals("200")){
						//如果护生堂和同心同时绑定
						JSONObject detail1 = resultObject1.getJSONObject("DetailInfo");
						//request.setAttribute("IsBind", 1);
						//request.setAttribute("UserID", detail.getInteger("UserID"));
						//request.setAttribute("TAAccessToken", detail.getString("TAAccessToken"));
						TAAccessToken =  detail1.getString("TAAccessToken");
					}else{
						//只绑定了同心，自动去绑定护生堂
						
					}*/
					JSONObject param2 = new JSONObject();
					param2.put("UserID",UserID);
					param2.put("ApplicationID", 4);
					param2.put("DeviceID", 5);
					
					param2.put("DeviceSN", "unknown");
					param2.put("OS", "unknown");
					param2.put("Osversion", "unknown");
					param2.put("Resolution", "unknown");
					
					
					JSONObject resultObject2=AbuttUtil.getResponseJSON(HST_USER_HSTBIND1, param2.toJSONString());
					if(resultObject2.get("Status").equals("200")){
						//如果绑定成功
						JSONObject detail2 = resultObject2.getJSONObject("DetailInfo");
						TAAccessToken =  detail2.getString("HSTAccessToken");
						saveCookie("access_token",TAAccessToken,response);
						
					}else{
						//如果绑定失败,提示绑定错误
					}
					
					//签名数据
					JSONObject resultJson=new JSONObject();
					JSONObject jsonBodyTmp=new JSONObject();
					jsonBodyTmp.put("client_type", "5");
					String method = "special_channel.auth.whole_check";
					String app_key= WeixinUtil.getProperties("hst_app_key_4");
					String access_token =TAAccessToken;
					String session_key = "";
					String format = "html";
					String version = "v1";
					String appSecret =WeixinUtil.getProperties("hst_app_secret_4") ;
					String timestamp = getNowDate();
					String signString = "access_token="+access_token+"&app_key="+app_key+"&format="+format+"&json_body="+jsonBodyTmp+"&method="+method+"&session_key="+session_key+"&timestamp="+timestamp+"&v="+version+"&app_secret="+appSecret;
					System.out.println(signString+"::未加密的字符串==");
					String sign=MD5Util.MD5(signString).toUpperCase();
					resultJson.put("sign", sign);
					resultJson.put("Status", "200");
					resultJson.put("access_token", access_token);
					resultJson.put("app_key", app_key);
					resultJson.put("timestamp", timestamp);
					request.setAttribute("hstPageURL", WeixinUtil.getProperties("hstPageURL"));
					request.setAttribute("resultJson", resultJson);
					request.setAttribute("json_body", jsonBodyTmp.toJSONString());
					return "hst/redirect";
				}else{
					request.setAttribute("IsBind", 0);
					request.setAttribute("OpenID", OpenID);
					//跳转到绑定界面
					return "redirect:/user/toBindAccountDirc?OpenID="+OpenID+"&ActionType=1";
				}
		 }
		
		return jsp;
	}
	
	/**
	 * @Description:互生堂调用  同心微信全商场重新绑定接口  
	 * @param:        @param refresh
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * @Date          2016年3月3日 上午11:01:19
	 */
	@RequestMapping("/hstRebind")
	public String hstRebind(String refresh,HttpServletRequest request,HttpServletResponse response){
		 logger.debug("进入微信全商场重新绑定/hstRebind...");
		String ApplicationID = getCookie("ApplicationID", request);
		JSONObject param=new JSONObject(); 
		param.put("UserID", getCookie("UserID", request));
		param.put("ApplicationID", ApplicationID);
		param.put("DeviceID","5");
		param.put("OS", "unknown");
		param.put("Osversion", "unknown");
		param.put("DeviceSN", "unknown");
		param.put("Resolution", "unknown");
		JSONObject resultObject=AbuttUtil.getResponseJSON("hst/weixin/user/hstRebind", param.toJSONString());
		String HSTAccessToken = (String)resultObject.getJSONObject("DetailInfo").get("HSTAccessToken");
		if("200".equals(resultObject.get("Status"))){
			saveCookie("access_token",HSTAccessToken,response);
		}
		request.setAttribute("hstPageURL", WeixinUtil.getProperties("hstPageURL"));
		String timestamp = getNowDate();
		request.setAttribute("timestamp", timestamp);
		
		if( !"whole_check".equals(refresh)){
			return "hst/error";
		}
		//进行数据签名
		JSONObject resultJson=new JSONObject();
		JSONObject jsonBodyTmp=new JSONObject();
		jsonBodyTmp.put("client_type", "5");
		String method = "special_channel.auth.whole_check";
		String app_key= WeixinUtil.getProperties("hst_app_key_"+ApplicationID);
		String access_token =HSTAccessToken;
		String session_key = "";
		String format = "html";
		String version = "v1";
		String appSecret =WeixinUtil.getProperties("hst_app_secret_"+ApplicationID) ;
		String signString = "access_token="+access_token+"&app_key="+app_key+"&format="+format+"&json_body="+jsonBodyTmp+"&method="+method+"&session_key="+session_key+"&timestamp="+timestamp+"&v="+version+"&app_secret="+appSecret;
		System.out.println(signString+"::未加密的字符串==");
		String sign=MD5Util.MD5(signString).toUpperCase();
		resultJson.put("sign", sign);
		resultJson.put("Status", "200");
		resultJson.put("access_token", access_token);
		resultJson.put("app_key", app_key);
		resultJson.put("timestamp", timestamp);
		request.setAttribute("resultJson", resultJson);
		request.setAttribute("json_body", jsonBodyTmp.toJSONString());
		return "hst/redirect";
	}
	
	
	/**
	 * @Description: 我的订单中心
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * @Date          2016年3月2日 下午5:54:21
	 */
	@RequestMapping("goMyOrderCenter")
	public String goMyOrderCenter(HttpServletRequest request,HttpServletResponse response){
		logger.info("------------------goMyOrderCenter-------------");
		String jsp = "hst/error";
		String OpenID = userService.getOpenID(request, response);
		logger.info("--------1.OpenID:"+OpenID);
		if(OpenID!=null&&OpenID.length()>0){
			 logger.debug("OpenID is not empty. continue to check openid...");
			 JSONObject param = new JSONObject();
			 param.put("OpenID",OpenID);
			 param.put("TATID", 1);
			 param.put("ApplicationID", 4);
			 JSONObject resultObject=AbuttUtil.getResponseJSON(USER_CHECK_OPENID, param.toJSONString());
			 logger.info("check openid result is ="+resultObject);
			if(resultObject.get("Status").equals("200")){//已经绑定过手机号
				JSONObject detail = resultObject.getJSONObject("DetailInfo");
				Integer UserID =  detail.getInteger("UserID");
				saveCookie("UserID",String.valueOf(UserID),response);//保存到cooki
				saveCookie("ApplicationID","4",response);
				String TAAccessToken = "";
				JSONObject param2 = new JSONObject();
				param2.put("UserID",UserID);
				param2.put("ApplicationID", 4);
				param2.put("DeviceID", 5);
				param2.put("DeviceSN", "unknown");
				param2.put("OS", "unknown");
				param2.put("Osversion", "unknown");
				param2.put("Resolution", "unknown");
				JSONObject resultObject2=AbuttUtil.getResponseJSON(HST_USER_HSTBIND1, param2.toJSONString());
			    if(resultObject2.get("Status").equals("200")){//获取互生堂AccessToken成功
					JSONObject detail2 = resultObject2.getJSONObject("DetailInfo");
					TAAccessToken =  detail2.getString("HSTAccessToken");
					saveCookie("access_token",TAAccessToken,response);
					//this-->跳转到ixiangzang项目---》到互生堂
					return "redirect:"+WeixinUtil.getProperties("ixinzangPageURL")+"hst/MyOrderCenter?ApplicationID=4&UserID="+UserID+"&AccessToken="+TAAccessToken+"&DeviceID=5";
				}else{//如果绑定失败,提示绑定错误
					jsp="hst/error";
				}
			}else{//跳转到绑定界面
				return "redirect:/user/toBindAccountDirc?OpenID="+OpenID+"&ActionType=1";
			}
		 }
		return jsp;
	}
}
