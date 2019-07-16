package com.weixin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weixin.entity.AccessToken;
import com.weixin.entity.Ticket;
import com.weixin.service.ICoreService;
import com.weixin.service.UserService;
import com.weixin.util.AbuttUtil;
import com.weixin.util.MD5Util;
import com.weixin.util.RedisHelper;
import com.weixin.util.SignUtil;
import com.weixin.util.WeixinUtil;

/**
 * 程序入口
 * @author wzy
 * @date 2015-1-4
 * @update devicedID=5
 */
@Controller
@RequestMapping("")
public class ServiceController extends BaseController{
	
	@Autowired
	private ICoreService coreSerivce;
	
	@Autowired
	private UserService userService;
	
	private final String ACTIVITY_LIST = "osmsActivity/getActivityList2";
	private final String USER_ACTIVITY_LIST = "thirdparty/getUserActivityList";
	private final String ACTIVITY_DETAIL = "osmsActivity/getActivityDetail";
	private final String ACTIVITY_DETAIL4 = "osmsActivity/getActivityDetail5";
	private final String USER_APPLY_ACTIVITY="thirdparty/applyActivity";
	private final String CANCEL_APPLY_ACTIVITY= "thirdparty/cancelApplyActivity";
	private final String DOCTOR_DETAIL = "/doctor/getDoctorProfile";
	private final String BIND_USER = "thirdparty/bindUser";
	private final String GET_HOSPITAL_LIST = "webRegister/getHospitalNameList";
	private final String BIND_USER_INFO ="thirdparty/bindUserInfo";
	private final String GET_AUTO_RESPONSE = "autoResponse/getQuestionAnswerResponse";
	private final String GET_INSTITUTION_LIST = "system/getInstitutionListByName";
	private final String GET_ARTICLE_LIST = "article/getArticleList2";
	private final String GET_AETICLE_Detail = "article/getArticleDetail";
	private final String GET_RAFFLE_DETAIL = "raffle/getRaffleDetail";
	private final String GET_ARTICLE_DETAIL="article/getArticleDetail2";
	private final String GET_DOCTOR_PROFILE = "doctor/getDoctorProfile";
	private final String GETINSTITUTION_DETAIL = "institution/getInstitutionByID";
	private final String VIDEO_LIST = "pasm/getVideoPageData";
	
	@RequestMapping("pasm")
	public void checkServer(HttpServletRequest request,HttpServletResponse response){
		//String responseMsg = checkServerImpl(request, response); //验证微信认证
		String responseMsg = coreSerivce.processRequest(request);
		PrintWriter out = null;
		try {
			logger.info("action:"+responseMsg);
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(responseMsg);  
		out.close();
		out = null;
	}
	
	/**
	 * 
	 * @author 闫永林
	 * @date 2016年7月18日
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getActivityListFromMenu")
	public String getActivityListFromMenu(HttpServletRequest request,HttpServletResponse response){
		String jsp = "";
		Integer activityStatus = 1;	
		Integer pageIndex = 1;
		try {
			String s=request.getParameter("code");
			logger.info("------------------1.code:"+s);
			
			String thirdpartyAccount = userService.getOpenID(request, response);
			logger.info("--------获取到的OpenID-------------"+thirdpartyAccount);
			request.setAttribute("thirdpartyAccount", thirdpartyAccount);
			JSONObject param=new JSONObject();
			param.put("DeviceID", 5);
			param.put("ApplicationID", 4);
			param.put("ActivityStatus", activityStatus);
			param.put("PageIndex", pageIndex);
			param.put("PageSize",  5);
			JSONObject resultObject= null; 
			if(activityStatus == -1){
				String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
				if(userId == null || "".equals(userId)){
					
					request.setAttribute("OpenID",thirdpartyAccount);
					request.setAttribute("ActionType", 1);
					return "user/bindAccount";
				}
				param.put("UserID", userId);
				
				
				resultObject=AbuttUtil.getResponseJSON(USER_ACTIVITY_LIST, param.toJSONString());
			}else{
				resultObject =AbuttUtil.getResponseJSON(ACTIVITY_LIST, param.toJSONString()); 
			}
			
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(isResponseOk(status)){
				//添加分页
				Integer dataCount=resultObject.getJSONObject("DetailInfo").getInteger("DataCount");
				request.setAttribute("activityStatus", activityStatus);
				request.setAttribute("pageCount", getPageCount(dataCount, 5));
				request.getSession().setAttribute("pageIndex", pageIndex);
				
				JSONArray listInfo = resultObject.getJSONArray("ListInfo");
				request.setAttribute("activityList", listInfo);
				if(activityStatus == 1){//讲座预告
					jsp = "activity/new_activity";
				}else if(activityStatus == 2){//往期回顾
					jsp = "activity/old_activity";
				}if(activityStatus==-1){
					jsp = "activity/myactivities";//讲座记录
				}
			}else{
				request.setAttribute("errorMsg", errorMsg);
				jsp="member/error";
			}
			return jsp;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.toString());
			return "index";
		}
	}
	
	
	/**
	 * @Description:活动列表
	 * @author wangzhengyi
	 * @date 2014-12-23
	 */
	@RequestMapping("getActivityList")
	public String getActivityList(HttpServletRequest request,Integer activityStatus,Integer pageIndex,String thirdpartyAccount,HttpServletResponse response){
		String jsp = "";
		try {
			request.setAttribute("thirdpartyAccount", thirdpartyAccount);
			JSONObject param=new JSONObject();
			param.put("DeviceID", 5);
			param.put("ApplicationID", 4);
			param.put("ActivityStatus", activityStatus);
			param.put("PageIndex", pageIndex);
			param.put("PageSize",  5);
			JSONObject resultObject= null; 
			if(activityStatus == -1){
				String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
				if(userId == null || "".equals(userId)){
					
					request.setAttribute("OpenID",thirdpartyAccount);
					request.setAttribute("ActionType", 1);
					return "user/bindAccount";
				}
				param.put("UserID", userId);
				
				
				resultObject=AbuttUtil.getResponseJSON(USER_ACTIVITY_LIST, param.toJSONString());
			}else{
				resultObject =AbuttUtil.getResponseJSON(ACTIVITY_LIST, param.toJSONString()); 
			}
			
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(isResponseOk(status)){
				//添加分页
				Integer dataCount=resultObject.getJSONObject("DetailInfo").getInteger("DataCount");
				request.setAttribute("activityStatus", activityStatus);
				request.setAttribute("pageCount", getPageCount(dataCount, 5));
				request.getSession().setAttribute("pageIndex", pageIndex);
				
				JSONArray listInfo = resultObject.getJSONArray("ListInfo");
				request.setAttribute("activityList", listInfo);
				if(activityStatus == 1){//讲座预告
					jsp = "activity/new_activity";
				}else if(activityStatus == 2){//往期回顾
					jsp = "activity/old_activity";
				}if(activityStatus==-1){
					jsp = "activity/myactivities";//讲座记录
				}
			}else{
				request.setAttribute("errorMsg", errorMsg);
				jsp="member/error";
			}
			return jsp;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.toString());
			return "index";
		}
	}
	
