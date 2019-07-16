package com.weixin.controller;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.weixin.service.ICoreService;
import com.weixin.service.UserService;
import com.weixin.util.AbuttUtil;
import com.weixin.util.MD5Util;
import com.weixin.util.RedisHelper;
import com.weixin.util.WeixinUtil;

/**
 * 同心微信用户相关类
 * @author luht
 *
 * Date 2016年1月28日
 */
@Controller
@RequestMapping("user")
public class UserController extends BaseController{
	private final String BIND_MOBILEPHONE="thirdparty/bindAccount";
	private final String REGISTER_BIND_ACCOUNT="thirdparty/registerBindAccount";
	private final String GET_PSSMUSERINFO="user/getweixinUserInfo";
	private final String UPDATE_USERPROFILE="user/modifiedUserProfile";
	private final String USER_CHECK_OPENID="user/checkAccountIsBind";
	private final String USER_SEND_Bind_CAPTCHA="user/sendBindCAPTCHA";
	private final String USER_CHECK_EXIST = "user/checkMobilePhoneIsAvailable";
	private final String USER_SEND_REGISTER_CAPTCHA="user/sendRegisterCaptcha";
	private final String UPDATE_MOBILEpHONE="user/updateMobilePhone";
	
	@Autowired
	private UserService userService;
	@Autowired
	private ICoreService coreSerivce;
	
	/**
	 * @Description:更换绑定绑定账户跳转页面
	 *   ActionType=1 绑定账户  ActionType==2 更换绑定账户
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * @Date          2016年1月28日 上午9:59:46
	 */
	@RequestMapping(value="toBindAccountDirc")
	public String toBindAccountDirc(HttpServletRequest request,HttpServletResponse response){
		String jsp="";
		String OpenID=(String)request.getParameter("OpenID");
		if(StringUtils.isNotBlank(OpenID)){
			String link=request.getParameter("link");
			request.setAttribute("OpenID",OpenID);
	        	request.setAttribute("ActionType",1);
	        	 JSONObject param = new JSONObject();
					param.put("OpenID",OpenID);
					param.put("TATID", 1);
					param.put("ApplicationID", 4);
					JSONObject resultObject=AbuttUtil.getResponseJSON(USER_CHECK_OPENID, param.toJSONString());
					logger.info("check openid result is ="+resultObject);
					if(resultObject.get("Status").equals("200")){//已经绑定过手机号
						request.setAttribute("ActionType",2);//跳转到去绑定页面使用
						logger.debug("----status = 200. that means bind complete------");
						request.setAttribute("MobilePhone", resultObject.getJSONObject("DetailInfo").getString("MobilePhone"));
						return  "user/bindComplete";
					}
	        	
			request.setAttribute("link", link);
			jsp="user/bindAccount";
		}else{
			logger.warn("OpenID为空");
			 jsp="hst/error";
		}
		return  jsp;
	}
	
