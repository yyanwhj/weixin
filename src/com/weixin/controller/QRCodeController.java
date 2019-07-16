package com.weixin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.weixin.entity.AccessToken;
import com.weixin.entity.Ticket;
import com.weixin.util.AbuttUtil;
import com.weixin.util.WeixinUtil;

/**
 * 二维码相关
 * @author luht
 *
 * Date 2016年4月8日
 */
@Controller
@RequestMapping("QR")
public class QRCodeController extends BaseController{
	private final String GET_DOCTOR_PROFILE = "doctor/getDoctorProfile";
	private final String GETINSTITUTION_DETAIL = "institution/getInstitutionByID";
	private final String GET_WEINXIN_MAPPING_INFO="thirdparty/getweixinMappingInfo";
	private final String ADD_WEIXIN_MAPPING_INFO="thirdparty/addWeixinMappingInfo";
	
	
	/**
	 * @Description: 生成带参数二维码
	 * @param:        @param request
	 * @param:        @param response  
	 * @return:        
	 * @author        luht
	 * @Date          2016年4月8日 下午2:34:18
	 * http://127.0.0.1:8888/pasm_weixin_1/QR/getTicketInfo?SourceType=1&SourceID=18
	 */
	@RequestMapping("getTicketInfo")
	public void getTicketInfo(HttpServletRequest request,HttpServletResponse response){
		logger.info("------------------getTicketInfo-------------");
		String responseMsg ="";
		boolean flag = false;
		String channelType = request.getParameter("SourceType");
		String channelID = request.getParameter("SourceID");
		
		if(StringUtils.isNotBlank(channelType)&&StringUtils.isNotBlank(channelID)){
				if(channelType.equals("1")){//生成医生相关二维码
					JSONObject doctorJsonObject = getDoctorInfo(channelID);//查询医生相关信息
					if(doctorJsonObject!=null&&doctorJsonObject.getJSONObject("DetailInfo")!=null){
						JSONObject detailInfo = getWeixinMappingInfo(channelType, channelID);//查询映射关系 
						if(detailInfo!=null){//映射信息存在
							responseMsg = String.valueOf(detailInfo.get("SceneID"));
							flag = true;
						}else{//映射信息不存在
							 String SceneID = addWeixinMapping(channelType, channelID);//记录映射关系
							 if(!"-1".equals(SceneID)){
								 responseMsg = String.valueOf(SceneID);
								 flag = true;
							 }else{
								 responseMsg ="记录映射信息失败";
							 }
						}
					}else{
						responseMsg = "没有获取到医生信息或DoctorCode";
					}
				}else if(channelType.equals("2")){//生成医院相关二维码
					//获取医院或科室相关信息
					JSONObject doctorJsonObject = getInstudenetInfo(channelID);
					if(doctorJsonObject!=null&&doctorJsonObject.getJSONObject("DetailInfo")!=null){
						JSONObject detailInfo = getWeixinMappingInfo(channelType, channelID);//查询映射关系 
						if(detailInfo!=null){//映射信息存在
							responseMsg = (String)detailInfo.get("SceneID");
							flag = true;
						}else{//映射信息不存在
							 String SceneID = addWeixinMapping(channelType, channelID);//记录映射关系
							 if(!"-1".equals(SceneID)){
								 responseMsg = String.valueOf(SceneID);
								 flag = true;
							 }else{
								 responseMsg ="记录映射信息失败";
							 }
						}
					}else{
						responseMsg = "没有获取到机构信息或InstitutionCode";
					}
				}else{
					responseMsg = "不支持的类型";
				}
		}else{
			responseMsg = "参数不完整";
		}
		
		if(flag){
			AccessToken accessToken =  WeixinUtil.getAccessToken();
    		if(accessToken!=null&&StringUtils.isNotBlank(accessToken.getToken())){
				String QR_URL = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token="+accessToken.getToken();
				Ticket ticket = new Ticket("QR_LIMIT_STR_SCENE", responseMsg);
				JSONObject jsonObject =  WeixinUtil.httpRequest(QR_URL, "POST", JSONObject.toJSONString(ticket));
				
				if(jsonObject!=null){
					responseMsg =  jsonObject.toJSONString();
				}else{
					responseMsg =  "二维码ticket没有获取到";
				}
			}else{
				responseMsg =  "access_token没有获取到";
			}
		}
		PrintWriter out = null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(responseMsg);  
		out.close();
		out = null;

		
	}
	/**
	 * @Description:  生成带参数二维码图片
	 * @param:        @param request
	 * @param:        @param response
	 * @param:        @return  
	 * @author        luht
	 * http://127.0.0.1:8888/pasm_weixin_1/QR/getTicketInfo?SourceType=1&SourceID=-1
	 * @Date          2016年4月12日 下午12:55:31
	 */
	@RequestMapping("getQRPictureInfo")
	public String getQRPictureInfo(HttpServletRequest request,HttpServletResponse response){
		logger.info("------------------getQRPictureInfo-------------");
		
		String responseMsg ="";
		boolean flag = false;
		
		String channelType = request.getParameter("SourceType");
		String channelID = request.getParameter("SourceID");
		if(StringUtils.isNotBlank(channelType)&&StringUtils.isNotBlank(channelID)){
				if(channelType.equals("1")){//生成医生相关二维码
					//查询医生相关信息
					JSONObject doctorJsonObject = getDoctorInfo(channelID);
					if(doctorJsonObject!=null&&doctorJsonObject.getJSONObject("DetailInfo")!=null){
							JSONObject detailInfo = getWeixinMappingInfo(channelType, channelID);//查询映射关系 
							if(detailInfo!=null){//映射信息存在
								responseMsg = String.valueOf(detailInfo.get("SceneID"));
								flag = true;
							}else{//映射信息不存在
								 String SceneID = addWeixinMapping(channelType, channelID);//记录映射关系
								 if(!"-1".equals(SceneID)){
									 responseMsg = String.valueOf(SceneID);
									 flag = true;
								 }else{
									 responseMsg ="记录映射信息失败";
								 }
							}
					}else{
						    responseMsg = "没有获取到医生信息或DoctorCode";
					}
				}else if(channelType.equals("2")){//生成医院相关二维码
						//获取医院或科室相关信息
						JSONObject doctorJsonObject = getInstudenetInfo(channelID);
						if(doctorJsonObject!=null&&doctorJsonObject.getJSONObject("DetailInfo")!=null){
							//查询映射关系 
							JSONObject detailInfo = getWeixinMappingInfo(channelType, channelID);
							if(detailInfo!=null){//映射信息存在
								responseMsg = (String)detailInfo.get("SceneID");
								flag = true;
							}else{//映射信息不存在
								 String SceneID = addWeixinMapping(channelType, channelID);//记录映射关系
								 if(!"-1".equals(SceneID)){
									 responseMsg = String.valueOf(SceneID);
									 flag = true;
								 }else{
									 responseMsg ="记录映射信息失败";
								 }
							}
						}else{
							responseMsg = "没有获取到机构信息或InstitutionCode";
						}
				}else{
					responseMsg = "不支持的类型";
				}
		}else{
			responseMsg = "参数不完整";
		}
		
		if(flag){
			AccessToken accessToken =  WeixinUtil.getAccessToken();
    		if(accessToken!=null&&StringUtils.isNotBlank(accessToken.getToken())){
				String QR_URL = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token="+accessToken.getToken();
				Ticket ticket = new Ticket("QR_LIMIT_STR_SCENE", responseMsg);
				JSONObject jsonObject =  WeixinUtil.httpRequest(QR_URL, "POST", JSONObject.toJSONString(ticket));
				 
				if(jsonObject!=null){
					responseMsg =  jsonObject.toJSONString();
					return "redirect:https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+jsonObject.getString("ticket");
				}else{
					responseMsg =  "二维码ticket没有获取到";
				}
			}else{
				responseMsg =  "access_token没有获取到";
			}
		}
		PrintWriter out = null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(responseMsg);  
		out.close();
		out = null;

		return null;
	}