	@RequestMapping("getVideoList")
	public String getVideoList(HttpServletRequest request,String ArticleTag, Integer pageIndex,String thirdpartyAccount,HttpServletResponse response){
		String jsp = "";
		try {
			if(pageIndex==null){
				pageIndex = 1;
			}
			request.setAttribute("thirdpartyAccount", thirdpartyAccount);
			JSONObject param=new JSONObject();
			param.put("DeviceID", 5);
			param.put("ApplicationID", 4);
			param.put("SortDirection", "DESC");
			if(StringUtils.isBlank(ArticleTag)){
				request.setAttribute("errorMsg", "视频类型不能为空");
				jsp="member/error";
			}else if(ArticleTag.equals("1")){
				param.put("ArticleTag", "用药管理");
			}else if (ArticleTag.equals("2")){
				param.put("ArticleTag", "动漫系列");
			}else if (ArticleTag.equals("3")){
				param.put("ArticleTag", "百科讲座");
			}else{
				param.put("ArticleTag", ArticleTag);
			}
			
			param.put("PageIndex", pageIndex);
			param.put("PageSize",  6);
			JSONObject resultObject  =AbuttUtil.getResponseJSON(VIDEO_LIST, param.toJSONString()); 
			
			
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(isResponseOk(status)){
				//添加分页
				Integer dataCount=resultObject.getJSONObject("DetailInfo").getInteger("DataCount");
				request.setAttribute("ArticleTag", ArticleTag);
				request.setAttribute("pageIndex", pageIndex);
				request.setAttribute("dataCount", dataCount);
				
				JSONArray listInfo = resultObject.getJSONArray("ListInfo");
				request.setAttribute("videoList", listInfo);
				
				JSONArray bannerList = resultObject.getJSONArray("BannerList");
				request.setAttribute("bannerList", bannerList);
				request.setAttribute("thirdpartyAccount", thirdpartyAccount);
				jsp = "activity/videoList";
			}else{
				request.setAttribute("errorMsg", errorMsg);
				jsp="member/error";
			}
			return jsp;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.toString());
			return "index";
		}
	}
	@RequestMapping("getMoreVideoList")
	public void getMoreVideoList(HttpServletRequest request,HttpServletResponse response){
		String jsp = "";
		try {
			String ArticleTag = request.getParameter("ArticleTag");
			//String thirdpartyAccount =  request.getParameter("thirdpartyAccount");
			Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex")); 
			pageIndex = pageIndex+1;
			JSONObject param=new JSONObject();
			param.put("DeviceID", 5);
			param.put("ApplicationID", 4);
			param.put("SortDirection", "DESC");
			if(StringUtils.isBlank(ArticleTag)){
				request.setAttribute("errorMsg", "视频类型不能为空");
				jsp="member/error";
			}else if(ArticleTag.equals("1")){
				param.put("ArticleTag", "用药管理");
			}else if (ArticleTag.equals("2")){
				param.put("ArticleTag", "动漫系列");
			}else if (ArticleTag.equals("3")){
				param.put("ArticleTag", "百科讲座");
			}else{
				param.put("ArticleTag", ArticleTag);
			}
			
			param.put("PageIndex", pageIndex);
			param.put("PageSize",  6);
			JSONObject resultObject  =AbuttUtil.getResponseJSON(VIDEO_LIST, param.toJSONString()); 
			
			
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(isResponseOk(status)){
				//添加分页
				
				
				
				request.setAttribute("ArticleTag", ArticleTag);
				request.getSession().setAttribute("pageIndex", pageIndex);
				LinkedHashMap<String, Object> map = null;
				if(status == 200){
					JSONArray listInfo = resultObject.getJSONArray("ListInfo");
					map = WeixinUtil.getResponseMap("Bool","200", "获取成功");
					map.put("result", listInfo);
					map.put("pageIndex", pageIndex);
				}else{
					map = WeixinUtil.getResponseMap("Bool","500", "暂无更多数据");
				}
				
				WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
			}else{
				LinkedHashMap<String, Object> map = WeixinUtil.getResponseMap("Bool","500", "获取失败");
				WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LinkedHashMap<String, Object> map = WeixinUtil.getResponseMap("Bool","500", "获取失败");
			WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
		}
	}
	
	@RequestMapping("getVideoDetail")
	public String getVideoDetail(Integer ArticleID,String thirdpartyAccount,HttpServletRequest request, HttpServletResponse response){
		String jsp = "";
		try{
			
			String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
			if(StringUtils.isBlank(userId)){
				userId = "";
			}
			JSONObject param=new JSONObject();
			param.put("DeviceID", 4);
			param.put("ArticleID", ArticleID);
			param.put("ApplicationID","4");
			param.put("UserID",userId);
			
			JSONObject resultObject=AbuttUtil.getResponseJSON(GET_ARTICLE_DETAIL, param.toJSONString());
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(isResponseOk(status)){
				JSONObject jsonObject = resultObject.getJSONObject("DetailInfo");
				request.setAttribute("DetailInfo", jsonObject);
				jsp="activity/videoDetail";
			}else{
				request.setAttribute("errorMsg", errorMsg);
				jsp="member/error";
			}
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("error", e.toString());
			return "index";
		}
		
		return jsp;
	}
	
	/**
	 * @Description:获取更多活动列表
	 * @author wangzhengyi
	 * @date 2014-12-23
	 */
	@RequestMapping("getMoreActivityList")
	public String getMoreActivityList(HttpServletRequest request,Integer activityStatus,Integer pageIndex,String thirdpartyAccount,Integer origin,HttpServletResponse response){
		pageIndex = pageIndex + 1;
		JSONObject param=new JSONObject();
		param.put("ApplicationID", 4);
		param.put("DeviceID", 5);
		param.put("ActivityStatus", activityStatus);
		param.put("PageIndex", pageIndex);
		param.put("PageSize",  5);
		JSONObject resultObject = null;
		if(origin == 3){
			
			String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
			if(userId == null || "".equals(userId)){
				
				request.setAttribute("OpenID",thirdpartyAccount);
				request.setAttribute("ActionType", 1);
				return "user/bindAccount";
			}
			param.put("UserID", userId);
			
			
			resultObject=AbuttUtil.getResponseJSON(USER_ACTIVITY_LIST, param.toJSONString());
		}else{
			 resultObject=AbuttUtil.getResponseJSON(ACTIVITY_LIST, param.toJSONString());
		}
		int status = resultObject.getIntValue("Status");
		if(isResponseOk(status)){
			request.setAttribute("activityStatus", activityStatus);
			request.getSession().setAttribute("pageIndex", pageIndex);
			LinkedHashMap<String, Object> map = null;
			if(status == 200){
				JSONArray listInfo = resultObject.getJSONArray("ListInfo");
				String htmlCode = coreSerivce.montageHTML(listInfo,activityStatus,thirdpartyAccount,origin);
				map = WeixinUtil.getResponseMap("Bool","200", htmlCode);
				map.put("result", resultObject.get("result"));
				map.put("pageIndex", pageIndex);
			}else{
				map = WeixinUtil.getResponseMap("Bool","500", "暂无更多数据");
			}
			
			WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
		}
		
		return null;
	}
	
	@RequestMapping("getUserActivityList")
	public String getUserActivityList(HttpServletRequest request,Integer activityStatus,Integer pageIndex,String thirdpartyAccount,HttpServletResponse response){
		String jsp = "";
		try {
			String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
			if(userId == null || "".equals(userId)){
				
				request.setAttribute("OpenID",thirdpartyAccount);
				request.setAttribute("ActionType", 1);
				return "user/bindAccount";
			}
			request.setAttribute("userId", userId);
			JSONObject param=new JSONObject();
			param.put("UserID", userId);
			param.put("ActivityStatus", activityStatus);
			param.put("ApplicationID", 4);
			param.put("PageIndex", pageIndex);
			param.put("PageSize",  5);
			JSONObject resultObject = AbuttUtil.getResponseJSON(USER_ACTIVITY_LIST, param.toJSONString());
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(isResponseOk(status)){
				//添加分页
				Integer dataCount=resultObject.getJSONObject("DetailInfo").getInteger("DataCount");
				request.setAttribute("activityStatus", activityStatus);
				request.setAttribute("pageCount", getPageCount(dataCount, 5));
				request.getSession().setAttribute("pageIndex", pageIndex);
				JSONArray listInfo = resultObject.getJSONArray("ListInfo");
				request.setAttribute("activityList", listInfo);
				request.setAttribute("thirdpartyAccount", thirdpartyAccount);
				jsp = "activity/myactivities";
			}else{
				jsp = "activity/myactivities";
			}
			return jsp;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.toString());
			return "index";
		}
	}
	
	/**
	 * 活动详情
	 * @param request
	 * @param activityId
	 * @param activityStatus
	 * @param origin 来源：1：最新活动，2 经典回顾，3 我的活动
	 * @param response
	 * @return
	 */
	@RequestMapping("getActivityDetail")
	public String getActvityDetail(HttpServletRequest request,Integer activityId,Integer activityStatus,String thirdpartyAccount,String origin,HttpServletResponse response){
		String jsp = "";
		String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
		try {
			JSONObject param=new JSONObject();
			param.put("DeviceID", 5);
			param.put("ApplicationID", 4);
			param.put("ActivityID", activityId);
			if(userId != null && !userId.equals("")){
				param.put("UserID", userId);
			}
			JSONObject resultObject=AbuttUtil.getResponseJSON(ACTIVITY_DETAIL4, param.toJSONString());
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(isResponseOk(status)){
				JSONObject jsonObject = resultObject.getJSONObject("DetailInfo");
				request.setAttribute("activity", jsonObject);
				request.getSession().setAttribute("activityName", jsonObject.getString("ActivityName"));
				request.setAttribute("activityStatus", activityStatus);
				request.setAttribute("activityId", activityId);
				request.setAttribute("thirdpartyAccount", thirdpartyAccount);
				request.setAttribute("userId", userId);
				request.setAttribute("origin", origin);
				jsp="activity/details_activity";
			}else{
				request.setAttribute("errorMsg", errorMsg);
				jsp="index";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsp;
	}
	
	@RequestMapping("userApplyActivity")
	public void userApplyActivity(HttpServletRequest request,HttpServletResponse response){
		//String activityId,Integer activityStatus,String thirdpartyAccount,Integer origin,
		String activityId = request.getParameter("activityId");
		Integer activityStatus = Integer.parseInt(request.getParameter("activityStatus"));
		String thirdpartyAccount = request.getParameter("thirdpartyAccount");
		String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
		LinkedHashMap<String, Object> map = null;
		if(userId == null || "".equals(userId)){
			String link = "getActivityDetail?activityId="+activityId+"~activityStatus="+activityStatus+"~thirdpartyAccount="+thirdpartyAccount;
			request.setAttribute("thirdpartyAccount", thirdpartyAccount);
			request.setAttribute("link", link);
			map = WeixinUtil.getResponseMap("Bool","404", link);
		}else{
			JSONObject param=new JSONObject();
			param.put("ActivityID", activityId);
			param.put("UserID", userId);
			param.put("ApplicationID", 4);
			param.put("DeviceID", 5);
			JSONObject resultObject= AbuttUtil.getResponseJSON(USER_APPLY_ACTIVITY, param.toJSONString());
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(isResponseOk(status)){
				map = WeixinUtil.getResponseMap("Bool","200", "报名成功");
			}else{
				map = WeixinUtil.getResponseMap("Bool","500", "报名失败，	请稍后重试。");
			}
		}
		WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
	}
	
	@RequestMapping("cencelApplyActivity")
	public void cencelApplyActivity(HttpServletRequest request,Integer activityId,Integer activityStatus,Integer origin,String thirdpartyAccount,HttpServletResponse response){
		String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
		JSONObject param=new JSONObject();
		param.put("DeviceID", 5);
		param.put("ActivityID", activityId);
		param.put("UserID", userId);
		param.put("ApplicationID", 4);
		JSONObject resultObject=AbuttUtil.getResponseJSON(CANCEL_APPLY_ACTIVITY, param.toJSONString());
		int status = resultObject.getIntValue("Status");
		String errorMsg = resultObject.getString("Message");
		LinkedHashMap<String, Object> map = null;
		if(isResponseOk(status)){
			map = WeixinUtil.getResponseMap("Bool","200", "取消成功");
		}else{
			map = WeixinUtil.getResponseMap("Bool","500", "取消失败，请稍后重试。");
		}
		WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
	}
	
	@RequestMapping("getDoctorDetail")
	public String getDoctorDetail(HttpServletRequest request,Integer doctorId,Integer activityStatus,HttpServletResponse response){
		String jsp ="";
		JSONObject param=new JSONObject();
		param.put("DeviceID", 5);
		param.put("DoctorID", doctorId);
		JSONObject resultObject=AbuttUtil.getResponseJSON(DOCTOR_DETAIL, param.toJSONString());
		int status = resultObject.getIntValue("Status");
		String errorMsg = resultObject.getString("Message");
		if(isResponseOk(status)){
			JSONObject jsonObject = resultObject.getJSONObject("DetailInfo");
			request.setAttribute("doctor", jsonObject);
			request.setAttribute("activityStatus", activityStatus);
			jsp="activity/doctor_detail";
		}else{
			request.setAttribute("errorMsg", errorMsg);
			jsp="member/error";
		}
		return jsp;
	}
	
	private String checkServerImpl(HttpServletRequest request,HttpServletResponse response){
		String signature = request.getParameter("signature"); //微信加密密匙
		String timestamp = request.getParameter("timestamp"); //时间戳
		String nonce = request.getParameter("nonce"); //随机数
		String echostr = request.getParameter("echostr");//随机字符串
        // 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败  
        if (SignUtil.checkSignature(signature, timestamp, nonce)) {  
            return echostr;  
        }  
        return "";
	}
	
	@RequestMapping("bindUserUrl")
	public String bindUserUrl(HttpServletRequest request,String thirdpartyAccount,String link,HttpServletResponse response){
		request.setAttribute("thirdpartyAccount", thirdpartyAccount);
		if(link.indexOf("~") > 0){
			link = link.replaceAll("~", "&");
		}
		request.setAttribute("link", link);
		return "activity/user_bind";
	}
	
	@RequestMapping("bindUser")
	public void bindUser(HttpServletRequest request,HttpServletResponse response){
		logger.info("binduser method");
		try {
			JSONObject param=new JSONObject();
			param.put("LoginID",request.getParameter("loginId"));
			param.put("Password",  MD5Util.MD5(request.getParameter("password")));
			param.put("ApplicationID", 4);
			param.put("ThirdPartyAccount", request.getParameter("thirdpartyAccount"));
			param.put("DeviceID", 5);
			JSONObject resultObject=AbuttUtil.getResponseJSON(BIND_USER, param.toJSONString());
			int status = resultObject.getIntValue("Status");
			String message = resultObject.getString("Message");
			LinkedHashMap<String, Object> map = null;
			if(status == 200){
				map = WeixinUtil.getResponseMap( "Bool","200", "绑定成功！");
				map.put("result", resultObject.get("result"));
			}else{
				map = WeixinUtil.getResponseMap("Bool","500", message);
			}
			WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("everydayKnownIntroduceURL")
	public String everydayKnownIntroduceURL(HttpServletRequest request,String thirdpartyAccount,String link,HttpServletResponse response){
		request.setAttribute("thirdpartyAccount", thirdpartyAccount);
		request.setAttribute("link", link);
		return "activity/postoperation_introduce";
	}
	
	/**
	 * 术后天天知
	 * @param request
	 * @param thirdpartyAccount
	 * @param response
	 * @return
	 */
	@RequestMapping("everydayKnown")
	public String everydayKnown(HttpServletRequest request,String thirdpartyAccount,HttpServletResponse response){
		String userId = coreSerivce.checkAccountIsBind(thirdpartyAccount);
		JSONObject resultObject = coreSerivce.checkAccountHasMedicalHistory(userId);
		logger.info("resultObject:"+resultObject);
		JSONObject jsonObject = resultObject.getJSONObject("DetailInfo");
		
		if(resultObject.getInteger("Status") == 200){
			if(WeixinUtil.isNull(jsonObject.getString("Instrument")) || WeixinUtil.isNull(jsonObject.getString("SurgicalTime"))){
				request.setAttribute("thirdpartyAccount", thirdpartyAccount);
				return "activity/register_info";
			}else if(jsonObject.getInteger("Instrument") != 1){
				request.setAttribute("message", "您好！该内容目前暂无法提供！");
				return "index";
			}else{
				String surgicalTime = jsonObject.getString("SurgicalTime");
				Integer days = coreSerivce.fromToday(surgicalTime);
				request.getSession().setAttribute("maxDay", days);
				if(days > 7){
					Integer weeks = coreSerivce.daysToWeek(days);
					if(weeks > 52){
						return  "postoperation/week_52";
					}
					request.getSession().setAttribute("maxWeek", weeks);
					return  "postoperation/week_" + weeks;
				}
				return "postoperation/everyday_" + days;
			}
		}
		request.setAttribute("message", "服务器出错");
		return "index";
	}
	
	@RequestMapping("bindUserInfo")
	public void bindUserInfo(HttpServletRequest request,HttpServletResponse response){
		System.out.println(request.getParameter("thirdpartyAccount"));
		String userId = coreSerivce.checkAccountIsBind(request.getParameter("thirdpartyAccount"));
		//获取参数
		JSONObject param=new JSONObject();
		param.put("InstitutionID", request.getParameter("InstitutionID"));
		param.put("PreviousHistory", request.getParameter("PreviousHistory"));
		param.put("Instrument", request.getParameter("Instrument"));
		param.put("SurgicalTime", request.getParameter("SurgicalTime"));
		param.put("AreaID", request.getParameter("AreaID"));
		param.put("Street", request.getParameter("Street"));
		param.put("UserID", userId);
		JSONObject resultObject = AbuttUtil.getResponseJSON(BIND_USER_INFO, param.toJSONString());
		int status = resultObject.getIntValue("Status");
		String message = resultObject.getString("Message");
		LinkedHashMap<String, Object> map = null;
		if(status == 200){
			map = WeixinUtil.getResponseMap( "Bool","200", "绑定成功！");
			map.put("result", resultObject.get("result"));
		}else{
			map = WeixinUtil.getResponseMap("Bool","500", message);
		}
		WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
	}
	
	@RequestMapping("getHospitalList")
	public void getHospitalNameList(HttpServletRequest request,HttpServletResponse response){
		logger.info("getHospitalList() method");
		
		try {
			String HospitalName = request.getParameter("HospitalName");
			if(!"".equals(HospitalName) && HospitalName != null){
				HospitalName = HospitalName.trim();
			}
			
			//获取参数
			JSONObject param=new JSONObject();
			param.put("HospitalName", HospitalName);
			System.out.println(param);
			
			//获取医院列表
			JSONObject resultObject = AbuttUtil.getResponseJSON(GET_HOSPITAL_LIST, param.toJSONString());
			System.out.println(resultObject);
			int status = resultObject.getIntValue("Status");
			if(status == 200){
				JSONArray listInfo = resultObject.getJSONArray("ListInfo");
				JSONObject returnObject = new JSONObject();
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/json;charset=UTF-8");
				returnObject.put("data", listInfo);
				System.out.println(returnObject.toJSONString());
				response.getWriter().write(returnObject.toJSONString());
				response.getWriter().flush();
				response.getWriter().close();
			}else{
				throw new RuntimeException();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("getInstitutionList")
	public void getInstitutionList(HttpServletRequest request,HttpServletResponse response){
		logger.info("getInstitutionList() method");
		LinkedHashMap<String, Object> map = null;
		try {
			String InstitutionName = request.getParameter("InstitutionName");
			if(!"".equals(InstitutionName) && InstitutionName != null){
				InstitutionName = InstitutionName.trim();
			}
			
			//获取参数
			JSONObject param=new JSONObject();
			param.put("InstitutionName", InstitutionName);
			
			//获取医院列表
			JSONObject resultObject = AbuttUtil.getResponseJSON(GET_INSTITUTION_LIST, param.toJSONString());
			System.out.println(resultObject);
			int status = resultObject.getIntValue("Status");
			if(status == 200){
				JSONArray listInfo = resultObject.getJSONArray("ListInfo");
				String institutionHTML = coreSerivce.montageInstitutionHTML(listInfo);
				map = WeixinUtil.getResponseMap("Bool","200", institutionHTML);
			}else{
				map = WeixinUtil.getResponseMap("Bool","500", "暂无更多数据");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
	}
	
	/**
	 * 常见问题
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("askedQuestions")
	public String askedQuestions(HttpServletRequest request,HttpServletResponse response){
		try{
			JSONObject autoParam = new JSONObject();
			autoParam.put("ApplicationID", 4);
			autoParam.put("Question", "");
			logger.info("**************************请求参数："+autoParam.toJSONString());
			JSONObject resultObject = AbuttUtil.getResponseJSON(GET_AUTO_RESPONSE, autoParam.toJSONString());
			
			int status = resultObject.getIntValue("Status");
			//String errorMsg = resultObject.getString("Message");
			if(status == 200){
				JSONArray responseArray =  resultObject.getJSONArray("ListInfo");
				request.setAttribute("askedQuestions", responseArray);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "activity/asked_question";
	}
	
	@RequestMapping("getArticleList")
	public String getArticleList(HttpServletRequest request,HttpServletResponse response){
		try{
			JSONObject articleParam = new JSONObject();
			articleParam.put("DeviceID", 5);
			articleParam.put("ApplicationID", 4);
			articleParam.put("ACIDList", 1);
			articleParam.put("PageIndex", 1);
			articleParam.put("PageSize",15);
			articleParam.put("RefreshTime", new Date());
			articleParam.put("SortDirection", "DESC");
			JSONObject resultObject = AbuttUtil.getResponseJSON(GET_ARTICLE_LIST, articleParam.toJSONString());
			int status = resultObject.getIntValue("Status");
			if(status == 200){
				//添加分页
				Integer dataCount=resultObject.getJSONObject("DetailInfo").getInteger("DataCount");
				JSONArray responseArray =  resultObject.getJSONArray("ListInfo");
				request.setAttribute("articleList", responseArray);
				request.setAttribute("pageCount", getPageCount(dataCount, 15));
				request.setAttribute("pageIndex", 1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "article/article_list";
	}
	
	
	/**
	 * @param request
	 * @param response
	 */
	@RequestMapping("getMoreArticleList")
	public void getMoreArticleList(HttpServletRequest request,HttpServletResponse response){
		try{
			Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
			JSONObject articleParam = new JSONObject();
			articleParam.put("DeviceID", 5);
			articleParam.put("ApplicationID", 4);
			articleParam.put("ACIDList", 1);
			articleParam.put("PageIndex", pageIndex);
			articleParam.put("PageSize",15);
			articleParam.put("RefreshTime", new Date());
			articleParam.put("SortDirection", "DESC");
			JSONObject resultObject = AbuttUtil.getResponseJSON(GET_ARTICLE_LIST, articleParam.toJSONString());
			int status = resultObject.getIntValue("Status");
			LinkedHashMap<String, Object> map = null;
			if(status == 200){
				JSONArray responseArray =  resultObject.getJSONArray("ListInfo");
				String htmlStr = coreSerivce.montageArticleHTML(responseArray);
				map = WeixinUtil.getResponseMap("Bool","200", htmlStr);
				map.put("result", resultObject.get("result"));
				map.put("pageIndex", pageIndex);
			}else{
				map = WeixinUtil.getResponseMap("Bool","500", "暂无更多数据");
			}
			WeixinUtil.outJsonString(WeixinUtil.putResult(map),response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("getArticleDetail")
	public String getArticleDetail(HttpServletRequest request,Integer articleID,HttpServletResponse response){
		try{
			JSONObject articleParam = new JSONObject();
			articleParam.put("ArticleID", articleID);
			JSONObject resultObject = AbuttUtil.getResponseJSON(GET_AETICLE_Detail, articleParam.toJSONString());
			int status = resultObject.getIntValue("Status");
			if(status == 200){
				JSONObject responseObject =  resultObject.getJSONObject("DetailInfo");
				request.setAttribute("article", responseObject);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "article/article_detail";
	}
	
	
	@RequestMapping("getRaffleDetail")
	public String getRaffleDetail(HttpServletRequest request,Integer raffleID,HttpServletResponse response){
		JSONObject paramMap = new JSONObject();
		paramMap.put("DeviceID", 5);
		paramMap.put("ApplicationID", 4);
		paramMap.put("RaffleID", raffleID);
		paramMap.put("UserID", "-1");
		paramMap.put("LoginToken", "");
		JSONObject resultObject = AbuttUtil.getResponseJSON(GET_RAFFLE_DETAIL, paramMap.toJSONString());
		int status = resultObject.getIntValue("Status");
		if(status == 200){
			String img_path = WeixinUtil.getProperties("img_path");
			request.setAttribute("img_path", img_path);
			JSONObject responseObject =  resultObject.getJSONObject("DetailInfo");
			request.setAttribute("raffle", responseObject);
		}
		return "activity/lottery_activity";
	}
	
	
	
	public static void main(String[] args) {
		String advice = "subUser/edit";
		JSONObject jsonParam = new JSONObject();
		jsonParam.put("ApplicationID", 4);
		jsonParam.put("LoginID","13120499565");
		jsonParam.put("Content", "我提建议");
		jsonParam.put("ContactInfo", "110");
		jsonParam.put("ApplicationID", 4);
		jsonParam.put("DeviceID", 4);
		jsonParam.put("OSVersion", "iphone");
		jsonParam.put("DeviceModel", "6 Plus");
		jsonParam.put("Sequence", "asc");
		String str = "{'ContactPhone2':'','DeviceID':'2','ContactPhone1':'15222222222','Password':'123456','AccountName':'囖哦','UserID':'12433','RelationType':'1','LoginToken':'fe60ed21-5be8-4396-9574-78013f2dbdd2','ApplicationID':'4','SubAccount':'18610642317-1'}";
		JSONObject resultObject = AbuttUtil.getResponseJSON(advice, str);
		System.out.println(resultObject);
		
		int status = resultObject.getIntValue("Status");
		
	}
	
	
	
	@RequestMapping("goJoinActivityApp")
	public String goJoinActivityApp(HttpServletRequest request,Integer activityId,Integer activityStatus,String thirdpartyAccount,String origin,HttpServletResponse response){
		String jsp = "activity/join_activity_app";
		return jsp;
	}
	
	@RequestMapping("goJoinActivityWeChat")
	public String goJoinActivityWeChat(HttpServletRequest request,Integer activityId,Integer activityStatus,String thirdpartyAccount,String origin,HttpServletResponse response){
		String jsp = "activity/join_activity_wechat";
		return jsp;
	}
	
	
	/**
	 * 获取带参数二维码的信息
	 * @author 闫永林
	 * @date 2016年2月22日
	 * @param request
	 * @param response
	 */
	
	/*@RequestMapping("getTicketInfo")
	public void getTicketInfo(HttpServletRequest request,HttpServletResponse response){
		logger.info("------------------getTicketInfo-------------");
		
		String responseMsg ="";
		boolean flag = false;
		
		String channelType = request.getParameter("SourceType");
		String channelID = request.getParameter("SourceID");
		
		
		
		if(StringUtils.isNotBlank(channelType)&&StringUtils.isNotBlank(channelID)){
			if(channelType.equals("1")){
				//获取医生
				JSONObject params = new JSONObject();
				params.put("DoctorID",channelID);
				params.put("ApplicationID", 4);
				JSONObject doctorJsonObject = AbuttUtil.getResponseJSON(GET_DOCTOR_PROFILE, params.toJSONString());
				if(doctorJsonObject!=null&&doctorJsonObject.getJSONObject("DetailInfo")!=null&&StringUtils.isNotBlank(doctorJsonObject.getJSONObject("DetailInfo").getString("DoctorCode"))){
//					String RecordCreateTime = doctorJsonObject.getJSONObject("DetailInfo").getString("RecordCreateTime");
//					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//					
//					try {
//						RecordCreateTime = df.format(df.parse(RecordCreateTime));
//					} catch (ParseException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//					System.out.println("RecordCreateTime:"+RecordCreateTime);
//					
//					responseMsg = WeixinUtil.getTicketMd5Info(channelID, RecordCreateTime);
					responseMsg = channelType+"_"+doctorJsonObject.getJSONObject("DetailInfo").getString("DoctorCode");
					flag = true;
				}else{
					responseMsg = "没有获取到医生信息或DoctorCode";
				}
			}else if(channelType.equals("2")){
				//获取医院
				JSONObject params = new JSONObject();
				params.put("InstitutionID",channelID);
				params.put("ApplicationID", 4);
				JSONObject doctorJsonObject = AbuttUtil.getResponseJSON(GETINSTITUTION_DETAIL, params.toJSONString());
				if(doctorJsonObject!=null&&doctorJsonObject.getJSONObject("DetailInfo")!=null&&StringUtils.isNotBlank(doctorJsonObject.getJSONObject("DetailInfo").getString("institutionCode"))){
//					String RecordCreateTime = doctorJsonObject.getJSONObject("DetailInfo").getString("recordCreateTime");
//					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//					
//					try {
//						RecordCreateTime = df.format(df.parse(RecordCreateTime));
//					} catch (ParseException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//					System.out.println("RecordCreateTime:"+RecordCreateTime);
//					
//					responseMsg = WeixinUtil.getTicketMd5Info(channelID, RecordCreateTime);
					responseMsg = channelType+"_"+doctorJsonObject.getJSONObject("DetailInfo").getString("institutionCode");
					flag = true;
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
	
	@RequestMapping("getQRPictureInfo")
	public String getQRPictureInfo(HttpServletRequest request,HttpServletResponse response){
		logger.info("------------------getQRPictureInfo-------------");
		
		String responseMsg ="";
		boolean flag = false;
		
		String channelType = request.getParameter("SourceType");
		String channelID = request.getParameter("SourceID");
		
		
		
		if(StringUtils.isNotBlank(channelType)&&StringUtils.isNotBlank(channelID)){
			if(channelType.equals("1")){
				//获取医生
				JSONObject params = new JSONObject();
				params.put("DoctorID",channelID);
				params.put("ApplicationID", 4);
				JSONObject doctorJsonObject = AbuttUtil.getResponseJSON(GET_DOCTOR_PROFILE, params.toJSONString());
				if(doctorJsonObject!=null&&doctorJsonObject.getJSONObject("DetailInfo")!=null&&StringUtils.isNotBlank(doctorJsonObject.getJSONObject("DetailInfo").getString("DoctorCode"))){
//					String RecordCreateTime = doctorJsonObject.getJSONObject("DetailInfo").getString("RecordCreateTime");
//					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//					
//					try {
//						RecordCreateTime = df.format(df.parse(RecordCreateTime));
//					} catch (ParseException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//					System.out.println("RecordCreateTime:"+RecordCreateTime);
//					
//					responseMsg = WeixinUtil.getTicketMd5Info(channelID, RecordCreateTime);
					responseMsg = channelType+"_"+doctorJsonObject.getJSONObject("DetailInfo").getString("DoctorCode");
					flag = true;
				}else{
					responseMsg = "没有获取到医生信息或DoctorCode";
				}
			}else if(channelType.equals("2")){
				//获取医院
				JSONObject params = new JSONObject();
				params.put("InstitutionID",channelID);
				params.put("ApplicationID", 4);
				JSONObject doctorJsonObject = AbuttUtil.getResponseJSON(GETINSTITUTION_DETAIL, params.toJSONString());
				if(doctorJsonObject!=null&&doctorJsonObject.getJSONObject("DetailInfo")!=null&&StringUtils.isNotBlank(doctorJsonObject.getJSONObject("DetailInfo").getString("institutionCode"))){
//					String RecordCreateTime = doctorJsonObject.getJSONObject("DetailInfo").getString("recordCreateTime");
//					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//					
//					try {
//						RecordCreateTime = df.format(df.parse(RecordCreateTime));
//					} catch (ParseException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//					System.out.println("RecordCreateTime:"+RecordCreateTime);
//					
//					responseMsg = WeixinUtil.getTicketMd5Info(channelID, RecordCreateTime);
					responseMsg = channelType+"_"+doctorJsonObject.getJSONObject("DetailInfo").getString("institutionCode");
					flag = true;
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
	*/
	
	@RequestMapping("getAccessToken")
	public void getAccessToken(HttpServletRequest request,HttpServletResponse response){
		logger.info("getAccessToken");
		String accessToken = "";
		int expiresIn = 0;
		//获取AccessToken
		String code=request.getParameter("code");
		String fource = request.getParameter("fource");
		if(StringUtils.isNotBlank(code)&&code.equals("oGPNrJbxpIBDlh")){
			try{
				AccessToken acToken = null;
				if(StringUtils.isNotBlank(fource)&&fource.equals("1")){
					acToken = WeixinUtil.getAccessTokenForce();
				}else{
					acToken = WeixinUtil.getAccessToken();
				}
				if(acToken!=null){
					accessToken = acToken.getToken();
					expiresIn = acToken.getExpiresIn();
				}else{
					logger.info("没有获取到AccessToken");
				}
				
			}catch(Exception e){e.printStackTrace();}
			
		} 
        
		LinkedHashMap<String ,Object> map = WeixinUtil.getResponseMap("Detail", "200", "获取accessToken");
		map.put("AccessToken", accessToken);
		map.put("ExpiresIn", expiresIn);
		WeixinUtil.outJsonString(WeixinUtil.putResult(map), response);
	}
	
	@RequestMapping("weeklySale")
	public void weeklySale(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String weeklySaleUrl = "";
		RedisHelper r=RedisHelper.getInstance();
		if(r.existsKey("weeklySaleUrl")){
		    weeklySaleUrl = r.getValue("weeklySaleUrl");			
		};
		response.sendRedirect(weeklySaleUrl);
	}
}