	/**
	 * @Description:  绑定账户页面初始化如果绑定过跳转到绑定详情页面
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * @Date          2016年1月28日 下午6:56:31
	 */
	@RequestMapping(value="toBindAccount")
	public String toBindAccount(HttpServletRequest request,HttpServletResponse response){
		String link=request.getParameter("link");
		request.setAttribute("link", link);
		String jsp = "user/bindAccount";//用户绑定界面
		request.setAttribute("ActionType",1);//跳转到去绑定页面使用
		logger.info("--------进入toBindAccount-------------");
		try{
			String s=request.getParameter("code");
			logger.info("------------------1.code:"+s);
			
			logger.info("--------调用getOpenID方法前-------------");
			String OpenID = userService.getOpenID(request, response);
			logger.info("--------------2 调用getopenid方法之后    get  openid from userService.getOpenID, OpenID="+OpenID+"------------------");
			
			request.setAttribute("OpenID", OpenID);
			request.setAttribute("code", request.getParameter("code"));
			
			if(OpenID!=null&&OpenID.length()>0){
				 logger.debug("OpenID is not empty. continue to check openid...");
				 JSONObject param = new JSONObject();
					param.put("OpenID",OpenID);
					param.put("TATID", 1);
					param.put("ApplicationID", 4);
					JSONObject resultObject=AbuttUtil.getResponseJSON(USER_CHECK_OPENID, param.toJSONString());
					logger.info("check openid result is ="+resultObject);
					if(resultObject.get("Status").equals("200")){//已经绑定过手机号
						logger.debug("----status = 200. that means bind complete------");
						request.setAttribute("MobilePhone", resultObject.getJSONObject("DetailInfo").getString("MobilePhone"));
						jsp = "user/bindComplete";
					}
			 }else{
				 logger.error("OpenID为空");
				 jsp="hst/error";
			 }
		}catch(Exception e){
			e.printStackTrace();
		}
		return jsp;
	}
	
	
	/**
	 * @Description:同心微信绑定手机号
	 * @param:        @param request
	 * @param:        @param response  
	 * @author        luht
	 * @Date          2016年1月27日 下午7:05:23
	 */
	@RequestMapping("bindWeChatAccount")
	public void bindRegisterUser(HttpServletRequest request,HttpServletResponse response){
		try{
			String OpenID = request.getParameter("OpenID");
			if(StringUtils.isNotBlank(OpenID)){
				JSONObject param = new JSONObject();
				String LoginID = request.getParameter("LoginID");
				String captcha = request.getParameter("Captcha");
				param.put("ThirdPartyAccount",OpenID);
				param.put("DeviceID", 5);
				param.put("ApplicationID", 4);
				param.put("LoginID", LoginID);
				param.put("CAPTCHA", captcha);
				JSONObject resultObject = AbuttUtil.getResponseJSON(BIND_MOBILEPHONE, param.toJSONString());
				outJsonString(resultObject.toJSONString(), response);
				System.out.println("--------------"+resultObject.toJSONString());
			}else{
				JSONObject resultObject=new JSONObject();
				resultObject.put("Status", -1);
				outJsonString(resultObject.toJSONString(), response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @Description:  跳转注册页初始化
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * @Date          2016年1月29日 上午10:48:06
	 */
	@RequestMapping(value="toRegister")
	public String toRegister(HttpServletRequest request,HttpServletResponse response){
		String jsp="";
		String OpenID = userService.getOpenID(request, response);
		if(StringUtils.isNotBlank(OpenID)){
			String link = request.getParameter("link");
			request.setAttribute("OpenID",OpenID);
			request.setAttribute("link",link);
		    jsp = "user/registerAccount2";
		}else{
			 logger.error("OpenID为空");
			 jsp="hst/error";
		 }
		return jsp;
	}
	
	/**
	 * @Description:同心微信注册用户
	 * @param:        @param request
	 * @param:        @param response  
	 * @author        luht
	 * @Date          2016年1月28日 上午11:02:19
	 */
	@RequestMapping("register")
	public void toRegisterAccount(HttpServletRequest request,HttpServletResponse response){
		try{
			String OpenID = userService.getOpenID(request, response);
			if(StringUtils.isNotBlank(OpenID)){
				JSONObject param = new JSONObject();
				String LoginID = request.getParameter("LoginID");
				String captcha = request.getParameter("Captcha");
				String Password = request.getParameter("Password");
				param.put("ThirdPartyAccount",OpenID);
				param.put("DeviceID", 5);
				param.put("ApplicationID", 4);
				param.put("LoginID", LoginID);
				param.put("CAPTCHA", captcha);
				param.put("Password",Password);
				JSONObject resultObject = AbuttUtil.getResponseJSON(REGISTER_BIND_ACCOUNT, param.toJSONString());
				outJsonString(resultObject.toJSONString(), response);
				System.out.println("--------------"+resultObject.toJSONString());
			}else{
				JSONObject resultObject=new JSONObject();
				resultObject.put("Status", -1);
				outJsonString(resultObject.toJSONString(), response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @Description:同心微信注册用户:注册时添加用户信息
	 * @param:        @param request
	 * @param:        @param response  
	 * @author        yuqinglin
	 * @Date          2016年1月28日 上午11:02:19
	 */
	@RequestMapping("register2")
	public void toRegisterAccount2(HttpServletRequest request,HttpServletResponse response){
		try{
			String OpenID = userService.getOpenID(request, response);
			if(StringUtils.isNotBlank(OpenID)){
				String regObj = request.getParameter("regObj");
				JSONObject param = JSONObject.parseObject(regObj);
				
				param.put("ThirdPartyAccount",OpenID);
				param.put("DeviceID", 5);
				param.put("ApplicationID", 4);
				
				JSONObject resultObject = AbuttUtil.getResponseJSON("user/pasmWeixinRegister", param.toJSONString());
				outJsonString(resultObject.toJSONString(), response);
				System.out.println("--------------"+resultObject.toJSONString());
			}else{
				JSONObject resultObject=new JSONObject();
				resultObject.put("Status", -1);
				outJsonString(resultObject.toJSONString(), response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @Description:  获取用户信息
	 * @param:        @param request
	 * @param:        @param response  
	 * @author        luht
	 * @Date          2016年1月28日 下午4:30:37
	 */
	@RequestMapping("modifieduserinfoinit")
	public String  getpasmUserInfo(HttpServletRequest request,HttpServletResponse response){
		String jsp="";
		try{
			String OpenID = userService.getOpenID(request, response);
			if(StringUtils.isNotBlank(OpenID)){
				String userId = coreSerivce.checkAccountIsBind(OpenID);
				JSONObject param = new JSONObject();
				param.put("UserID", userId);
				param.put("DeviceID", 5);
				param.put("ApplicationID", 4);
				request.setAttribute("UserID", userId);
				request.setAttribute("OpenID",OpenID);
				JSONObject resultObject = AbuttUtil.getResponseJSON(GET_PSSMUSERINFO, param.toJSONString());
				Map<String,Object> DetailInfo=resultObject.getJSONObject("DetailInfo");
				request.setAttribute("DetailInfo", DetailInfo);
				jsp="user/modified_userinfo";
			}else{
				jsp="hst/error";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return jsp;
	}
	
	/**
	 * @Description:完善用户资料
	 * @param:        @param request
	 * @param:        @param response  
	 * @author        luht
	 * @Date          2016年1月28日 下午4:32:08
	 */
	@RequestMapping("modifiedUserInfo")
	public void modifiedUserInfo(HttpServletRequest request,HttpServletResponse response){
		try{
			 Pattern emoji = Pattern . compile ("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]" ,Pattern . UNICODE_CASE | Pattern . CASE_INSENSITIVE ) ;
			 //验证输入内容是否含有表情
			  String TrueName= request.getParameter("TrueName");
			  Matcher emojiMatcher = emoji . matcher ( TrueName ) ;
			   if ( emojiMatcher . find ( ) ) {
                  WeixinUtil.responseErrorJson("100", "姓名不能含有表情", response);
                  return;

			   }
			   String Street= request.getParameter("Street");
				  Matcher emojiMatcherStreet = emoji . matcher ( Street ) ;
				   if ( emojiMatcherStreet . find ( ) ) {
	                  WeixinUtil.responseErrorJson("100", "地址不能含有表情", response);
	                  return;
			   }

			String userId = request.getParameter("UserID");
				JSONObject param = new JSONObject();
				param.put("UserID", userId);
				param.put("DeviceID", 5);
				param.put("ApplicationID", 4);
				param.put("TrueName",  request.getParameter("TrueName"));
				param.put("Instrument", request.getParameter("Instrument"));
				param.put("SurgicalTime", request.getParameter("SurgicalTime"));
				param.put("AreaID", request.getParameter("AreaID"));
				param.put("Address", request.getParameter("Address"));
				param.put("ZipCode", request.getParameter("ZipCode"));
				param.put("Phone", request.getParameter("Phone"));
				param.put("Street", request.getParameter("Street"));
				
				JSONObject resultObject = AbuttUtil.getResponseJSON(UPDATE_USERPROFILE, param.toJSONString());
				outJsonString(resultObject.toJSONString(), response);
				System.out.println("--------------"+resultObject.toJSONString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @Description: 发送绑定注册验证码 
	 * @param:        @param request
	 * @param:        @param response  
	 * @return:        获取验证码
	 * @author        luht
	 * @Date          2016年1月29日 上午9:24:40
	 */
	@RequestMapping(value="sendBindCAPTCHA")
	public void sendBindCAPTCHA(HttpServletRequest request,HttpServletResponse response){
		System.out.println("进入sendBindCAPTCHA............");
		try{
			int clientType = userService.getClientType(request, response);
			String LoginID = request.getParameter("LoginID");
			System.out.println("LoginID:"+LoginID);
			JSONObject param = new JSONObject();
			if(clientType==4){
				param.put("DeviceID",4);
			}else{
				param.put("DeviceID", 5);
			}
			
			param.put("ApplicationID", 4);
			param.put("LoginID", LoginID);
			
			String VerificationCode = request.getParameter("VerificationCode");
			param.put("VerificationCode", VerificationCode);
			
			//redis中查询此手机号一分钟内是否发过 qinyitao 2017-2-23
//			String redis_key="pasm_bind_weixin_CAPTCHA_"+LoginID;
//			String sec=RedisHelper.getValue(redis_key);
//			if(StringUtils.isNotBlank(sec)){
//				outJsonString(spliceJson(400, "-"), response);
//				return;
//			}
			
			JSONObject resultObject=AbuttUtil.getResponseJSON(USER_SEND_Bind_CAPTCHA, param.toJSONString());
//			if(resultObject.getIntValue("Status") == 200){
//				RedisHelper.setValue(redis_key, (new Date().getTime()/1000L)+"");
//				RedisHelper.expire(redis_key, 60);
//			}
			
			outJsonString(resultObject.toJSONString(), response);
			
		}catch(Exception e){e.printStackTrace();}
		
		
	}
	
	/**
	 * @Description:  验证手机号是否可用
	 * @param:        @param request
	 * @param:        @param response  
	 * @author        luht
	 * @Date          2016年1月29日 上午9:52:36
	 */
	@RequestMapping(value="checkMobilePhoneIsAvailable")
	public void checkMobilePhoneIsAvailable(HttpServletRequest request,HttpServletResponse response){
		
		String LoginID = request.getParameter("LoginID");
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("LoginID", LoginID);
		
		
		JSONObject resultObject=AbuttUtil.getResponseJSON(USER_CHECK_EXIST, param.toJSONString());
		outJsonString(resultObject.toJSONString(), response);
	}
	
	/**
	 * @Description: 发送注册验证吗 
	 * @param:        @param request
	 * @param:        @param response  
	 * @author        luht
	 * @Date          2016年1月29日 上午11:09:52
	 */
	@RequestMapping(value="sendRegisterCaptcha")
	public void sendRegisterCaptcha(HttpServletRequest request,HttpServletResponse response){
		
		String LoginID = request.getParameter("LoginID");
		JSONObject param = new JSONObject();
			param.put("DeviceID",5);
		param.put("ApplicationID", 4);
		param.put("LoginID", LoginID);
		param.put("Signature",MD5Util.MD5(LoginID+WeixinUtil.getProperties("Signature")));
		
		String VerificationCode = request.getParameter("VerificationCode");
		param.put("VerificationCode", VerificationCode);
		
		//redis中查询此手机号一分钟内是否发过2017-2-23 qinyitao
//		String redis_key="pasm_register_weixin_CAPTCHA_"+LoginID;
//		String sec=RedisHelper.getValue(redis_key);
//		if(StringUtils.isNotBlank(sec)){
//			outJsonString(spliceJson(400, "-"), response);
//			return;
//		}
		
		JSONObject resultObject=AbuttUtil.getResponseJSON(USER_SEND_REGISTER_CAPTCHA, param.toJSONString());
		if(resultObject.getIntValue("Status") == 200){
//			RedisHelper.setValue(redis_key, (new Date().getTime()/1000L)+"");
//			RedisHelper.expire(redis_key, 60);
		}
		
		outJsonString(resultObject.toJSONString(), response);
	}
	
	
	
	/**
	 * @Description: 修改手机号初始化 
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * @Date          2016年2月24日 上午8:50:04
	 */
	@RequestMapping(value="toModifiedBindAccount")
	public String toModifiedBindAccount(HttpServletRequest request,HttpServletResponse response){
		String jsp="";
		String OpenID=(String)request.getParameter("OpenID");
		if(StringUtils.isNotBlank(OpenID)){
			request.setAttribute("OpenID",OpenID);
			jsp="user/modifiedAccount";
		}else{
			 logger.error("OpenID为空");
			 jsp="hst/error";
		}
		return jsp;
	}
	
	
	
	/**
	 * @Description: 修改账户
	 * @param:        @param request
	 * @param:        @param response  
	 * @author        luht
	 * @Date          2016年2月24日 上午8:51:09
	 */
	@RequestMapping("modifiedAccount")
	public void Modified(HttpServletRequest request,HttpServletResponse response){
		try{
			String OpenID = request.getParameter("OpenID");
			if(StringUtils.isNotBlank(OpenID)){
				JSONObject param = new JSONObject();
				String LoginID = request.getParameter("LoginID");
				String captcha = request.getParameter("Captcha");
				param.put("OpenID",OpenID);
				param.put("LoginID", LoginID);
				param.put("CAPTCHA", captcha);
				JSONObject resultObject = AbuttUtil.getResponseJSON(UPDATE_MOBILEpHONE, param.toJSONString());
				outJsonString(resultObject.toJSONString(), response);
				System.out.println("--------------"+resultObject.toJSONString());
			}else{
				JSONObject resultObject=new JSONObject();
				resultObject.put("Status", -1);
				outJsonString(resultObject.toJSONString(), response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @Description: 我的优惠券列表
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * @Date          2016年4月1日 下午5:14:55
	 */
	@RequestMapping("MYCouponsList")
	public String MYCouponsList(HttpServletRequest request,HttpServletResponse response){
		logger.info("------------------MYCouponsList-------------");
		String jsp = "common/error";
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
				//跳转到我的优惠券列表
				System.out.println(WeixinUtil.getProperties("ixinzangPageURL"));
				return "redirect:"+WeixinUtil.getProperties("ixinzangPageURL")+"coupon/CouponListInit?ApplicationID=4&UserID="+UserID+"&DeviceID=5";
			}else{//跳转到绑定界面
				return "redirect:/user/toBindAccountDirc?OpenID="+OpenID+"&ActionType=1";
			}
		 }
		return jsp;
	}
}
