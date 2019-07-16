package com.weixin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.weixin.service.UserService;
import com.weixin.util.AbuttUtil;
import com.weixin.util.WeixinUtil;

@Controller
@RequestMapping("/specialist")
public class SpecialistController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	//获取user
	private JSONObject getUserInfo(HttpServletRequest request,HttpServletResponse response){
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		
		JSONObject resultJsonObject = null;
		
		String OpenID = userService.getOpenID(request, response);
		if(OpenID!=null&&OpenID.length()>0){
			param.put("OpenID",OpenID);
			param.put("TATID", 1);
			JSONObject isBindObject=AbuttUtil.getResponseJSON("user/checkAccountIsBind", param.toJSONString());
			logger.info("check openid result is ="+isBindObject);
			if(isBindObject.get("Status").equals("200")){//已经绑定过手机号
				resultJsonObject = new JSONObject();
				String UserID =  isBindObject.getJSONObject("DetailInfo").getString("UserID");
//				String LoginToken = getLoginToken(UserID);
				String LoginToken = "";
				
				resultJsonObject.put("OpenID", OpenID);
				resultJsonObject.put("UserID", UserID);
				resultJsonObject.put("LoginToken", LoginToken);
				resultJsonObject.put("TrueName", isBindObject.getJSONObject("DetailInfo").getString("UserName"));
				resultJsonObject.put("MobilePhone", isBindObject.getJSONObject("DetailInfo").getString("MobilePhone"));
			}
		}else{
			response.setStatus(301);
			response.setHeader("Location", "attentionAccount");
		}
		return resultJsonObject;
	}
	
	//获取loginToken
	/*private String getLoginToken(String UserID){
		String LoginToken = "";
		JSONObject param = new JSONObject();
		param.put("UserID", UserID);
		param.put("ApplicationID", 4);
		param.put("IsFromWeb", 0);
		JSONObject resultObject=AbuttUtil.getResponseJSON("user/getLoginToken", param.toJSONString());
		if(resultObject.get("Status").equals("200")){
			LoginToken = resultObject.getJSONObject("DetailInfo").getString("LoginToken");
		}else{
			logger.info("LoginToken获取失败");
		}
		return LoginToken;
	}*/
	
	/**
	 * @Description: 专家列表
	 * @author       yuqinglin
	 * @Date         2018-06-11
	 */
	@RequestMapping("getSpecialist")
	public String getSpecialist(HttpServletRequest request,HttpServletResponse response){
		String jsp = "common/error";
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		JSONObject resultObject=AbuttUtil.getResponseJSON("doctor/gePasmDoctorList", param.toJSONString());
		/*request.setAttribute("UserID", "408867");
		getLoginToken("408867");*/
		JSONObject userInfoJsonObject = getUserInfo(request,response);
		if(userInfoJsonObject!=null){
			request.setAttribute("UserID", userInfoJsonObject.getString("UserID"));
		}
		if(resultObject.get("Status").equals("200")){
			request.setAttribute("specialist", resultObject.getJSONArray("ListInfo"));
			jsp = "specialist/specialist_list";
		}
		return jsp;
	}
	
	/**
	 * @Description: 专家预约排期
	 * @author       yuqinglin
	 * @Date         2018-06-11
	 */
	@RequestMapping("getSpecialistTime")
	public String getSpecialistTime(HttpServletRequest request,HttpServletResponse response){

		String jsp = "common/error";
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("DoctorID", request.getParameter("doctor_id"));
		JSONObject resultObject=AbuttUtil.getResponseJSON("doctor/gePasmDoctorDetail", param.toJSONString());
		JSONObject ScheduleList=AbuttUtil.getResponseJSON("order/getPasmDoctorScheduleList", param.toJSONString());
		if(resultObject.get("Status").equals("200")){
			request.setAttribute("SpecialistDetail", resultObject.getJSONObject("DetailInfo"));
			request.setAttribute("ScheduleList", ScheduleList.getJSONArray("ListInfo"));
			jsp = "specialist/specialist_time";
		}
		return jsp;
	}
	
	/**
	 * @Description: 提交预约，生成订单
	 * @author       yuqinglin
	 * @Date         2018-06-11
	 */
	@RequestMapping("/ajax/submitAppointment")
	public void ajaxSubmitAppointment(HttpServletRequest request,HttpServletResponse response){
		try{
			JSONObject param = new JSONObject();
			param.put("DeviceID", 5);
			param.put("ApplicationID", 4);
			param.put("HospitalID", request.getParameter("HospitalID"));
			param.put("DepartmentID", request.getParameter("DepartmentID"));
			param.put("TransferHospitalTime", request.getParameter("TransferHospitalTime"));
			param.put("Price", request.getParameter("Price"));
			param.put("ScheduleID", request.getParameter("ScheduleID"));
			param.put("OrderType", 1);
			param.put("OrderSource", 3);
			
			JSONObject userInfoJsonObject = getUserInfo(request,response);
			if(userInfoJsonObject != null){
				param.put("LoginToken", userInfoJsonObject.getString("LoginToken"));
				param.put("UserID", userInfoJsonObject.getString("UserID"));
				param.put("TrueName", userInfoJsonObject.getString("TrueName"));
				param.put("Phone", userInfoJsonObject.getString("MobilePhone"));
			}
			JSONObject resultObject=AbuttUtil.getResponseJSON("order/createPasmOrder", param.toJSONString());
			outJsonString(resultObject.toJSONString(), response);
			System.out.println("--------------"+resultObject.toJSONString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @Description: 视频问诊，支付页面
	 * @author       yuqinglin
	 * @Date         2018-06-19
	 */
	@RequestMapping("orderCheckout")
	public String orderCheckout(HttpServletRequest request,HttpServletResponse response){
		String jsp = "common/error";
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("OrderID", request.getParameter("order_id"));
		JSONObject resultObject=AbuttUtil.getResponseJSON("order/getPasmOrderDetail", param.toJSONString());
		if(resultObject.get("Status").equals("200")){
			request.setAttribute("OrderDetail", resultObject.getJSONObject("DetailInfo"));
			jsp = "specialist/order_checkout";
		}
		return jsp;
	}
	
	/**
	 * @Description: 微信支付
	 * @author       yuqinglin
	 * @Date         2018-06-19
	 */
	@RequestMapping("/ajax/specialistAppointmentPay")
	public void ajaxSpecialistAppointmentPay(HttpServletRequest request,HttpServletResponse response){
		try{
			String OpenID = userService.getOpenID(request, response);
			String pasm = request.getParameter("pasm");
			JSONObject param = JSONObject.parseObject(pasm);
			param.put("DeviceID", 5);
			param.put("ApplicationID", 4);
			param.put("ProductName", 1);
			param.put("OpenID", OpenID);
			param.put("PayType", "JSAPI");
			
			JSONObject userInfoJsonObject = getUserInfo(request,response);
			if(userInfoJsonObject!=null){
				param.put("UserID", userInfoJsonObject.getString("UserID"));
				param.put("LoginToken", userInfoJsonObject.getString("LoginToken"));
			}
			JSONObject resultObject=AbuttUtil.getResponseJSON("pay/getPASMWeiXinPayArguments", param.toJSONString());
			outJsonString(resultObject.toJSONString(), response);
			System.out.println("--------------"+resultObject.toJSONString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * @Description: 预约成功页面
	 * @author       yuqinglin
	 * @Date         2018-06-19
	 */
	@RequestMapping("orderSuccess")
	public String orderSuccess(HttpServletRequest request,HttpServletResponse response){
		JSONObject userInfoJsonObject = getUserInfo(request,response);
		if(userInfoJsonObject!=null){
			request.setAttribute("MobilePhone", userInfoJsonObject.getString("MobilePhone"));
		}
		
		return "specialist/order_success";
	}
	
	/**
	 * @Description: 关注公众号页面
	 * @author       yuqinglin
	 * @Date         2018-06-22
	 */
	@RequestMapping("attentionAccount")
	public String attentionAccount(HttpServletRequest request,HttpServletResponse response){
		
		return "specialist/attention_account";
	}
}