	private JSONObject getInstudenetInfo(String channelID) {
		JSONObject params = new JSONObject();
		params.put("InstitutionID",channelID);
		params.put("ApplicationID", 4);
		JSONObject doctorJsonObject = AbuttUtil.getResponseJSON(GETINSTITUTION_DETAIL, params.toJSONString());
		return doctorJsonObject;
	}

	private JSONObject getDoctorInfo(String channelID) {
		JSONObject params = new JSONObject();
		params.put("DoctorID",channelID);
		params.put("ApplicationID", 4);
		JSONObject doctorJsonObject = AbuttUtil.getResponseJSON(GET_DOCTOR_PROFILE, params.toJSONString());
		return doctorJsonObject;
	}
	
	private JSONObject getWeixinMappingInfo(String channelType, String channelID) {
		JSONObject parammapping = new JSONObject();
		 parammapping.put("SourceType", channelType);
		 parammapping.put("SourceID", channelID);
		 parammapping.put("ApplicationID", 4);
		 JSONObject MapingInfo= AbuttUtil.getResponseJSON(GET_WEINXIN_MAPPING_INFO, parammapping.toJSONString());
		 String Status  =(String) MapingInfo.get("Status");
		 JSONObject detailInfo=null;
		 if("200".equals(Status)){
			 detailInfo= MapingInfo.getJSONObject("DetailInfo");
		 }
		 return detailInfo;
	}
	
	@SuppressWarnings("unused")
	private String addWeixinMapping(String channelType, String channelID) {
		String resultValue="-1";
		JSONObject addMappingParam = new JSONObject();
		 addMappingParam.put("SourceType", channelType);
		 addMappingParam.put("SourceID", channelID);
		 addMappingParam.put("ApplicationID", 4);
		JSONObject info = AbuttUtil.getResponseJSON(ADD_WEIXIN_MAPPING_INFO, addMappingParam.toJSONString());
		if(info==null){
			resultValue="-1";
		}else{
			String status =(String) info.get("Status");
			if("200".equals(status)){
				@SuppressWarnings("unused")
				Map<String,Object> detailInfo = (Map<String,Object>)info.get("DetailInfo");
				String sceneID =(String) detailInfo.get("SceneID");
				resultValue=sceneID;
			}else{
				resultValue="-1";
			}
		}
		return resultValue;
	}
}
